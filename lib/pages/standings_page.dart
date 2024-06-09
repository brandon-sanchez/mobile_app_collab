import 'package:flutter/material.dart';

class StandingsPage extends StatelessWidget {
  const StandingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder list of standings
    final List<Map<String, dynamic>> standings = [
      {'team': 'Lakers', 'wins': 40, 'losses': 20},
      {'team': 'Warriors', 'wins': 38, 'losses': 22},
      {'team': 'Nets', 'wins': 35, 'losses': 25},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Standings')),
      body: ListView.builder(
        itemCount: standings.length,
        itemBuilder: (context, index) {
          final standing = standings[index];
          return ListTile(
            title: Text(standing['team']),
            subtitle: Text('Wins: ${standing['wins']} | Losses: ${standing['losses']}'),
          );
        },
      ),
    );
  }
}