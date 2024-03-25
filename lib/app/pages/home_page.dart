import 'package:choco_health_monitor/app/styles/app_colors.dart';
import 'package:choco_health_monitor/app/widgets/room_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            'Choco Monitor',
            style: GoogleFonts.roboto(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: context.colors.background,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoomWidget(roomId: 'dhtDevice1'),
            RoomWidget(roomId: 'dhtDevice2'),
          ],
        ),
      ),
    );
  }
}
