import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/business_delivery/business_delivery.dart';
import 'package:project_marba/src/core/utils/view_utils.dart';

import '../../../../../../core/widgets/medium_vertical_space_widget.dart';
import '../../../../../../core/widgets/modal_center_top_line_widget.dart';
import '../../../../application/business_profile_view_model/business_profile_screen_controller.dart';

class DeliverySettingsModalWidget extends ConsumerStatefulWidget {
  const DeliverySettingsModalWidget({
    super.key,
  });

  @override
  ConsumerState<DeliverySettingsModalWidget> createState() =>
      _DeliveryModalWidgetState();
}

class _DeliveryModalWidgetState
    extends ConsumerState<DeliverySettingsModalWidget> {
  late TextEditingController _baseDeliveryFeeController;
  late TextEditingController _additionalDistanceFeeController;
  late TextEditingController _baseDistanceController;
  late TextEditingController _minimumDeliveryTimeController;
  late TextEditingController _maximumDeliveryTimeController;
  late TextEditingController _minimumOrderValueController;

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

    _minimumDeliveryTimeController = MaskedTextController(
      mask: '00 min',
    );
    _maximumDeliveryTimeController = MaskedTextController(
      mask: '00 min',
    );
    _minimumOrderValueController = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      decimalSeparator: ',',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final business = ref.watch(businessProfileViewModelProvider);
    final viewModel = ref.watch(businessProfileViewModelProvider.notifier);

    double baseDeliveryFee = business?.deliveryFee ?? 0.0;
    double additionalDistanceFee = business?.additionalDistanceFee ?? 0.0;
    double baseDistance = business?.baseDeliveryDistance ?? 0.0;
    String minimumDeliveryTime = '${business?.deliveryTime?.first ?? 0} min';
    String maximumDeliveryTime = '${business?.deliveryTime?.last ?? 0} min';
    double minimumOrderValue = business?.minimumOrderValue ?? 0.0;

    _baseDeliveryFeeController.text = baseDeliveryFee.toStringAsFixed(2);
    _additionalDistanceFeeController.text =
        additionalDistanceFee.toStringAsFixed(2);
    _baseDistanceController.text = '${baseDistance.toStringAsFixed(2)} km';
    _minimumDeliveryTimeController.text = minimumDeliveryTime;
    _maximumDeliveryTimeController.text = maximumDeliveryTime;
    _minimumOrderValueController.text = minimumOrderValue.toStringAsFixed(2);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalCenterTopLineWidget(),
          const VerticalSpaceMediumWidget(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Scrollbar(
              trackVisibility: true,
              thumbVisibility: true,
              child: ListView(
                children: [
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
                    subtitle: const Text(
                        'Distância max para entrega sem taxa adicional'),
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
                    leading: const Icon(Icons.timer),
                    title: const Text('Tempo de Entrega Mínimo'),
                    trailing: SizedBox(
                      width: 80,
                      child: TextField(
                        controller: _minimumDeliveryTimeController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          border: OutlineInputBorder(),
                          hintText: '00:00',
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.timer),
                    title: const Text('Tempo de Entrega Máximo'),
                    trailing: SizedBox(
                      width: 80,
                      child: TextField(
                        controller: _maximumDeliveryTimeController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          border: OutlineInputBorder(),
                          hintText: '00:00',
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('Pedido Mínimo'),
                    trailing: SizedBox(
                      width: 80,
                      child: TextField(
                        controller: _minimumOrderValueController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalSpaceMediumWidget(),
          ElevatedButton(
            onPressed: () async {
              showLoader(context);
              await viewModel
                  .updateBusinessDelivery(
                deliveryData: BusinessDeliveryModel(
                  baseDeliveryFee: _baseDeliveryFeeController.text,
                  additionalDistanceFee: _additionalDistanceFeeController.text,
                  baseDistance: _baseDistanceController.text,
                  minimumDeliveryTime: _minimumDeliveryTimeController.text,
                  maximumDeliveryTime: _maximumDeliveryTimeController.text,
                  minimumOrderValue: _minimumOrderValueController.text,
                ),
              )
                  .catchError(
                (error) async {
                  hideLoader(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Erro'),
                        content: const Text(
                            'Ocorreu um erro ao salvar as configurações de entrega. Por favor, tente novamente.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ).then(
                (value) async {
                  hideLoader(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Sucesso'),
                          content: const Text(
                              'Configurações de entrega salvas com sucesso.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
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
