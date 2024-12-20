import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';

class OfferMediaWidget extends StatefulWidget {
  const OfferMediaWidget({
    super.key,
    required this.items,
  });

  final Set<String> items;

  @override
  State<OfferMediaWidget> createState() => _OfferMediaWidgetState();
}

class _OfferMediaWidgetState extends State<OfferMediaWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          controller: _controller,
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
          items: widget.items.map((i) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: InteractiveViewer(
                child: Image.network(
                  i,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null ? child : const LoadingWidget(),
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Placeholder(),
                  ),
                ),
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
            children: widget.items.toList().asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
