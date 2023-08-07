import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  static String ruta = 'status';
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = context.watch<SocketService>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.emit(
            'emitir-mensaje',
            {
              'nombre': 'Flutter',
              'mensaje': 'Hola desde Flutter',
            },
          );
        },
        child: const Icon(Icons.message),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Server Status: ${socketService.serverStatus}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
