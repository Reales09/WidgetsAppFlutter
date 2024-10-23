import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedWidget extends StatelessWidget {
  static const String name = 'lottie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/ternium_acero_background.png'), // Imagen de fondo
            fit: BoxFit.cover, // La imagen cubrirá toda la pantalla
          ),
        ),
        child: SizedBox.expand(
          // Expande para ocupar todo el espacio disponible
          child: Lottie.asset(
            'assets/ternium_animation.json',
            fit: BoxFit
                .cover, // Ajusta la animación para cubrir toda la pantalla
          ),
        ),
      ),
    );
  }
}
