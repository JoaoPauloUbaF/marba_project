import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_item.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/core/widgets/large_horizontal_space_widget.dart';
import '../../../../../../core/models/address/address.dart';

class BusinessOpenOrdersPageView extends StatefulWidget {
  // TODO: orders repository
  const BusinessOpenOrdersPageView({super.key});

  @override
  State<BusinessOpenOrdersPageView> createState() =>
      _BusinessOpenOrdersPageViewState();
}

class _BusinessOpenOrdersPageViewState
    extends State<BusinessOpenOrdersPageView> {
  bool _isGridMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: ToggleButtons(
                isSelected: [_isGridMode, !_isGridMode],
                onPressed: (index) {
                  setState(() {
                    _isGridMode = index == 0;
                  });
                },
                children: const [
                  Icon(Icons.grid_view),
                  Icon(Icons.list),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: _isGridMode
              ? const OpenOrdersGridWidget()
              : const OpenOrdersListWidget(),
        ),
      ],
    );
  }
}

class OpenOrdersListWidget extends StatelessWidget {
  const OpenOrdersListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // You can replace this with your actual order list length
      itemBuilder: (context, index) {
        return OrderListItem(
          order: _getOrderData()[index],
        );
      },
    );
  }
}

class OpenOrdersGridWidget extends StatelessWidget {
  const OpenOrdersGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount:
            10, // You can replace this with your actual order list length
        itemBuilder: (context, index) {
          return OrderGridItem(
            order: _getOrderData()[index],
          );
        },
      ),
    );
  }
}

List<BusinessOrder> _getOrderData() {
  return List.generate(
    10,
    (index) {
      return BusinessOrder(
        id: 'id',
        userNickname: 'userNickname',
        address: Address(
          city: 'city',
          neighborhood: 'neighborhood',
          number: 'number',
          state: 'state',
          street: 'street',
          zipCode: 'zipCode',
        ),
        businessId: 'businessId',
        items: {
          BusinessOrderItem(
              id: 'id',
              name: 'name',
              imageUrl: 'imageUrl',
              price: 100.0,
              quantity: 1,
              status: BusinessOrderItemStatus.pending),
        },
        status: BusinessOrderStatus.pending,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    },
  );
}

class OrderListItem extends StatelessWidget {
  final BusinessOrder order;

  const OrderListItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          // Navigate to order details page
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Pedido #${order.businessId}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    order.status.toString().split('.').last,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: order.status == BusinessOrderStatus.pending
                              ? Colors.orange
                              : order.status == BusinessOrderStatus.delivered
                                  ? Colors.green
                                  : order.status == BusinessOrderStatus.canceled
                                      ? Colors.red
                                      : Colors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' R\$${order.items.fold(0.0, (total, item) => total + item.price * item.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('dd/MM/yyyy', 'pt_BR').format(order.createdAt),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const LargeHorizontalSpaceWidget(),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderGridItem extends StatelessWidget {
  final BusinessOrder order;

  const OrderGridItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Navigate to order details page
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Pedido #${order.businessId}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('dd/MM/yyyy', 'pt_BR').format(order.createdAt),
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                order.status.toString().split('.').last,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\$${order.items.fold(0.0, (total, item) => total + item.price * item.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
