
import 'package:flutter/material.dart';
import 'package:flutter_go_router/presentation/screens/login/screen.dart';

part of '../route.dart';

class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute();

  static const String pahth = '/login';
  static const String name = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}