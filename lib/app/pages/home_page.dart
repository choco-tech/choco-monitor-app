import 'dart:async';
import 'package:choco_health_monitor/app/core/climate/climate_repository.dart';
import 'package:choco_health_monitor/app/core/climate/climate_response.dart';
import 'package:choco_health_monitor/app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final ClimateRepository climateRepository;

  const HomePage({super.key, required this.climateRepository});

  // TODO: Remove this logic from here
  @override
  State<HomePage> createState() => _HomePageState(climateRepository);
}

class _HomePageState extends State<HomePage> {
  final ClimateRepository climateRepository;

  String channel = 'Channel Name';
  double temperature = 0.0;
  double humidity = 0.0;
  Timer? mytimer;

  _HomePageState(this.climateRepository);

  void refreshData() async {
    ClimateResponse? response = await climateRepository.getLast();

    setState(() {
      channel = response?.channel.name ?? 'ERRO';
      temperature = response?.feeds[0].temperature ?? 0;
      humidity = response?.feeds[0].humidity ?? 0;
    });
  }

  @override
  void initState() {
    refreshData();

    mytimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      refreshData();
    });

    super.initState();
  }

  @override
  void dispose() {
    mytimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: refreshData,
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  channel,
                  style: GoogleFonts.roboto(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.thermostat,
                  color: Color.fromARGB(255, 182, 76, 74),
                  size: 35,
                ),
                title: Text(
                  'Temperatura',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  '$temperature ºC',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.water_drop,
                  color: Color.fromARGB(255, 111, 151, 221),
                  size: 35,
                ),
                title: Text(
                  'Humidade',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  '$humidity%',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      //),
    );
  }
}
