import 'package:flutter/material.dart';

class BusinessProfileImageWidget extends StatelessWidget {
  const BusinessProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
        image: NetworkImage(
            'https://scontent.fjdf6-1.fna.fbcdn.net/v/t39.30808-6/305526771_589615162866249_4361465910529182138_n.png?_nc_cat=109&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=JttfJl4LrgwAX8RS_pf&_nc_ht=scontent.fjdf6-1.fna&oh=00_AfC2yqeXTz4zjfXxM55-D4fKh4EwyCWmBUNklqpnJgLA1w&oe=65E400ED'));
  }
}
