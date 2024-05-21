import 'package:flutter/material.dart';

import '../../screens/business_profile_screen.dart';

class BusinessDetailsModalBodyWidget extends StatelessWidget {
  const BusinessDetailsModalBodyWidget({
    super.key,
    required this.businessName,
  });

  final String businessName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Scaffold(
          body: const BusinessProfileScreen(),
          appBar: AppBar(
            title: Text(businessName),
          ),
        ),
      ),
    );
  }
}
