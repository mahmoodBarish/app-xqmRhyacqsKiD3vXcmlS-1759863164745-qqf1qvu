import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/cart.dart';
import 'screens/payment.dart';
import 'screens/success_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/scan_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const ScanScreen();
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (BuildContext context, GoRouterState state) {
        return const Cart();
      },
    ),
    GoRoute(
      path: '/payment',
      builder: (BuildContext context, GoRouterState state) {
        return const Payment();
      },
    ),
    GoRoute(
      path: '/success_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SuccessScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
