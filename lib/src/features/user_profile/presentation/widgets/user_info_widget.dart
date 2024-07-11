import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/core/widgets/editable_text_widget.dart';
import 'package:project_marba/src/features/authentication/data/firebase_auth_provider.dart';
import 'package:project_marba/src/features/user_profile/application/current_user_profile_provider/current_user_profile_provider.dart';

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
    final userProfile = ref.read(currentUserProvider);
    final avatars = viewModel.avatars;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: FutureBuilder(
            builder: (context, snapshot) {
              return CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: snapshot.data ??
                          const AssetImage('assets/avatars/avatar1.png'),
                      fit: BoxFit.cover,
                    ),
                  ));
            },
            future: viewModel.getProfileImage(),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AvatarSelectionDialog(
                  viewModel: viewModel,
                  avatars: avatars,
                );
              },
            );
          },
        ),
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

class AvatarSelectionDialog extends StatefulWidget {
  const AvatarSelectionDialog({
    super.key,
    required this.viewModel,
    required this.avatars,
  });

  final ProfileScreenController viewModel;
  final List<AssetImage> avatars;

  @override
  State<AvatarSelectionDialog> createState() => _AvatarSelectionDialogState();
}

class _AvatarSelectionDialogState extends State<AvatarSelectionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 70,
                mainAxisSpacing: 8,
              ),
              itemCount: 18,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  builder: (context, snapshot) {
                    return CircleAvatar(
                      radius: 40,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          widget.viewModel
                              .updateProfileImage(
                                widget.avatars[index].assetName,
                              )
                              .then((value) => setState(() {}));
                        },
                        child: Opacity(
                          opacity:
                              snapshot.data == widget.avatars[index] ? 1 : 0.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image(
                              image: widget.avatars[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  future: widget.viewModel.getProfileImage(),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
