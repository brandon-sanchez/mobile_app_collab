import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/live_scores_page.dart';
import 'pages/login_page.dart';
import 'pages/players_page.dart';
import 'pages/standings_page.dart';
import 'pages/teams_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          '/loginpage': (context) => LoginPage(),
          '/homepage': (context) => HomePage(),
          '/livescores': (context) => LiveScoresPage(),
          '/standings': (context) => StandingsPage(),
          '/teams': (context) => TeamsPage(),
          '/players': (context) => PlayersPage(),
        });
  }
}
