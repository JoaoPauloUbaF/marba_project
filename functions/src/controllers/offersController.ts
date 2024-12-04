import {Change, EventContext} from "firebase-functions";
import {DocumentSnapshot} from "firebase-functions/v2/firestore";

import * as offersService from "../services/offersService";

export const calculateOfferAverageRating = async (
  change: Change<DocumentSnapshot>,
  context: EventContext
) => {
  const offerId = context.params.offerId;
  await offersService.updateAverageRating(offerId);
};

export const calculateOfferReviewDistribution = async (
  change: Change<DocumentSnapshot>,
  context: EventContext
) => {
  const offerId = context.params.offerId;
  await offersService.updateReviewDistribution(offerId);
};

