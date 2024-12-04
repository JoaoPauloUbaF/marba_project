import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/authentication/presentation/screens/sign_in.dart';
import 'package:project_marba/src/features/user_profile/presentation/widgets/verify_email_widget.dart';

import '../../../authentication/data/firebase_auth_provider.dart';
import '../../../darkmode/presentation/components/theme_switch_widget.dart';
import '../../../home/presentation/widgets/animated_logo_loading_widget.dart';
import '../../application/profile_screen_controller/profile_screen_controller.dart';
import '../widgets/user_info_widget.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    return authState.when(data: (user) {
      if (user == null) {
        return const SignIn();
      }
      return const ProfileViewBody();
    }, loading: () {
      return const AnimatedLogoLoadingWidget();
    }, error: (error, stackTrace) {
      return const SignIn();
    });
  }
}

class ProfileViewBody extends ConsumerStatefulWidget {
  const ProfileViewBody({super.key});

  @override
  ConsumerState<ProfileViewBody> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileViewBody> {
  bool shouldShowEmailAlert = false;
  final user = FirebaseAuth.instance.currentUser;
  final List<AssetImage> avatars = List.generate(
    19,
    (index) => AssetImage('assets/avatars/avatar$index.png'),
  );

  @override
  void initState() {
    super.initState();
    if (user != null && !user!.emailVerified) {
      setState(() {
        shouldShowEmailAlert = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authStateChangeProvider);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitchWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfoWidget(),
              const Gap(16),
              if (shouldShowEmailAlert)
                VerifyEmailWidget(
                  user: user,
                  onDismiss: () {
                    setState(() {
                      shouldShowEmailAlert = false;
                    });
                  },
                ),
              const Gap(16),
              const UserSettingsGrid(),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                // Navigator.pushReplacementNamed(context, '/sign-in');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sair'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await ref
                    .read(profileScreenControllerProvider.notifier)
                    .deleteUser(
                      context,
                      user: user,
                    );
              },
              icon: const Icon(Icons.delete),
              label: const Text('Excluir conta'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class UserSettingsGrid extends ConsumerWidget {
  const UserSettingsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(profileScreenControllerProvider.notifier);

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final item in viewModel.getUserSettingsCardsContent(context))
          InkWell(
            onTap: item['onPressed'] as void Function()?,
            child: Card(
              color: Theme.of(context).colorScheme.tertiary,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    const Gap(8),
                    Text(
                      item['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
