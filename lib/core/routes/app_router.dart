import 'package:clean_mvvm/common/error_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => Container());
      case '/home':
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: ErrorView(message: 'No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
