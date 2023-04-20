import 'package:choco_health_monitor/app/core/climate/climate_repository.dart';
import 'package:choco_health_monitor/app/pages/home_page.dart';
import 'package:choco_health_monitor/app/pages/second_page.dart';
import 'package:dio/dio.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: FlexThemeData.light(scheme: FlexScheme.brandBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.orangeM3),
      themeMode: ThemeMode.light,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
        Bind.singleton((i) => ClimateRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) =>
              HomePage(climateRepository: Modular.get<ClimateRepository>()),
        ),
        ChildRoute('/second', child: (context, args) => const SecondPage()),
      ];
}
