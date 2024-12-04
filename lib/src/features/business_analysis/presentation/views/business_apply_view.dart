import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:project_marba/src/features/business_analysis/presentation/widgets/business_apply_category_card.dart';

import '../../data/utils/business_apply_strings.dart';
import '../../data/utils/business_registration_enum.dart';
import 'business_apply_form_view.dart';

class BusinessApplyView extends StatelessWidget {
  const BusinessApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(registerBusinessTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MarkdownBody(data: businessApplyMessage),
              const SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BusinessApplyCategoryCard(
                      title: companyTitle,
                      subtitle: companySubtitle,
                      icon: Icons.business,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BusinessApplyFormView(
                              category: BusinessRegistrationCategory.cnpj,
                            ),
                          ),
                        );
                      }),
                  BusinessApplyCategoryCard(
                      title: meiTitle,
                      subtitle: meiSubtitle,
                      icon: Icons.store,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BusinessApplyFormView(
                              category: BusinessRegistrationCategory.mei,
                            ),
                          ),
                        );
                      }),
                  BusinessApplyCategoryCard(
                      title: individualTitle,
                      subtitle: individualSubtitle,
                      icon: Icons.person,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BusinessApplyFormView(
                              category: BusinessRegistrationCategory.cpf,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
