import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/order/business_order_item.dart';

import '../../../business/presentation/widgets/business_tile_widget.dart';
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
    return FutureBuilder<Map<String, List<BusinessOrderItem>>>(
      future: widget.orderViewModel.getOrderItemsGroupedByBusiness(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final itemsGroupedByBusiness = snapshot.data;
        if (itemsGroupedByBusiness == null || itemsGroupedByBusiness.isEmpty) {
          return const Text('Nenhum item encontrado');
        }

        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(2.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: itemsGroupedByBusiness.keys.length,
          itemBuilder: (context, index) {
            final businessName = itemsGroupedByBusiness.keys.elementAt(index);
            final businessOrderItems =
                itemsGroupedByBusiness[businessName] ?? [];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<String>(
                    future: widget.orderViewModel.getBusinessIdByBusinessOrder(
                        businessOrderId: businessOrderItems.first
                            .businessOrderId), // replace with your actual method to fetch business data
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return BusinessTileWidget(businessId: snapshot.data!);
                      }
                    },
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(2.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: businessOrderItems.length,
                    itemBuilder: (context, index) {
                      final item = businessOrderItems[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              item.imageUrl,
                              width: 50,
                              height: 80,
                              fit: BoxFit.fill,
                            ),
                            title: Text(item.name,
                                style: Theme.of(context).textTheme.titleMedium),
                            subtitle: RichText(
                              text: TextSpan(
                                text: 'R\$ ${item.price.toStringAsFixed(2)}\n',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        widget.orderViewModel.getDeliveryTime(),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Text('Qtd: ${item.quantity}'),
                          ),
                        ],
                      );
                    },
                  ),
                  Center(
                    child: FutureBuilder<String>(
                      future: widget.orderViewModel
                          .getOrderItemDeliveryStatusByBusiness(
                        orderItem: itemsGroupedByBusiness[businessName]!.first,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Text(
                            snapshot.data ?? '',
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        }
                      },
                    ),
                  ),
                  UserOrderDeliveryProgressBarWidget(
                      widget: widget,
                      itemsGroupedByBusiness: itemsGroupedByBusiness,
                      businessName: businessName),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class UserOrderDeliveryProgressBarWidget extends StatefulWidget {
  const UserOrderDeliveryProgressBarWidget({
    super.key,
    required this.widget,
    required this.itemsGroupedByBusiness,
    required this.businessName,
  });

  final OrderItemsListWidget widget;
  final Map<String, List<BusinessOrderItem>> itemsGroupedByBusiness;
  final String businessName;

  @override
  State<UserOrderDeliveryProgressBarWidget> createState() =>
      _UserOrderDeliveryProgressBarWidgetState();
}

class _UserOrderDeliveryProgressBarWidgetState
    extends State<UserOrderDeliveryProgressBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.widget.orderViewModel.getOrderDeliveryProgressByBusiness(
          orderItem: widget.itemsGroupedByBusiness[widget.businessName]!.first),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == 0.0 || snapshot.data == 1.0) {
          return const SizedBox.shrink();
        }
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                LinearProgressIndicator(
                  value: _animation.value * (snapshot.data as double),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
