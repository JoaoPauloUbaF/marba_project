import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import axios from "axios";

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

// Modificação da função para onCall
export const getAddressFromPlaceIdCallable = functions.https.onCall(async (data, context) => {
  try {
    const {placeId} = data;
    const apiKey = functions.config().googlemaps.key;

    if (!placeId) {
      throw new functions.https.HttpsError("invalid-argument", "Place ID is required");
    }

    const response = await axios.get("https://maps.googleapis.com/maps/api/geocode/json", {
      params: {
        place_id: placeId,
        key: apiKey,
      },
    });

    if (response.data.status === "OK" && response.data.results.length > 0) {
      return response.data.results[0]; // Retorna diretamente o primeiro resultado da API
    } else {
      throw new functions.https.HttpsError("not-found", "Address not found");
    }
  } catch (error) {
    throw new functions.https.HttpsError("internal", "Error fetching address");
  }
});

export const getAddressFromCoordinatesCallable = functions.https.onCall(async (data, context) => {
  try {
    const {latitude, longitude} = data;
    const apiKey = functions.config().googlemaps.key;

    if (!latitude || !longitude) {
      throw new functions.https.HttpsError("invalid-argument", "Latitude and longitude are required");
    }

    const response = await axios.get("https://maps.googleapis.com/maps/api/geocode/json", {
      params: {
        latlng: `${latitude},${longitude}`,
        key: apiKey,
      },
    });

    if (response.data.status === "OK" && response.data.results.length > 0) {
      return response.data.results[0]; // Retorna diretamente o primeiro resultado da API
    } else {
      throw new functions.https.HttpsError("not-found", "Address not found");
    }
  } catch (error) {
    throw new functions.https.HttpsError("internal", "Error fetching address");
  }
});

export const getAutocompletePredictions = functions.https.onCall(async (data, context) => {
  try {
    const {input} = data;
    const apiKey = functions.config().googlemaps.key;

    if (!input) {
      throw new functions.https.HttpsError("invalid-argument", "Input is required");
    }

    const response = await axios.get("https://maps.googleapis.com/maps/api/place/autocomplete/json", {
      params: {
        input: input,
        key: apiKey,
      },
    });

    if (response.data.status === "OK" && response.data.predictions.length > 0) {
      return response.data.predictions;
    } else {
      throw new functions.https.HttpsError("not-found", "No predictions found");
    }
  } catch (error) {
    throw new functions.https.HttpsError("internal", "Error fetching predictions");
  }
});
