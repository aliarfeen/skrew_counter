import 'package:flutter/material.dart';
import 'package:skrew_counter/ui/screens/add_players_name.dart';
import 'package:skrew_counter/ui/screens/end_game_screen.dart';
import 'package:skrew_counter/ui/screens/onboarding_screen.dart';
import 'package:skrew_counter/ui/screens/scoreboard_screen.dart';
import 'package:skrew_counter/ui/screens/set_players_number.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/set_players_number':
        return MaterialPageRoute(builder: (_) => const PlayersNumber());
      case '/add_players':
        final args = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => AddPlayers(
                  number: args,
                ));
      case '/scoreboard':
        final args = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => ScrewCounterScreen(
                  number: args,
                ));
      case '/end_game':
        return MaterialPageRoute(builder: (_) => EndGameScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(builder: (_) => const PlayersNumber());
    }
  }
}
