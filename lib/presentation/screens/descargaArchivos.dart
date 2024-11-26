import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_filex/open_filex.dart';

import 'dart:io';

class DescargaArchivos extends StatelessWidget {
  final String fileUrl; // URL del archivo .doc
  final String fileName; // Nombre con el que se guardará el archivo

  const DescargaArchivos({
    super.key,
    required this.fileUrl,
    required this.fileName,
  });

  Future<void> downloadFile(BuildContext context) async {
    Directory directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else if (Platform.isAndroid) {
        directory = (await getExternalStorageDirectory())!;
      } else {
        throw UnsupportedError("Plataforma no soportada");
      }

      String filePath = '${directory.path}/$fileName';

      // Verifica si el archivo ya existe
      if (await File(filePath).exists()) {
        // Opcional: preguntar al usuario si desea sobrescribir el archivo
      }

      // Descarga el archivo
      Dio dio = Dio();
      await dio.download(
        fileUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            // Actualiza el estado de progreso si es necesario
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        },
      );

      // Abre o comparte el archivo
      await OpenFilex.open(filePath);
      // O
      // await Share.shareFiles([filePath], text: 'Aquí está tu documento.');

      // Notifica al usuario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Archivo descargado y abierto')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al descargar el archivo: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        downloadFile(context);
      },
      child: const Text('Descargar Documento'),
    );
  }
}
