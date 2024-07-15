import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/widgets/editable_text_widget.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';
import 'package:project_marba/src/features/user_profile/presentation/widgets/user_avatar_widget.dart';

import '../../application/profile_screen_controller/profile_screen_controller.dart';

class UserInfoWidget extends ConsumerWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(profileScreenControllerProvider.notifier);
    ref.watch(profileScreenControllerProvider);
    ref.watch(authStateChangeProvider);
    final userAuth = ref.read(authRepositoryProvider).getCurrentUser();
    final userProfile = ref.watch(currentUserProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const UserAvatarWidget(),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserNameWidget(),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.email,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const Gap(8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: EditableTextWidget(
                    onSubmitted: (value) {
                      viewModel.updateEmail(value, context);
                    },
                    child: Text(
                      userAuth?.email ?? 'Email não disponível',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const Gap(8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: EditableTextWidget(
                    mask: MaskedTextController(
                      mask: '(00) 00000-0000',
                      text: userProfile?.phoneNumber ?? '',
                    ),
                    child: Text(
                      userProfile?.phoneNumber ?? '(00) 00000-0000',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    onSubmitted: (value) {
                      viewModel.updatePhoneNumber(value);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class UserNameWidget extends ConsumerWidget {
  const UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final viewModel = ref.watch(profileScreenControllerProvider.notifier);
    final viewState = ref.watch(profileScreenControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: viewState == ProfileViewState.loading
          ? const LinearProgressIndicator()
          : EditableTextWidget(
              child: Text(
                user?.displayName ?? 'Nome não disponível',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              onSubmitted: (value) async {
                viewModel.updateDisplayName(value, user);
              },
            ),
    );
  }
}
