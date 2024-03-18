import 'package:flutter/material.dart';

class OfferActionsWidget extends StatefulWidget {
  const OfferActionsWidget({
    super.key,
  });

  @override
  State<OfferActionsWidget> createState() => _OfferActionsWidgetState();
}

class _OfferActionsWidgetState extends State<OfferActionsWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: isFavorite
              ? Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.error,
                  size: 20,
                )
              : Icon(
                  Icons.favorite_outline,
                  color: Theme.of(context).colorScheme.error,
                  size: 20,
                ),
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: Icon(
            Icons.share_outlined,
            color: Theme.of(context).colorScheme.error,
            size: 20,
          ),
          onPressed: () {},
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: Icon(
            Icons.chat_outlined,
            color: Theme.of(context).colorScheme.error,
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
