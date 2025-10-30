import 'package:flutter/material.dart';

class StatusItem {
  final String id;
  final String name;
  final String time;
  final bool isViewed;
  final bool isMyStatus;

  StatusItem({
    required this.id,
    required this.name,
    required this.time,
    required this.isViewed,
    required this.isMyStatus,
  });
}

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  List<StatusItem> get _statusItems => [
    StatusItem(
      id: '0',
      name: 'My Status',
      time: 'Tap to add status update',
      isViewed: false,
      isMyStatus: true,
    ),
    StatusItem(
      id: '1',
      name: 'John Doe',
      time: '5 minutes ago',
      isViewed: false,
      isMyStatus: false,
    ),
    StatusItem(
      id: '2',
      name: 'Sarah Smith',
      time: '1 hour ago',
      isViewed: true,
      isMyStatus: false,
    ),
    StatusItem(
      id: '3',
      name: 'Mike Johnson',
      time: '3 hours ago',
      isViewed: false,
      isMyStatus: false,
    ),
    StatusItem(
      id: '4',
      name: 'Emily Davis',
      time: 'Yesterday',
      isViewed: true,
      isMyStatus: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Status',
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
        itemCount: _statusItems.length,
        itemBuilder: (context, index) {
          final status = _statusItems[index];
          return ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: status.isMyStatus
                      ? Colors.grey.shade300
                      : (status.isViewed ? Colors.grey.shade300 : Colors.green),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.blue.shade100,
                    child: status.isMyStatus
                        ? const Icon(Icons.add, color: Colors.blue)
                        : Text(
                            status.name[0].toUpperCase(),
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                if (!status.isViewed && !status.isMyStatus)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            title: Text(
              status.name,
              style: TextStyle(
                fontWeight: status.isMyStatus
                    ? FontWeight.w600
                    : FontWeight.w500,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              status.time,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            onTap: () {
              if (status.isMyStatus) {
                _showAddStatusDialog(context);
              } else {
                _showStatusView(context, status);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStatusDialog(context),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }

  void _showAddStatusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Status'),
        content: const Text('Choose how you want to add your status'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Camera'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Text'),
          ),
        ],
      ),
    );
  }

  void _showStatusView(BuildContext context, StatusItem status) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(status.name),
        content: Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Status Content\n(Image/Video would be here)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
