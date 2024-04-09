import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/utils/registration_utils.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';
import 'package:project_marba/src/core/widgets/modal_center_top_line_widget.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/shopping/application/delivery_provider/delivery_provider.dart';

import '../../data/business_profile_data/business_profile_provider.dart';

class BusinessSettingsView extends StatelessWidget {
  const BusinessSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Geral'),
            onTap: () {
              // Navigate to general settings screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.delivery_dining),
            title: const Text('Entrega'),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const DeliveryModalWidget();
                  });
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Segurança'),
            onTap: () {
              // Navigate to security settings screen
            },
          ),
        ],
      ),
    );
  }
}

class DeliveryModalWidget extends ConsumerStatefulWidget {
  const DeliveryModalWidget({
    super.key,
  });

  @override
  ConsumerState<DeliveryModalWidget> createState() =>
      _DeliveryModalWidgetState();
}

class _DeliveryModalWidgetState extends ConsumerState<DeliveryModalWidget> {
  late TextEditingController _baseDeliveryFeeController;
  late TextEditingController _additionalDistanceFeeController;
  late TextEditingController _baseDistanceController;
  late TextEditingController _additionalDistanceController;

  @override
  void initState() {
    _baseDeliveryFeeController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
    );
    _additionalDistanceFeeController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
    );
    _baseDistanceController = MaskedTextController(
      mask: '0,00 km',
    );
    _additionalDistanceController = MaskedTextController(
      mask: '0,00 km',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final business = ref.watch(businessProfileScreenControllerProvider);
    final viewModel =
        ref.watch(businessProfileScreenControllerProvider.notifier);
    double baseDeliveryFee = business?.deliveryFee ?? 0.0;
    _baseDeliveryFeeController.text = baseDeliveryFee.toStringAsFixed(2);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalCenterTopLineWidget(),
          ListTile(
            leading: const Icon(Icons.delivery_dining),
            title: const Text('Taxa de Entrega Base'),
            subtitle: const Text('Configurações de entrega'),
            trailing: SizedBox(
              width: 80,
              child: TextField(
                controller: _baseDeliveryFeeController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(2),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.add_sharp),
              title: const Text('Acréscimo por distância'),
              subtitle: const Text('Taxa adicional por km excedido'),
              trailing: SizedBox(
                width: 80,
                child: TextField(
                  controller: _additionalDistanceFeeController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(2),
                    border: OutlineInputBorder(),
                  ),
                ),
              )),
          ListTile(
            leading: const Icon(Icons.directions_sharp),
            title: const Text('Distância base'),
            subtitle:
                const Text('Distância max para entrega sem taxa adicional'),
            trailing: SizedBox(
              width: 80,
              child: TextField(
                controller: _baseDistanceController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(2),
                  border: OutlineInputBorder(),
                  hintText: '0,00 km',
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.directions_sharp),
            title: const Text('Distância Adicional'),
            subtitle: const Text('Distância adicional para taxa adicional'),
            trailing: SizedBox(
              width: 80,
              child: TextField(
                controller: _additionalDistanceController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(2),
                  border: OutlineInputBorder(),
                  hintText: '0,00 km',
                ),
              ),
            ),
          ),
          const VerticalSpaceMediumWidget(),
          ElevatedButton(
            onPressed: () {
              viewModel.updateBusinessDelivery(
                RegistrationUtils()
                    .currencyStringToDouble(_baseDeliveryFeeController.text),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            child:
                Text('Salvar', style: Theme.of(context).textTheme.labelLarge!),
          ),
          const VerticalSpaceMediumWidget(),
          const VerticalSpaceMediumWidget(),
        ],
      ),
    );
  }
}
