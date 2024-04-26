import 'package:flutter/material.dart';

import '../../application/order_view_model/order_view_model.dart';

class OrderItemsListWidget extends StatefulWidget {
  const OrderItemsListWidget({
    super.key,
    required this.orderViewModel,
  });

  final OrderViewModel orderViewModel;

  @override
  State<OrderItemsListWidget> createState() => _OrderItemsListWidgetState();
}

class _OrderItemsListWidgetState extends State<OrderItemsListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.orderViewModel.getOrderItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(2.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  '${snapshot.data?[index].imageUrl}',
                  width: 50,
                  height: 80,
                  fit: BoxFit.fill,
                ),
                title: Text('${snapshot.data?[index].name}'),
                subtitle: Text(
                    'R\$ ${snapshot.data?[index].price.toStringAsFixed(2)}'),
                trailing: Text('Qtd: ${snapshot.data?[index].quantity}'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        });
  }
}
