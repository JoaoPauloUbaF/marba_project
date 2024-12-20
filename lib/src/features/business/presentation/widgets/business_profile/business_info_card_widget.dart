import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/business/application/business_profile_view_model/business_profile_screen_controller.dart';
import 'package:project_marba/src/core/models/business/business.dart';

class BusinessContactInfoCardWidget extends ConsumerWidget {
  const BusinessContactInfoCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileViewModelProvider);
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return !isWideScreen
        ? Card(
            margin: const EdgeInsets.all(4),
            child: BusinessPhoneAndEmail(business: business),
          )
        : Card(
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 8),
                  BusinessPhoneAndEmail(business: business),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
  }
}

class BusinessPhoneAndEmail extends ConsumerStatefulWidget {
  const BusinessPhoneAndEmail({
    super.key,
    required this.business,
  });

  final BusinessModel? business;

  @override
  ConsumerState<BusinessPhoneAndEmail> createState() =>
      _BusinessPhoneAndEmailState();
}

class _BusinessPhoneAndEmailState extends ConsumerState<BusinessPhoneAndEmail> {
  bool isEditingEmail = false;
  bool isEditingPhone = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController(text: widget.business?.email);
    phoneController = MaskedTextController(
        text: widget.business?.phoneNumber, mask: '(00) 00000-0000');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewController = ref.watch(businessProfileViewModelProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onLongPress: () {
              viewController
                  .isThisBusinessOwner()
                  .then((value) => setState(() => isEditingPhone = value));
            },
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 16,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: 4),
                isEditingPhone
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 35,
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                            hintText: 'Telefone',
                            border: const OutlineInputBorder(),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.check),
                              iconSize: 20,
                              onPressed: () {
                                setState(() {
                                  viewController.updateBusinessPhoneNumber(
                                      phoneController.text);
                                  isEditingPhone = false;
                                });
                              },
                            ),
                          ),
                          controller: phoneController,
                        ),
                      )
                    : Text(
                        widget.business?.phoneNumber ?? '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
              ],
            ),
          ),
          const Gap(8),
          InkWell(
            onLongPress: () {
              viewController
                  .isThisBusinessOwner()
                  .then((value) => setState(() => isEditingEmail = value));
            },
            child: Row(
              children: [
                Icon(
                  Icons.email,
                  size: 16,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: 4),
                isEditingEmail
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 35,
                        child: TextFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: const OutlineInputBorder(),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.check),
                              iconSize: 20,
                              onPressed: () {
                                setState(() {
                                  viewController.updateBusinessEmail(
                                      emailController.text);
                                  isEditingEmail = false;
                                });
                              },
                            ),
                          ),
                          controller: emailController,
                          maxLines: null,
                        ),
                      )
                    : Text(
                        widget.business?.email ?? '',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
