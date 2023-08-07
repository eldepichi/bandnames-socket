import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/pages/home_page.dart';
import 'package:band_names/pages/status_page.dart';
import 'package:band_names/services/socket_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.ruta,
        routes: {
          HomePage.ruta: (_) => const HomePage(),
          StatusPage.ruta: (_) => const StatusPage(),
        },
      ),
    );
  }
}
