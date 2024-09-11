import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/router/app_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Sit minim adipisicing dolor eu. Officia esse aliquip labore irure veniam quis ipsum id adipisicing cupidatat cillum sint nulla et. Laboris commodo consequat anim eiusmod reprehenderit non tempor et ut ut cupidatat. Culpa non dolor anim voluptate consequat ex in nulla mollit. Laboris ad velit dolore fugiat amet deserunt elit magna aliqua ad excepteur. Ad pariatur voluptate Lorem non adipisicing ex.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Cancelar'),
          ),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                        'Et nisi tempor duis minim fugiat excepteur. Consectetur exercitation enim nisi est qui. Dolor eu culpa Lorem in veniam minim tempor ullamco duis minim. Veniam fugiat aute incididunt sunt nisi laborum sunt labore non non in do.')
                  ],
                );
              },
              child: Text('Licencias Usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar snackbar'),
      ),
    );
  }
}
