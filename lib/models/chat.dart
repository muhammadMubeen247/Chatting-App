class Chat {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final String profileImage;
  final int unreadCount;

  Chat({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.profileImage,
    required this.unreadCount,
  });
}

class Message {
  final String id;
  final String text;
  final String time;
  final bool isMe;

  Message({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
  });
}
