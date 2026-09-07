import 'package:flutter/material.dart';
import 'package:mini_shop/core/routing/no_route_found.dart';

class RoutingManager {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(builder: (_) => NoRouteFoundView());
    }
  }
}
