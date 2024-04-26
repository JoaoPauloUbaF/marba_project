import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/features/orders/application/user_orders_view_model/user_orders_view_model.dart';
import 'package:project_marba/src/features/orders/data/orders_repository/orders_repository_provider.dart';

class UserOrdersView extends ConsumerStatefulWidget {
  const UserOrdersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserOrdersViewState();
}

class _UserOrdersViewState extends ConsumerState<UserOrdersView> {
  @override
  Widget build(BuildContext context) {
    final userOrders =
        ref.watch(userOrdersViewModelProvider); //TODO: infinite scrolling
    return Scaffold(
      body: userOrders.when(data: (orders) {
        if (orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Nenhum pedido encontrado, veja algumas ofertas!'),
                const VerticalSpaceMediumWidget(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        '/home'); //TODO: change the index at homepageviewmodel
                  },
                  child: const Text('Ver ofertas'),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders?[index];
            return InkWell(
              onTap: () => Navigator.of(context)
                  .pushNamed('/user-order-details', arguments: order),
              child: Card(
                child: Column(
                  children: [
                    FutureBuilder(
                      future: ref
                          .read(ordersRepositoryProvider)
                          .getOrderItems(orderId: order?.id ?? ''),
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
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: Text('Pedido #${order?.id.split('-').first}'),
                      subtitle:
                          Text('Total: R\$ ${order?.total.toStringAsFixed(2)}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }, error: (error, stack) {
        return const Center(
          child: Text('Ocorreu um erro ao carregar os pedidos'),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
