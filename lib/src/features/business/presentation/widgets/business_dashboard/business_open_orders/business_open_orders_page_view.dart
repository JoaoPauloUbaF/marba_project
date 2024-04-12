import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/core/widgets/large_horizontal_space_widget.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_open_orders/open_orders_grid_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_open_orders/open_orders_list_widget.dart';

class BusinessOrdersPageView extends ConsumerStatefulWidget {
  // TODO: orders repository
  const BusinessOrdersPageView({super.key});

  @override
  ConsumerState<BusinessOrdersPageView> createState() =>
      _BusinessOrdersPageViewState();
}

class _BusinessOrdersPageViewState
    extends ConsumerState<BusinessOrdersPageView> {
  bool _isGridMode = false;

  @override
  Widget build(BuildContext context) {
    final businessOrdersViewModel =
        ref.watch(businessOrdersViewModelProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: const Icon(Icons.filter_list_sharp),
                  value: BusinessOrderStatus.waitingConfirmation,
                  style: Theme.of(context).textTheme.bodyMedium,
                  borderRadius: BorderRadius.circular(8),
                  items: BusinessOrderStatus.values.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(businessOrdersViewModel.getStatusTranslation(
                          status.toString().split('.').last)),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
            ),
            const Spacer(),
            Padding(
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
          ],
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
