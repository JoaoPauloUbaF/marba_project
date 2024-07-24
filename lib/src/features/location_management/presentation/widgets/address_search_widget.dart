import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_marba/src/core/models/address/address.dart';

import '../../application/address_view_model/address_view_model.dart';

class AddressSearchWidget extends ConsumerStatefulWidget {
  final AddressModel? currentAddress;
  final bool shouldUpload = false;
  final Function(AddressModel?) onAddressSelected;

  const AddressSearchWidget(
      {super.key,
      required this.currentAddress,
      required this.onAddressSelected});

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

    return Scaffold(
      body: Column(
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
          const Divider(),
          Expanded(
            child: Card(
              elevation: 0,
              child: ListView.builder(
                itemCount: _predictions.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final prediction = _predictions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: ListTile(
                        tileColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        leading: const Icon(Icons.location_on_sharp),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        minTileHeight: 50,
                        title: Text(prediction.primaryText),
                        subtitle: Text(prediction.secondaryText),
                        onTap: () async => await addressViewModel
                            .onPredictionSelected(
                              prediction: prediction,
                              context: context,
                              shouldUpload: widget.shouldUpload,
                            )
                            .then(
                              (value) => widget.onAddressSelected(value),
                            )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
