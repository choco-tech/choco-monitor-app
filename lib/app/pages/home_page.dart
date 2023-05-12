import 'package:choco_health_monitor/app/styles/app_colors.dart';
import 'package:choco_health_monitor/app/widgets/room_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RoomWidget(roomId: 'room1'),
            RoomWidget(roomId: 'room2'),
          ],
        ),
      ),
    );
  }
}
