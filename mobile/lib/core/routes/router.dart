import 'package:flutter/material.dart';
import 'package:widget_nlw8/modules/home/home_page.dart';
import '../../domain/login/model/user_model.dart';
import '/core/config/app_config_page.dart';
import '/modules/splash/splash_page.dart';

// CLASSE COM TODA REGRA DAS ROTAS DO APLICATIVO
class RouterClass {
  // STRINGS DAS ROTAS
  static const String initial = "/";
  static const String splash = "/splash";
  static const String home = "/home";

  // FUNÇÃO DE GERAÇÃO DE ROTAS
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    // Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
    // PROCURA A ROTA

    switch (routeSettings.name) {
      // ROTA DA SPLASH
      case splash:
        return MaterialPageRoute(
            builder: (_) => SplashPage(redirect: true, key: UniqueKey()));

      case home:
        return MaterialPageRoute(builder: (_) => HomePage());

      // ROTA COM INICIAL DE CONFIGURAÇÕES
      case initial:
        return MaterialPageRoute(builder: (_) => const AppConfigPage());

      // ROTA CASO NÃO ACHE ROTA
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text("Erro ao achar a rota ${routeSettings.name}")),
          ),
        );
    }
  }
}
