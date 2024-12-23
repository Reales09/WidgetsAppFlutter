import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widgets_app/presentation/file_downloader.dart';
import 'package:widgets_app/presentation/screens/descargaArchivos.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class ButtonsScreens extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screens')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 10,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
          const ElevatedButton(
              onPressed: null, child: Text('Elevated Disabled')),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_alarm_rounded),
            label: const Text('Elevated Icon'),
          ),
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.abc_sharp),
              label: const Text('Filled Icon')),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          OutlinedButton(
              onPressed: () async {
                PermissionStatus status = await Permission.photos.request();
                if (status.isGranted) {
                  // El permiso fue concedido, procede con la descarga
                  try {
                    final url =
                        // 'https://www.unipiloto.edu.co/descargas/archivo_administracion_de_empresas/guia_ensayos.pdf';
                        'https://ojs.docentes20.com/Plantilla-Ensayos-Espa%C3%B1ol.docx';
                    // 'https://definicion.com/wp-content/uploads/2022/09/imagen.jpg';

                    final bearerToken = 'tu_token_bearer_aquí'; // Opcional

                    // Obtiene el directorio donde puedes guardar archivos
                    Directory appDocDir =
                        await getApplicationDocumentsDirectory();
                    String savePath = path.join(appDocDir.path, 'archivo');

                    final downloader = FileDownloader();

                    print('Se hizo clic');

                    // Espera a que la descarga termine antes de continuar
                    await downloader.downloadFile(
                      url,
                      savePath,
                      onReceiveProgress: (int received, int total) {
                        if (total != -1) {
                          print(
                              'Progreso: ${(received / total * 100).toStringAsFixed(0)}%');
                        }
                      },
                    );

                    // Verifica si el archivo existe antes de intentar abrirlo
                    if (await File(savePath).exists()) {
                      // Abre el archivo descargado
                      final result = await OpenFilex.open(savePath);
                      print('Resultado de abrir el archivo: ${result.message}');
                    } else {
                      print(
                          'El archivo no existe en la ruta especificada: $savePath');
                    }
                  } catch (e) {
                    print('Ocurrió un error: $e');
                  }
                } else if (status.isDenied) {
                  // El usuario denegó el permiso
                  print('Permiso denegado');
                } else if (status.isPermanentlyDenied) {
                  // El permiso fue denegado permanentemente, abre la configuración de la app
                  openAppSettings();
                }
              },
              child: const Text('Descargar')),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_business),
            label: const Text('Outlined Icon'),
          ),
          TextButton(onPressed: () {}, child: const Text('Text Button')),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.alarm_add_sharp),
            label: const Text('Text Button Icon'),
          ),
          const CustomButton(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.reviews_outlined)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.reviews_outlined),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white)),
          ),
          OrderWidget(),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 16),
          _buildChart(),
          SizedBox(height: 16),
          _buildNewOrderButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ÓRDENES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'TMS',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Total Pendiente 6.726,25 Tns',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 1500,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            // bottomTitles: SideTitles(
            //   showTitles: true,
            //   getTextStyles: (context, value) => const TextStyle(fontSize: 12),
            //   showTitles: (double value) {
            //     switch (value.toInt()) {
            //       case 0:
            //         return 'MAYO 2021';
            //       case 1:
            //         return 'JUNIO 2021';
            //       default:
            //         return '';
            //     }
            //   },
            // ),
            // leftTitles: const SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            _buildBarGroup(0, 1402.01, 1402.01, 1102.69),
            _buildBarGroup(1, 1402.01, 80.36, 1102.69),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(
      int x, double pending, double dispatched, double closed) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(fromY: pending, color: Colors.red, width: 15, toY: 0.0),
        BarChartRodData(
            fromY: dispatched, color: Colors.blue, width: 15, toY: 1.0),
        BarChartRodData(fromY: closed, color: Colors.grey, width: 15, toY: 2.0),
      ],
    );
  }

  Widget _buildNewOrderButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.add, color: Colors.red),
      label: Text('Nueva orden'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.red,
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
