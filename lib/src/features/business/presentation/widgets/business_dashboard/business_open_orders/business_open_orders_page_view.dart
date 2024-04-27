import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/core/models/order/business_order_model.dart';
import 'package:project_marba/src/features/business/application/business_orders_view_model/business_orders_view_model.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_open_orders/open_orders_grid_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_dashboard/business_open_orders/open_orders_list_widget.dart';

class BusinessOrdersPageView extends ConsumerStatefulWidget {
  const BusinessOrdersPageView({super.key});

  @override
  ConsumerState<BusinessOrdersPageView> createState() =>
      _BusinessOrdersPageViewState();
}

class _BusinessOrdersPageViewState
    extends ConsumerState<BusinessOrdersPageView> {
  bool _isGridMode = false;
  BusinessOrderStatus? _status;

  @override
  Widget build(BuildContext context) {
    ref.watch(businessOrdersViewModelProvider);
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
                  value: _status,
                  style: Theme.of(context).textTheme.bodyMedium,
                  borderRadius: BorderRadius.circular(8),
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text(
                          'Todos'), // replace 'None' with your desired placeholder text
                    ),
                    ...BusinessOrderStatus.values.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(
                            businessOrdersViewModel.getStatusTranslation(
                                status.toString().split('.').last)),
                      );
                    }),
                  ],
                  onChanged: (value) {
                    if (value == null) {
                      ref.invalidate(businessOrdersViewModelProvider);
                      _status = null;
                      return;
                    }
                    setState(() {
                      _status = value!;
                    });
                    businessOrdersViewModel.applyOrdersStatusFilter(value!);
                  },
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
