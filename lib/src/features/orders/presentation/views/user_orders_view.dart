import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/order_model.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/orders/application/user_orders_view_model/user_orders_view_model.dart';
import 'package:project_marba/src/features/orders/data/orders_repository/orders_repository_provider.dart';

import '../../application/order_view_model/order_view_model.dart';

class UserOrdersView extends ConsumerStatefulWidget {
  const UserOrdersView({super.key});
  static const _pageSize = 3;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserOrdersViewState();
}

class _UserOrdersViewState extends ConsumerState<UserOrdersView> {
  final PagingController<int, OrderModel> _pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await ref.read(userOrdersViewModelProvider.notifier).fetchUserOrders(
                lastOrderId: _pagingController.itemList?.last.id ?? '',
              );

      final isLastPage = newItems.length < UserOrdersView._pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      log('Error loading orders: $error');
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userOrders = ref.watch(userOrdersViewModelProvider);
    final currentUser = ref.read(authRepositoryProvider).getCurrentUser();
    userOrders.whenData(
      (value) => _pagingController.refresh(),
    );
    return Container(
      child: currentUser == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Acesse sua conta para ver seus pedidos.',
                      style: Theme.of(context).textTheme.titleMedium),
                  const VerticalSpaceMediumWidget(),
                  ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/sign-in'),
                      child: const Text('Login')),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () => Future.sync(
                () => _pagingController.refresh(),
              ),
              child: PagedListView(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<OrderModel>(
                  firstPageErrorIndicatorBuilder: (context) => const Center(
                    child: Text(
                        'Houve um erro ao carregar os pedidos. Tente novamente.'),
                  ),
                  noItemsFoundIndicatorBuilder: (context) => const Center(
                    child: Text('Nenhum pedido encontrado.'),
                  ),
                  newPageErrorIndicatorBuilder: (context) => const Center(
                    child: Text(
                        'Houve um erro ao carregar mais pedidos. Tente novamente.'),
                  ),
                  itemBuilder: (context, order, index) {
                    return UserOrderItemWidget(
                      ref: ref,
                      order: order,
                    );
                  },
                ),
              ),
            ),
    );
  }
}

class UserOrderItemWidget extends ConsumerWidget {
  final OrderModel order;

  const UserOrderItemWidget({
    super.key,
    required this.ref,
    required this.order,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderViewModel = ref.read(orderViewModelProvider.notifier);

    return InkWell(
      onTap: () {
        orderViewModel.setState(order: order);
        Navigator.of(context)
            .pushNamed('/user-order-details', arguments: order);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              FutureBuilder(
                future: ref
                    .read(ordersRepositoryProvider)
                    .getOrderItems(orderId: order.id),
                builder: (context, snapshot) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: .6,
                      initialPage: 0,
                      reverse: false,
                      autoPlay: snapshot.data?.length == 1 ? false : true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: snapshot.data
                        ?.map<Widget>(
                          (item) => Container(
                            margin: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                item.imageUrl,
                                fit: BoxFit.fill,
                                width: 200,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  log('$error');
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Icon(
                                        Icons.error,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                        size: 30,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  'Pedido #${order.id.split('-').first}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                    '${DateFormat.yMd().add_jm().format(order.createdAt.toLocal())}\nTotal: ${RegistrationUtils().doubleAsCurrency(order.total)}'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
