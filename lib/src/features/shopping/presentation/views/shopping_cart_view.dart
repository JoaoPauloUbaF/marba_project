import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/widgets/modal_center_top_line_widget.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/search/presentation/views/search_view.dart';
import 'package:project_marba/src/features/shopping/application/cart_item_list_view_model/cart_item_list_view_model.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/cart_items_list_view_widget.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/check_out_button_widget.dart';
import 'package:project_marba/src/features/shopping/presentation/widgets/order_summary_widget.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/order_address_tile_widget.dart';
import 'package:project_marba/src/features/payment/presentation/widgets/order_payment_method_widget.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(authStateChangeProvider);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ref.invalidate(cartItemListViewModelProvider);
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.search_sharp),
              onPressed: () {
                showModalBottomSheet(
                    scrollControlDisabledMaxHeightRatio: .9,
                    context: context,
                    builder: (context) {
                      return ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0)),
                          child: Container(
                            color: Theme.of(context).colorScheme.surface,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const VerticalSpaceMediumWidget(),
                                const ModalCenterTopLineWidget(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .8,
                                      child: const SearchView()),
                                ),
                              ],
                            ),
                          ));
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
