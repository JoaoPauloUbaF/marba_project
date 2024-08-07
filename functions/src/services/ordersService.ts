import * as admin from "firebase-admin";
import {BusinessOrder, BusinessOrderItem, BusinessSale, BusinessOrderStatus} from "../models/orderModels";

export const getUserOrders = async (userId: string) => {
  const userOrdersSnapshot = await admin.firestore()
    .collection("orders")
    .where("customerId", "==", userId)
    .get();

  return userOrdersSnapshot.docs.map((doc) => doc.data());
};

export const getBusinessOrderById = async (orderId: string) => {
  const businessOrderSnapshot = await admin.firestore()
    .collection("business_orders")
    .doc(orderId)
    .get();

  return businessOrderSnapshot.exists ? businessOrderSnapshot.data() : null;
};

export const canWriteBusinessReview = async (userId: string, businessId: string): Promise<boolean> => {
  const userOrders = await getUserOrders(userId);

  for (const order of userOrders) {
    for (const businessOrderId of order.businessOrdersIds) {
      const businessOrder = await getBusinessOrderById(businessOrderId);
      if (businessOrder && businessOrder.businessId === businessId) {
        return true;
      }
    }
  }

  return false;
};

export const createBusinessSale = async (order: BusinessOrder) => {
  const totalAmount = order.items.reduce((sum: number, item: BusinessOrderItem) => sum + (item.price * item.quantity), 0);
  const totalCost = order.items.reduce((sum: number, item: BusinessOrderItem) => sum + (item.cost * item.quantity), 0);
  const sale: BusinessSale = {
    businessId: order.businessId,
    totalAmount: totalAmount,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    totalCost: totalCost,
  };

  await admin.firestore().collection("business_sales").add(sale);
};

export const handleOrderStatusChange = async (orderId: string) => {
  const orderSnapshot = await admin.firestore().collection("business_orders").doc(orderId).get();
  const order = orderSnapshot.data() as BusinessOrder;

  if (order && order.status === BusinessOrderStatus.accepted) {
    await createBusinessSale(order);
  }
};
