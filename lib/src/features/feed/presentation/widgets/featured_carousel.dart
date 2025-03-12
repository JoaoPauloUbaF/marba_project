import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';

class FeaturedCarousel extends ConsumerStatefulWidget {
  const FeaturedCarousel({super.key});

  @override
  FeaturedCarouselState createState() => FeaturedCarouselState();
}

class FeaturedCarouselState extends ConsumerState<FeaturedCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final items = [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://media.gettyimages.com/id/1493807649/pt/vetorial/megaphone-in-abstract-style.jpg?s=2048x2048&w=gi&k=20&c=c2oi19hgu8xV5nWrWf4tJQM00Nm_Yf3rhMdeCM55VOk=',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://media.gettyimages.com/id/1159807141/pt/vetorial/brand-storytelling.jpg?s=612x612&w=0&k=20&c=_MpBoLPpttATknZj9KtNEZ5R9ycAq0rD-zsT6EgilDE=',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://media.gettyimages.com/id/1311966784/pt/foto/chat-speech-bubble-on-smart-phone-screen.jpg?s=612x612&w=0&k=20&c=DoPJH2Ce6f1RrlUagL22Abe6GR9-pZXRklq2y6ZrwPo=',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      // Adicione mais itens aqui se necessário
    ];

    return Padding(
      padding: isWideScreen(context)
          ? EdgeInsets.symmetric(horizontal: 40.0)
          : const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          CarouselSlider(
            items: items,
            controller: _controller,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: isWideScreen(context) ? 4 : 16 / 9,
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
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
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                      color: Colors.white
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
