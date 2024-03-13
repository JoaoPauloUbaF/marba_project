import 'package:flutter/material.dart';
import 'package:project_marba/src/features/offers_management/presentation/widgets/offer_card_widget.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const int count = 64;
    const int itemsPerRow = 2;
    const double ratio = 1 / 1;
    const double horizontalPadding = 0;
    final double calcHeight = ((width / itemsPerRow) - (horizontalPadding)) *
        (count / itemsPerRow).ceil() *
        (1 / ratio);
    return SizedBox(
      width: width,
      height: calcHeight,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        itemCount: count,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: calcHeight / (count / (1.15 * itemsPerRow)).ceil(),
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            crossAxisCount: itemsPerRow,
            childAspectRatio: ratio),
        itemBuilder: (context, index) {
          return SizedBox(
              child: OfferCardWidget(
            offer: OfferModel.fromJson({
              "id": "196d5350-9db4-4548-831d-1e252754b479",
              "businessId": "d0748da4-9cc6-46f1-8749-4413f78f1241",
              "category": ["ServiceCategory.home"],
              "createdAt": "2024-03-08T07:01:22.560628",
              "updatedAt": "2024-03-08T07:01:22.560629",
              "status": "onDemand",
              "type": "service",
              "service": {
                "title": "jardineiro bolado meu irmao",
                "description": "Servicos de jardinagem profissa pode confiar",
                "price": 200.0,
                "imageUrl":
                    "https://firebasestorage.googleapis.com/v0/b/marba-project.appspot.com/o/offer_images%2Foffer_196d5350-9db4-4548-831d-1e252754b479.jpg?alt=media&token=9650053e-67d7-4177-ad98-2f598d034312",
                "status": "OfferStatus.onDemand"
              }
            }),
          ));
        },
      ),
    );
  }
}
