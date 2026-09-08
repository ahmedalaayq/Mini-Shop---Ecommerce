import 'package:flutter/material.dart';
import 'package:mini_shop/core/routing/app_routes.dart';
import 'package:mini_shop/core/routing/no_route_found.dart';
import 'package:mini_shop/features/auth/login/ui/views/login_view.dart';

class RoutingManager {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(builder: (_) => NoRouteFoundView());
    }
  }
}
