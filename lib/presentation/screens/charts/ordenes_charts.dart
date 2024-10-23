import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class OrdenesWidget extends StatelessWidget {
  static const String name = 'charts';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Solución para evitar overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with TNS dropdown simulation
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ÓRDENES",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    DropdownButton<String>(
                      value: "TNS",
                      icon: Icon(Icons.arrow_drop_down),
                      underline: SizedBox(),
                      onChanged: (String? newValue) {},
                      items: <String>["TNS", "Option 2", "Option 3"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Total Pendiente
                Text(
                  "Total Pendiente 6,726.25 Tns",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),

                // May and June Rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMonthColumn("MAYO 2021", 1402.01, 1402.01, 1102.69),
                    _buildMonthColumn("JUNIO 2021", 1402.01, 80.36, 1102.69),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Buttons (Anterior, Siguiente)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios, size: 16),
                      label: Text("Anterior"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Ajusta el tamaño del Row al contenido
                        children: [
                          Text("Siguiente"), // Texto
                          SizedBox(
                              width: 8), // Espacio entre el texto y el icono
                          Icon(Icons.arrow_forward_ios,
                              size: 16), // Ícono al lado derecho
                        ],
                      ),
                    ),
                  ],
                ),

                // Nueva Orden
                Card(
                  elevation: 2,
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {},
                      style: ButtonStyle(
                        iconColor: const WidgetStatePropertyAll(Colors.red),
                      ),
                    ),
                    title: Text('Nueva orden'),
                    subtitle: Text('Crear tu nueva orden de compras.'),
                  ),
                ),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16),
                        SizedBox(width: 8),
                        Text("23:01h"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Ir a la página de órdenes",
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMonthColumn(
      String month, double pendiente, double despachado, double cerrado) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          month,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Pendiente: $pendiente",
          style: TextStyle(color: Colors.red),
        ),
        Text(
          "Despachado: $despachado",
          style: TextStyle(color: Colors.blue),
        ),
        Text(
          "Cerrado: $cerrado",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 8.0),
        _buildStackedBarChart(pendiente, despachado, cerrado),
      ],
    );
  }

  // Stacked bar chart
  Widget _buildStackedBarChart(
      double pendiente, double despachado, double cerrado) {
    return Container(
      height: 100,
      width: 170,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(isVisible: false),
        primaryYAxis: NumericAxis(isVisible: false),
        series: <CartesianSeries>[
          StackedBarSeries<ChartData, String>(
            dataSource: [
              ChartData('Pendiente', pendiente, Colors.red),
              ChartData('Despachado', despachado, Colors.blue),
              ChartData('Cerrado', cerrado, Colors.grey),
            ],
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            pointColorMapper: (ChartData data, _) => data.color,
          ),
        ],
      ),
    );
  }
}

// Helper class for chart data
class ChartData {
  final String category;
  final double value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}
