import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/cart_items_list_view_widget.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/check_out_button_widget.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/order_summary_widget.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_tile_widget.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/order_payment_method_widget.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(authStateChangeProvider);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.search_sharp),
              onPressed: () {
                showModalBottomSheet(
                    scrollControlDisabledMaxHeightRatio: .8,
                    context: context,
                    builder: (context) {
                      return const Center(
                          child: Text(
                              'This is the search modal')); //TODO: Implement search modal
                    });
              },
            ),
          )
        ],
      ),
      floatingActionButton: const CheckOutButtonWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Meu Carrinho',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    // SegmentedButton(
                    //     showSelectedIcon: false,
                    //     segments: const <ButtonSegment<String>>[
                    //       ButtonSegment<String>(
                    //         icon: Icon(Icons.view_list_sharp),
                    //         value: 'list',
                    //       ),
                    //       ButtonSegment<String>(
                    //         icon: Icon(Icons.grid_view_sharp),
                    //         value: 'grid',
                    //       ),
                    //     ],
                    //     selected: const {'grid'},
                    //     onSelectionChanged: (value) {
                    //       print(value);
                    //     }),
                  ],
                ),
                const CartItemsListViewWidget(),
                const VerticalSpaceMediumWidget(),
                Text(
                  'Endereço de Entrega',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const VerticalSpaceMediumWidget(),
                const OrderAddressTileWidget(),
                const VerticalSpaceMediumWidget(),
                Text(
                  'Forma de Pagamento',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const VerticalSpaceMediumWidget(),
                const OrderPaymentMethodWidget(),
                const VerticalSpaceMediumWidget(),
                Text(
                  'Informações do Pedido',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const OrderSummaryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
