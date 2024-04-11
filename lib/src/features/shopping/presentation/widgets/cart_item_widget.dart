import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/offer/offer_model.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_view_model/cart_item_list_view_model.dart';
import 'package:project_marba/src/core/models/cart_item/cart_item_model.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/core/widgets/large_horizontal_space_widget.dart';

import '../../../scheduling/presentation/widgets/calendar_modal_widget.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemListViewModel =
        ref.read(cartItemListViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 125,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl,
                width: 125,
                height: 125,
                fit: BoxFit.fill,
              ),
            ),
            const LargeHorizontalSpaceWidget(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(RegistrationUtils().formatAsCurrency(item.price),
                      style: Theme.of(context).textTheme.bodyMedium),
                  item.offerType == OfferType.product
                      ? ProductStepperWidget(
                          cartItemListViewModel: cartItemListViewModel,
                          item: item)
                      : TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const CalendarModalWidget();
                                //TODO: Implement scheduling
                              },
                            );
                          },
                          icon: const Icon(Icons.calendar_month_sharp),
                          label: const Text('Agendar'),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductStepperWidget extends StatelessWidget {
  const ProductStepperWidget({
    super.key,
    required this.cartItemListViewModel,
    required this.item,
  });

  final CartItemListViewModel cartItemListViewModel;
  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.0,
          height: 30.0,
          child: IconButton.outlined(
            color: Theme.of(context).colorScheme.primary,
            icon: Icon(cartItemListViewModel.getDecreaseIcon(item.quantity),
                size: 18.0),
            onPressed: () {
              cartItemListViewModel.decreaseItemQuantity(item, context);
            },
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          item.quantity.toString(),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 30,
          height: 30,
          child: IconButton.outlined(
            color: Theme.of(context).colorScheme.primary,
            icon: Icon(cartItemListViewModel.getIncreaseIcon(item), size: 18.0),
            onPressed: () {
              cartItemListViewModel.increaseItemQuantity(item,
                  context: context);
            },
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(),
          ),
        ),
      ],
    );
  }
}
