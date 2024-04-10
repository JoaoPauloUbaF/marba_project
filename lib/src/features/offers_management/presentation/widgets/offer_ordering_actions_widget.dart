import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_view_model/cart_item_list_view_model.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';

import '../../../scheduling/presentation/widgets/calendar_modal_widget.dart';

class OrderingActionsWidget extends ConsumerWidget {
  const OrderingActionsWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartViewModel = ref.watch(cartItemListViewModelProvider.notifier);
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                offer.offerType == OfferType.product
                    ? Expanded(
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {
                            cartViewModel.createNewItem(
                              offer.id,
                              offer.title,
                              offer.priceWithDiscount,
                              offer.imageUrl,
                              offer.businessId,
                              offer.offerType,
                            );
                            Navigator.pushNamed(context, '/shopping-cart');
                          },
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
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const CalendarModalWidget();
                                });
                          },
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
                  child: AddToCartButtonWidget(offer: offer),
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

class AddToCartButtonWidget extends ConsumerStatefulWidget {
  const AddToCartButtonWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  ConsumerState<AddToCartButtonWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends ConsumerState<AddToCartButtonWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isAdded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = ref.watch(cartItemListViewModelProvider.notifier);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _isAdded
            ? Colors.lightGreen
            : Theme.of(context).colorScheme.secondary,
      ),
      child: TextButton.icon(
        onPressed: () {
          cartViewModel.createNewItem(
            widget.offer.id,
            widget.offer.title,
            widget.offer.priceWithDiscount,
            widget.offer.imageUrl,
            widget.offer.businessId,
            widget.offer.offerType,
          );
          setState(() {
            _isAdded = true;
          });
          _controller.forward().then((value) {
            Future.delayed(const Duration(milliseconds: 250))
                .then((value) => _controller.reverse())
                .then(
                  (value) => setState(
                    () {
                      _isAdded = false;
                    },
                  ),
                );
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
