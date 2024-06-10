import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'modal_center_top_line_widget.dart';

class BaseModalBodyWidget extends StatelessWidget {
  final Widget child;

  const BaseModalBodyWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            const Gap(8),
            const ModalCenterTopLineWidget(),
            const Gap(8),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
