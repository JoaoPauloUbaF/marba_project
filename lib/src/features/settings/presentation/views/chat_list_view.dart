import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/chat_dialog_widget.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, String>> chats = [
      {'name': 'John Doe', 'lastMessage': 'Hey, how are you?'},
      {'name': 'Jane Smith', 'lastMessage': 'Let\'s catch up tomorrow!'},
      {
        'name': 'Mike Johnson',
        'lastMessage': 'Did you see the game last night?'
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversas'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          indent: 16,
          endIndent: 16,
        ),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(chats[index]['name']![0]),
            ),
            title: Text(chats[index]['name']!),
            subtitle: Text(chats[index]['lastMessage']!),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ChatDialog(chatName: chats[index]['name']!);
                },
              );
            },
          );
        },
      ),
    );
  }
}
