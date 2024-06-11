import 'package:flutter/material.dart';
import 'package:project_marba/src/core/widgets/loading_widget.dart';

class LoadingFullscreenDialogWidget extends StatelessWidget {
  const LoadingFullscreenDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
