import 'package:choco_health_monitor/app/utils/format_date.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/room/room.dart';

class RoomWidget extends StatefulWidget {
  final String roomId;
  final double margin = 20;
  final double borderRadius = 20;
  final double fontSize = 28;
  final double iconSize = 35;

  const RoomWidget({super.key, required this.roomId});

  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  Room room = Room('roomId', 'roomName', 0.0, 0.0, DateTime.now());

  @override
  void initState() {
    super.initState();

    DatabaseReference roomRef =
        FirebaseDatabase.instance.ref('data/${widget.roomId}/');

    roomRef.onValue.listen((DatabaseEvent event) {
      final map = event.snapshot.value as Map<Object?, Object?>;

      setState(() {
        room = Room.fromMap(map);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: widget.margin,
        right: widget.margin,
        bottom: widget.margin / 2,
        top: widget.margin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius),
        ),
        color: const Color.fromRGBO(40, 40, 40, 1),
      ),
      child: Column(
        children: [
          // Nome da Sala
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  room.name,
                  style: GoogleFonts.roboto(
                    color: const Color.fromARGB(199, 255, 255, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          // Temperatura e Umidade
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.thermostat,
                      color: Color.fromARGB(255, 182, 76, 74),
                      size: 35,
                    ),
                    Text(
                      '${room.celsius.toStringAsFixed(1)}ºC',
                      style: GoogleFonts.mulish(
                        color: Colors.white70,
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.water_drop,
                      color: Color.fromRGBO(103, 115, 209, 1),
                      size: 35,
                    ),
                    Text(
                      '${room.humidity.toStringAsFixed(1)}%',
                      style: GoogleFonts.mulish(
                        color: Colors.white70,
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // Última atualização
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  room.updatedAt.humanize(),
                  style: GoogleFonts.roboto(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
