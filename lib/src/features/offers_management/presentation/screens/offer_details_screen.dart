import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../shared/models/offer/offer_model.dart';

class OfferDetailsScreen extends ConsumerStatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  ConsumerState<OfferDetailsScreen> createState() => OfferDetailsScreenState();
}

class OfferDetailsScreenState extends ConsumerState<OfferDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final json = {
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
    };

    final offer = OfferModel.fromJson(json);

    final items = [
      offer.imageUrl,
      offer.imageUrl,
      offer.imageUrl,
      offer.imageUrl,
      offer.imageUrl,
    ];

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.4,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: items.map((i) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            i,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : const CircularProgressIndicator(),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: items.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Placeholder(),
        ));
  }
}
