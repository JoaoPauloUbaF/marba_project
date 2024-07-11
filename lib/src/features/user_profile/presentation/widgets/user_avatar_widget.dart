import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../application/profile_screen_controller/profile_screen_controller.dart';

class UserAvatarWidget extends ConsumerWidget {
  const UserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(profileScreenControllerProvider.notifier);
    ref.watch(profileScreenControllerProvider);
    return InkWell(
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
              avatars: viewModel.avatars,
            );
          },
        );
      },
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
