import * as ordersService from "../services/ordersService";
import {handleOrderStatusChange} from "../services/ordersService";

export const canUserWriteBusinessReview = async (data: any) => {
  const {userId, businessId} = data;

  if (!userId || !businessId) {
    throw new Error("Missing userId or businessId");
  }

  const canWrite = await ordersService.canWriteBusinessReview(userId, businessId);
  return {canWrite};
};

export const onBusinessOrderStatusChange = async (change: any, context: any) => {
  const before = change.before.data();
  const after = change.after.data();

  if (before.status !== after.status && after.status === "accepted") {
    await handleOrderStatusChange(context.params.orderId);
  }
};
