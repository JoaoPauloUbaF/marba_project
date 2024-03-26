import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_controller/cart_item_list_controller.dart';
import 'package:project_marba/src/shared/models/cart_item/cart_item_model.dart';
import 'package:project_marba/src/shared/utils/registration_utils.dart';
import 'package:project_marba/src/shared/widgets/large_horizontal_space_widget.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartItemListProvider);
    final cartItemListController = ref.read(cartItemListProvider.notifier);

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
                fit: BoxFit.fitWidth,
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
                  Row(children: [
                    SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: IconButton.outlined(
                        color: Theme.of(context).colorScheme.primary,
                        icon: const Icon(Icons.remove, size: 18.0),
                        onPressed: () {
                          cartItemListController.decreaseItemQuantity(
                              item, context);
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
                        icon: const Icon(Icons.add, size: 18.0),
                        onPressed: () {
                          cartItemListController.increaseItemQuantity(item);
                        },
                        padding: const EdgeInsets.all(0),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
