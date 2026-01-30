import 'package:go_router/go_router.dart';
import 'package:flutterblognew/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutterblognew/screens/Auth/sign_in.dart';
import 'package:flutterblognew/screens/Auth/sign_up.dart';
import 'package:flutterblognew/utils/consts.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Pages.signIn.name,
          builder: (BuildContext context, GoRouterState state) {
            return const SignIn();
          },
        ),
        GoRoute(
          path: Pages.signUp.name,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUp();
          },
        ),
      ],
    ),
  ],
);
