import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/features/location_management/presentation/widgets/address_search_widget.dart';

import '../../../../core/models/address/address.dart';
import '../../../../core/widgets/medium_vertical_space_widget.dart';

class AddressFormModalWidget extends ConsumerStatefulWidget {
  final String title;

  final Address? currentAddress;
  final String? businessId;

  const AddressFormModalWidget({
    super.key,
    required this.currentAddress,
    required this.title,
    this.businessId,
  });

  @override
  ConsumerState<AddressFormModalWidget> createState() =>
      _AddressFormModalWidgetState();
}

class _AddressFormModalWidgetState
    extends ConsumerState<AddressFormModalWidget> {
  final googlePlacesController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 4,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              const VerticalSpaceMediumWidget(),
              const VerticalSpaceMediumWidget(),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const VerticalSpaceMediumWidget(),
              const VerticalSpaceMediumWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const AddressSearchWidget(),
              ),
              const VerticalSpaceMediumWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
