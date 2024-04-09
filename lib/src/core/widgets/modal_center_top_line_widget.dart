import 'package:flutter/material.dart';

class ModalCenterTopLineWidget extends StatelessWidget {
  const ModalCenterTopLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 4,
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}
