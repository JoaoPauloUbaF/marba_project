import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:project_marba/src/features/user_profile/presentation/widgets/verify_email_widget.dart';

import '../../../darkmode/presentation/components/theme_switch_widget.dart';
import '../../application/profile_screen_controller/profile_screen_controller.dart';
import '../widgets/user_info_widget.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
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
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitchWidget(),
        ],
      ),
      persistentFooterButtons: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/sign-in');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sair'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Excluir conta'),
                    content: const Text(
                        'Tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          user?.delete();
                          Navigator.pushReplacementNamed(context, '/sign-in');
                        },
                        child: const Text('Excluir'),
                      ),
                    ],
                  ),
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
