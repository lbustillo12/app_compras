import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_compras/src/views/detalle_producto_page.dart';
import 'package:app_compras/src/views/home_page.dart';
import 'package:app_compras/src/views/login_page.dart';

final router = GoRouter(
  initialLocation: '/productos',
  routes: [
    GoRoute(
      path: '/productos',
      name: 'productos',
      builder: (context, settings) => HomePage(),
      routes: [
        GoRoute(
          path: '/:productoId',
          name: 'detalle-producto',
          builder: (BuildContext context, GoRouterState settings) {
            final id = settings.pathParameters['productoId'];

            final extras = settings.extra as Map;
            print(extras);

            return DetalleProductoPage(id: '$id', extras: extras);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, settings) => LoginPage(),
    ),
  ],
);
