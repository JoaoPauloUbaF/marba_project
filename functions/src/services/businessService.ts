import * as admin from "firebase-admin";

admin.initializeApp();

export const updateAverageRating = async (businessId: string) => {
  const reviewsCollection = admin.firestore().
    collection(`businesses/${businessId}/reviews`);
  const allReviewsSnapshot = await reviewsCollection.get();

  let totalRating = 0;
  let numberOfReviews = 0;

  allReviewsSnapshot.forEach((doc) => {
    totalRating += doc.data().rating;
    numberOfReviews++;
  });

  const averageRating = totalRating / numberOfReviews;

  await admin.firestore().collection("businesses").doc(businessId).update({
    averageRating: averageRating,
  });
};

export const updateReviewDistribution = async (businessId: string) => {
  const reviewsCollection = admin.firestore().collection(`businesses/${businessId}/reviews`);
  const allReviewsSnapshot = await reviewsCollection.get();

  const ratingDistribution: { [key: number]: number } = {};

  allReviewsSnapshot.forEach((doc) => {
    const rating = doc.data().rating;
    if (ratingDistribution[rating]) {
      ratingDistribution[rating]++;
    } else {
      ratingDistribution[rating] = 1;
    }
  });

  await admin.firestore().collection("businesses").doc(businessId).update({
    ratingDistribution: ratingDistribution,
  });
};


