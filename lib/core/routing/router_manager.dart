import 'package:flutter/material.dart';
import 'package:mini_shop/core/routing/app_routes.dart';
import 'package:mini_shop/core/routing/no_route_found.dart';
import 'package:mini_shop/features/auth/login/ui/views/login_view.dart';
import 'package:mini_shop/features/auth/signup/ui/views/signup_view.dart';
import 'package:mini_shop/features/home/ui/views/main_view.dart';

class RoutingManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.signupView:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case AppRoutes.mainView:
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return MaterialPageRoute(builder: (_) => const NoRouteFoundView());
    }
  }
}
