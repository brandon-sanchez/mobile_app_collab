import 'package:flutter/material.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder list of players
    final List<Map<String, String>> players = [
      {'name': 'LeBron James', 'team': 'Lakers'},
      {'name': 'Stephen Curry', 'team': 'Warriors'},
      {'name': 'Kevin Durant', 'team': 'Nets'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Players')),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            title: Text(player['name']!),
            subtitle: Text('Team: ${player['team']}'),
          );
        },
      ),
    );
  }
}