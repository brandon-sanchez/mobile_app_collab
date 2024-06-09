import 'package:flutter/material.dart';

class LiveScoresPage extends StatelessWidget {
  const LiveScoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder list of live scores
    final List<Map<String, String>> liveScores = [
      {'team1': 'Lakers', 'team2': 'Warriors', 'score': '102 - 98'},
      {'team1': 'Nets', 'team2': 'Bucks', 'score': '110 - 104'},
      {'team1': 'Heat', 'team2': 'Celtics', 'score': '95 - 92'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Live Scores')),
      body: ListView.builder(
        itemCount: liveScores.length,
        itemBuilder: (context, index) {
          final score = liveScores[index];
          return ListTile(
            title: Text('${score['team1']} vs ${score['team2']}'),
            subtitle: Text('Score: ${score['score']}'),
          );
        },
      ),
    );
  }
}