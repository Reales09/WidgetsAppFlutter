import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Trasnsportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Trasnsportation selectedTransportation = Trasnsportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        RadioListTile(
          title: const Text('By Car'),
          subtitle: const Text('Viajar por carro'),
          value: Trasnsportation.car,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Trasnsportation.car;
          }),
        ),
        RadioListTile(
          title: const Text('By Boat'),
          subtitle: const Text('Viajar por barco'),
          value: Trasnsportation.boat,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Trasnsportation.boat;
          }),
        ),
        RadioListTile(
          title: const Text('By avion'),
          subtitle: const Text('Viajar por avion'),
          value: Trasnsportation.plane,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Trasnsportation.plane;
          }),
        ),
        RadioListTile(
          title: const Text('By submarino'),
          subtitle: const Text('Viajar por submarino'),
          value: Trasnsportation.submarine,
          groupValue: selectedTransportation,
          onChanged: (value) => setState(() {
            selectedTransportation = Trasnsportation.submarine;
          }),
        ),
      ],
    );
  }
}
