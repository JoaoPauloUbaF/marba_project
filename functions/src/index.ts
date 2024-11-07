import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {calculateAverageRating, calculateReviewDistribution} from "./controllers/businessController";
import {canUserWriteBusinessReview, onBusinessOrderStatusChange} from "./controllers/ordersController";
import {calculateOfferAverageRating, calculateOfferReviewDistribution} from "./controllers/offersController";

admin.initializeApp();
export const calculateAverageRatingFunction = functions.firestore
  .document("businesses/{businessId}/reviews/{reviewId}")
  .onWrite(calculateAverageRating);

export const calculateReviewDistributionFunction = functions.firestore
  .document("businesses/{businessId}/reviews/{reviewId}")
  .onWrite(calculateReviewDistribution);

export const canUserWriteBusinessReviewFunction = functions.https.onCall(canUserWriteBusinessReview);

export const onBusinessOrderStatusChangeFunction = functions.firestore
  .document("business_orders/{orderId}")
  .onUpdate(onBusinessOrderStatusChange);

export const calculateOfferAverageRatingFunction = functions.firestore
  .document("offers/{offerId}/reviews/{reviewId}")
  .onWrite(calculateOfferAverageRating);

export const calculateOfferReviewDistributionFunction = functions.firestore
  .document("offers/{offerId}/reviews/{reviewId}")
  .onWrite(calculateOfferReviewDistribution);
