import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/features/orders/data/user_orders_repository/user_orders_repository_provider.dart';

class UserOrdersView extends ConsumerStatefulWidget {
  const UserOrdersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserOrdersViewState();
}

class _UserOrdersViewState extends ConsumerState<UserOrdersView> {
  @override
  Widget build(BuildContext context) {
    final userOrders = ref.read(userOrdersRepositoryProvider).getUserOrders();
    return Scaffold(
      body: StreamBuilder(
        stream: userOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Ocorreu um erro ao carregar os pedidos'),
            );
          }
          if (snapshot.data!.isEmpty) {
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
          final orders = snapshot.data;
          return ListView.builder(
            //TODO: implement a carrousel slider with the order items images
            itemCount: orders?.length,
            itemBuilder: (context, index) {
              final order = orders?[index];
              return ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text('Pedido #${order?.id.split('-').first}'),
                subtitle: Text('Total: R\$ ${order?.total.toStringAsFixed(2)}'),
                trailing: const Icon(Icons.arrow_forward_ios),
              );
            },
          );
        },
      ),
    );
  }
}
