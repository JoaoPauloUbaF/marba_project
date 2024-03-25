import 'package:flutter/material.dart';

class TopTenBadgeWidget extends StatelessWidget {
  final double sizeMultiplier;

  const TopTenBadgeWidget({
    super.key,
    this.sizeMultiplier = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.2,
      child: SizedBox(
        width: 70 * sizeMultiplier,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 54 * sizeMultiplier,
            height: 54 * sizeMultiplier,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1 * sizeMultiplier,
              ),
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
          Container(
            width: 45 * sizeMultiplier,
            height: 45 * sizeMultiplier,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.5 * sizeMultiplier),
            ),
          ),
          Container(
            width: 42 * sizeMultiplier,
            height: 42 * sizeMultiplier,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21 * sizeMultiplier),
              border: Border.all(
                width: 1 * sizeMultiplier,
              ),
            ),
          ),
          Container(
            width: 25 * sizeMultiplier,
            height: 25 * sizeMultiplier,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5 * sizeMultiplier),
              border: Border.all(
                width: 1 * sizeMultiplier,
              ),
            ),
          ),
          Positioned(
              top: 6 * sizeMultiplier,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 10 * sizeMultiplier,
                  ),
                ],
              )),
          Positioned(
              top: 36 * sizeMultiplier,
              child: Row(
                children: [
                  for (var i = 0; i < 2; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.0 * sizeMultiplier),
                      child: Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 8 * sizeMultiplier,
                      ),
                    ),
                ],
              )),
          Positioned(
              top: 38 * sizeMultiplier,
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 10 * sizeMultiplier,
                  ),
                ],
              )),
          Positioned(
              top: 9 * sizeMultiplier,
              child: Row(
                children: [
                  for (var i = 0; i < 2; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.0 * sizeMultiplier),
                      child: Icon(
                        Icons.star,
                        color: Colors.black,
                        size: 8 * sizeMultiplier,
                      ),
                    ),
                ],
              )),
          Container(
            width: 50 * sizeMultiplier,
            height: 22 * sizeMultiplier,
            color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[700],
            ),
            height: 20 * sizeMultiplier,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 8 * sizeMultiplier,
                ),
                Text(
                  "TOP 10",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 8 * sizeMultiplier,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
