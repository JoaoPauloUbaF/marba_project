import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/address/address.dart';
import 'package:project_marba/src/core/widgets/medium_vertical_space_widget.dart';

import '../../application/address_view_model/address_view_model.dart';

class AddressSearchWidget extends ConsumerStatefulWidget {
  final Address? currentAddress;
  const AddressSearchWidget({super.key, required this.currentAddress});

  @override
  AddressSearchWidgetState createState() => AddressSearchWidgetState();
}

class AddressSearchWidgetState extends ConsumerState<AddressSearchWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  final FlutterGooglePlacesSdk _places =
      FlutterGooglePlacesSdk(dotenv.env['GOOGLE_API_KEY'] ?? '');
  List<AutocompletePrediction> _predictions = [];

  void _onChanged(String query) async {
    if (query.isNotEmpty && query.length > 2) {
      final predictions = await _places.findAutocompletePredictions(query);
      setState(() {
        _predictions = predictions.predictions;
      });
    } else {
      setState(() {
        _predictions = [];
      });
    }
  }

  @override
  void initState() {
    if (widget.currentAddress != null) {
      _textEditingController.text =
          '${widget.currentAddress?.street}, ${widget.currentAddress?.number}, ${widget.currentAddress?.city}, ${widget.currentAddress?.neighborhood}';
      _onChanged(_textEditingController.text);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addressViewModel = ref.read(addressViewModelProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _textEditingController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pesquisar endereço',
          ),
          onChanged: _onChanged,
        ),
        const VerticalSpaceMediumWidget(),
        const Divider(),
        const VerticalSpaceMediumWidget(),
        Expanded(
          child: ListView.builder(
            itemCount: _predictions.length,
            itemBuilder: (context, index) {
              final prediction = _predictions[index];
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  tileColor: Theme.of(context).colorScheme.surfaceVariant,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  leading: const Icon(Icons.location_on_sharp),
                  title: Text(prediction.primaryText),
                  subtitle: Text(prediction.secondaryText),
                  onTap: () => addressViewModel.onPredictionSelected(
                    prediction: prediction,
                    context: context,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
