import 'package:flutter/material.dart';
import 'package:project_marba/src/core/widgets/loading_fullscreen_dialog_widget.dart';

bool isWideScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 600;
}

void showLoader(BuildContext context) {
  showDialog(
      context: context, builder: (_) => const LoadingFullscreenDialogWidget());
}

void hideLoader(BuildContext context) {
  Navigator.of(context).pop();
}
