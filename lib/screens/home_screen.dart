import 'package:flutter/material.dart';
import '../models/chat.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Sample data for demonstration
  List<Chat> get _chats => [
    Chat(
      id: '1',
      name: 'John Doe',
      lastMessage: 'Hey! How are you doing?',
      time: '2:30 PM',
      profileImage: 'https://via.placeholder.com/50',
      unreadCount: 2,
    ),
    Chat(
      id: '2',
      name: 'Sarah Smith',
      lastMessage: 'See you tomorrow!',
      time: '1:15 PM',
      profileImage: 'https://via.placeholder.com/50',
      unreadCount: 0,
    ),
    Chat(
      id: '3',
      name: 'Mike Johnson',
      lastMessage: 'Thanks for the help',
      time: '12:45 PM',
      profileImage: 'https://via.placeholder.com/50',
      unreadCount: 1,
    ),
    Chat(
      id: '4',
      name: 'Emily Davis',
      lastMessage: 'Great work on the project!',
      time: '11:30 AM',
      profileImage: 'https://via.placeholder.com/50',
      unreadCount: 0,
    ),
    Chat(
      id: '5',
      name: 'David Wilson',
      lastMessage: 'Let\'s meet at 5 PM',
      time: 'Yesterday',
      profileImage: 'https://via.placeholder.com/50',
      unreadCount: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          final chat = _chats[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue.shade100,
              child: Text(
                chat.name[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              chat.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            subtitle: Text(
              chat.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
                if (chat.unreadCount > 0) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen(chat: chat)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add_comment, color: Colors.white),
      ),
    );
  }
}
