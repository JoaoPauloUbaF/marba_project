import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/models/offer/offer_model.dart';
import '../../../../shared/widgets/medium_vertical_space_widget.dart';
import '../../application/offer_edition/offer_edition_controller.dart';
import '../../data/offer_data_repository_provider.dart';

class OfferQuickManageWidget extends ConsumerStatefulWidget {
  const OfferQuickManageWidget({
    super.key,
    required this.offer,
  });

  final OfferModel offer;

  @override
  ConsumerState<OfferQuickManageWidget> createState() =>
      _OfferQuickManageWidgetState();
}

class _OfferQuickManageWidgetState
    extends ConsumerState<OfferQuickManageWidget> {
  bool showDiscountField = false;
  late TextEditingController offerDiscountController;

  @override
  void initState() {
    offerDiscountController = MaskedTextController(mask: '00');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    showDiscountField = !showDiscountField;
                  });
                },
                child: const Icon(
                  Icons.percent_sharp,
                  color: Colors.lightGreen,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  ref
                      .read(offerEditionControllerProvider.notifier)
                      .setSelectedOfferToEdit(widget.offer);

                  Navigator.of(context).pushNamed(
                    '/edit-offer',
                  );
                },
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      showCloseIcon: true,
                      duration: const Duration(seconds: 5),
                      backgroundColor: Theme.of(context).colorScheme.error,
                      content: const Text(
                          'Tem certeza que deseja excluir a oferta?'),
                      action: SnackBarAction(
                        label: 'Sim',
                        onPressed: () {
                          ref
                              .read(offersDataRepositoryProvider)
                              .deleteOffer(widget.offer.id);
                        },
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        const VerticalSpaceMediumWidget(),
        Visibility(
          visible: showDiscountField,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            child: SizedBox(
              height: 40,
              width: 80,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: offerDiscountController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: '%',
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.done_sharp,
                      ),
                      onPressed: () {
                        final offer = widget.offer.copyWith(
                          discount: double.parse(offerDiscountController.text),
                        );
                        ref
                            .read(offersDataRepositoryProvider)
                            .updateOffer(offer);
                        setState(() {
                          showDiscountField = false;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
