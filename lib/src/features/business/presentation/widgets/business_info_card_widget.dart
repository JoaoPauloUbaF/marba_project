import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:project_marba/src/features/business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_category_tiles_widget.dart';
import 'package:project_marba/src/features/business/presentation/widgets/business_status_widget.dart';
import 'package:project_marba/src/shared/models/business/business.dart';

class BusinessContactInfoCardWidget extends ConsumerWidget {
  const BusinessContactInfoCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileScreenControllerProvider);

    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //BusinessNameAndStatus(business: business),
            const SizedBox(height: 8),
            BusinessPhoneAndEmail(business: business),
            const SizedBox(height: 8),
            BusinessCategoryTilesWidget(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class BusinessPhoneAndEmail extends StatefulWidget {
  const BusinessPhoneAndEmail({
    super.key,
    required this.business,
  });

  final Business? business;

  @override
  State<BusinessPhoneAndEmail> createState() => _BusinessPhoneAndEmailState();
}

class _BusinessPhoneAndEmailState extends State<BusinessPhoneAndEmail> {
  bool isEditingEmail = false;
  bool isEditingPhone = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController(text: widget.business?.email);
    phoneController = MaskedTextController(
        text: widget.business?.phoneNumber, mask: '(00) 00000-0000');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              isEditingPhone = !isEditingPhone;
            });
          },
          child: Row(
            children: [
              const Icon(
                Icons.phone,
                size: 16,
              ),
              const SizedBox(width: 4),
              isEditingPhone
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          hintText: 'Telefone',
                          border: const OutlineInputBorder(),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              setState(() {
                                isEditingPhone =
                                    false; //TODO: implementar atualização do telefone
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
        const Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              isEditingEmail = !isEditingEmail;
            });
          },
          child: Row(
            children: [
              const Icon(
                Icons.email,
                size: 16,
              ),
              const SizedBox(width: 4),
              isEditingEmail
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: const OutlineInputBorder(),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              setState(() {
                                isEditingEmail =
                                    false; //TODO: implementar atualização do email
                              });
                            },
                          ),
                        ),
                        controller: emailController,
                      ),
                    )
                  : Text(
                      widget.business?.email ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class BusinessNameAndStatus extends StatelessWidget {
  const BusinessNameAndStatus({
    super.key,
    required this.business,
  });

  final Business? business;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          business?.name ?? '',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(width: 8),
        const BusinessStatusWidget(),
      ],
    );
  }
}
