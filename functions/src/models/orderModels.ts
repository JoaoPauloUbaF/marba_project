// orderModels.ts

export interface BusinessOrderItem {
  id: string;
  businessOrderId: string;
  name: string;
  imageUrl: string;
  price: number;
  cost: number;
  quantity: number;
  status: BusinessOrderItemStatus;
}

export enum BusinessOrderItemStatus {
  pending = "pending",
  preparing = "preparing",
  delivering = "delivering",
  delivered = "delivered",
  done = "done",
  canceled = "canceled",
}

export interface BusinessOrder {
  id: string;
  businessId: string;
  userNickname: string;
  address: any; // Defina a interface para AddressModel conforme necessário
  items: BusinessOrderItem[];
  status: BusinessOrderStatus;
  createdAt: FirebaseFirestore.Timestamp;
  updatedAt: FirebaseFirestore.Timestamp;
  canceledAt?: FirebaseFirestore.Timestamp;
}

export enum BusinessOrderStatus {
  waitingConfirmation = "waitingConfirmation",
  accepted = "accepted",
  preparing = "preparing",
  delivering = "delivering",
  delivered = "delivered",
  done = "done",
  canceled = "canceled",
}

export interface BusinessSale {
  businessId: string;
  totalAmount: number;
  totalCost: number;
  createdAt: FirebaseFirestore.FieldValue;
}
