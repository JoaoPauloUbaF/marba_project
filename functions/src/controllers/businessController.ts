import {Change, EventContext} from "firebase-functions";
import {DocumentSnapshot} from "firebase-functions/v2/firestore";
import * as businessService from "../services/businessService";

export const calculateAverageRating = async (
  change: Change<DocumentSnapshot>,
  context: EventContext
) => {
  const businessId = context.params.businessId;
  await businessService.updateAverageRating(businessId);
};

export const calculateReviewDistribution = async (
  change: Change<DocumentSnapshot>,
  context: EventContext
) => {
  const businessId = context.params.businessId;
  await businessService.updateReviewDistribution(businessId);
};


