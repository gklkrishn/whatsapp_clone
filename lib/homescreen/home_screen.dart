import 'package:flutter/material.dart';
import 'package:wtsap_clone/camera_screen/camera_screen%20.dart';
import 'package:wtsap_clone/chat_screen/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            PopupMenuButton(
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(child: Text('New group')),
                  PopupMenuItem(child: Text('New broadcast')),
                  PopupMenuItem(child: Text('Linked devices')),
                  PopupMenuItem(child: Text('Starred messsages')),
                  PopupMenuItem(child: Text('Payments')),
                  PopupMenuItem(child: Text('Setting')),
                ];
              },
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(child: Icon(Icons.camera_alt)),
              Tab(child: Text('CHATS')),
              Tab(child: Text('STATUS')),
              Tab(child: Text('CALLS')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            ChatScreen(),
            Center(
                child: Text(
              'THIS IS STATUS PAGE',
              style: TextStyle(fontFamily: 'DancingScript'),
            )),
            Center(child: Text('THIS IS CALLS PAGE'))
          ],
        ),
      ),
    );
  }
}
