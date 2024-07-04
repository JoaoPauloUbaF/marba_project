import 'package:flutter/material.dart';

class EditableTextWidget extends StatefulWidget {
  const EditableTextWidget({
    super.key,
    required this.child,
    required this.onSubmitted,
  });

  final Text child;
  final Function(String) onSubmitted;

  @override
  State<EditableTextWidget> createState() => _EditableTextWidgetState();
}

class _EditableTextWidgetState extends State<EditableTextWidget> {
  TextEditingController? _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.child.data);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isEditing = true;
        });
      },
      child: _isEditing
          ? TextField(
              focusNode: FocusNode()..requestFocus(),
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    widget.onSubmitted(_controller?.text ?? '');
                    setState(() {
                      _isEditing = false;
                    });
                  },
                ),
              ),
              maxLines: 1,
            )
          : widget.child,
    );
  }
}
