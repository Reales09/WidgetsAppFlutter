import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/charts/ordenes_charts.dart';
import 'package:widgets_app/presentation/screens/lottie/animation.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreens.name,
      builder: (context, state) => const ButtonsScreens(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreens.name,
      builder: (context, state) => const CardsScreens(),
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (context, state) => const AnimatedScreen(),
    ),
    GoRoute(
      path: '/charts',
      name: OrdenesWidget.name,
      builder: (context, state) => OrdenesWidget(),
    ),
    GoRoute(
      path: '/lottie',
      name: AnimatedWidget.name,
      builder: (context, state) => AnimatedWidget(),
    ),
  ],
);
