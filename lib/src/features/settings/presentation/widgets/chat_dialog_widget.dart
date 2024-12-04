import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatDialog extends StatefulWidget {
  final String chatName;

  const ChatDialog({super.key, required this.chatName});

  @override
  ChatDialogState createState() => ChatDialogState();
}

class ChatDialogState extends State<ChatDialog> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hello!', 'isUser': false},
    {'text': 'How are you?', 'isUser': false},
  ];
  bool _isTyping = false;

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({'text': _messageController.text, 'isUser': true});
        _messageController.clear();
        _isTyping = false;
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Dialog.fullscreen(
        insetAnimationCurve: Curves.easeInOut,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    child: Text(widget.chatName[0]),
                  ),
                  const Gap(8.0),
                  Text(widget.chatName),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Align(
                        alignment: message['isUser']
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: message['isUser']
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.6),
                                decoration: BoxDecoration(
                                  color: message['isUser']
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  message['text'],
                                  style: TextStyle(
                                    color: message['isUser']
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add,
                            color: Theme.of(context).colorScheme.primary),
                        onPressed: () {
                          // Função para adicionar anexos
                        },
                      ),
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          onChanged: (value) => setState(() {
                            _isTyping = value.isNotEmpty;
                          }),
                          decoration: InputDecoration(
                            hintText: 'Escreva uma mensagem...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          onSubmitted: (value) => _sendMessage(),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(
                          _isTyping ? Icons.send : Icons.mic,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: _isTyping
                            ? _sendMessage
                            : () {
                                // Função para enviar áudio
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
