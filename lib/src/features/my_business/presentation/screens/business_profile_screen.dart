import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_marba/src/features/my_business/application/business_profile_screen_controller/business_profile_screen_controller.dart';
import 'package:project_marba/src/features/my_business/presentation/components/business_category_cards_widget.dart';
import 'package:project_marba/src/features/user_profile/presentation/components/address_display_widget.dart';

class BusinessProfileScreen extends ConsumerWidget {
  const BusinessProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final business = ref.watch(businessProfileScreenControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: business != null
            ? Column(
                children: [
                  const Image(
                      image: NetworkImage(
                          'https://scontent.fjdf6-1.fna.fbcdn.net/v/t39.30808-6/305526771_589615162866249_4361465910529182138_n.png?_nc_cat=109&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=JttfJl4LrgwAX8RS_pf&_nc_ht=scontent.fjdf6-1.fna&oh=00_AfC2yqeXTz4zjfXxM55-D4fKh4EwyCWmBUNklqpnJgLA1w&oe=65E400ED')),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: _buildProfileInfoItem(null, business.name)),
                        Row(
                          children: [
                            _buildProfileInfoItem(null, business.email),
                            Spacer(),
                            _buildProfileInfoItem(null, business.phoneNumber),
                          ],
                        ),
                        AddressDisplayWidget(address: business.address),
                        _buildProfileInfoItem(
                            'Status', business.status.toString()),
                        _buildProfileInfoItem('Categorias', ''),
                        Center(
                          child: BusinessCategoryCards(
                            selectedCategories: business.categories,
                            onChanged: (value) => {},
                          ),
                        ),
                        _buildProfileInfoItem(
                            'Offer IDs', business.offersIds.toString()),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _buildProfileInfoItem(String? label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 4),
          value.isEmpty
              ? const SizedBox.shrink()
              : Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
        ],
      ),
    );
  }
}
