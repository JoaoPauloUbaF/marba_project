import 'package:flutter/material.dart';

class UserAvatarWidget extends StatefulWidget {
  final int type;

  const UserAvatarWidget({super.key, required this.type});

  @override
  State<UserAvatarWidget> createState() => _UserAvatarWidgetState();
}

class _UserAvatarWidgetState extends State<UserAvatarWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    bool isMen = widget.type == 1;
    Color color = isMen ? Colors.blue : Colors.pink;

    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: isSelected ? color : Colors.grey[300],
        child: Icon(
          widget.type == 1 ? Icons.person_sharp : Icons.woman_sharp,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
