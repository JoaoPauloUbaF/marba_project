import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_controller/cart_item_list_controller.dart';
import 'package:project_marba/src/shared/models/offer/offer_model.dart';

class OrderingActionsWidget extends ConsumerWidget {
  //TODO: order and cart features
  const OrderingActionsWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                offer.offerType == OfferType.service
                    ? Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_sharp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          label: Text(
                            "Comprar\nagora",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.calendar_month_sharp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          label: Text(
                            "Agendar\n horário",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ),
                      ),
                const SizedBox(width: 8),
                Expanded(
                  child: AddToCartWidget(offer: offer),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class AddToCartWidget extends ConsumerStatefulWidget {
  const AddToCartWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  ConsumerState<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends ConsumerState<AddToCartWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isAdded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _isAdded
            ? Colors.lightGreen
            : Theme.of(context).colorScheme.secondary,
      ),
      child: TextButton.icon(
        onPressed: () {
          ref.read(cartItemListProvider.notifier).createNewItem(
                widget.offer.id,
                widget.offer.title,
                widget.offer.price,
                widget.offer.imageUrl,
              );
          setState(() {
            _isAdded = true;
          });
          _controller.forward().then((value) {
            Future.delayed(const Duration(seconds: 1))
                .then((value) => _controller.reverse())
                .then((value) => setState(() {
                      _isAdded = false;
                    }));
          });
        },
        icon: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.fastEaseInToSlowEaseOut,
            ),
          ),
          child: Icon(
            _isAdded ? Icons.check : Icons.add_shopping_cart_sharp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        label: ScaleTransition(
          scale: Tween(begin: 1.0, end: 1.1).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.fastEaseInToSlowEaseOut,
            ),
          ),
          child: Text(
            _isAdded ? "Adicionado" : "Adicionar\nao carrinho",
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
