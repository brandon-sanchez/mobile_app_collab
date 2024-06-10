import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Make sure this is imported

class LiveScoresPage extends StatelessWidget {
  const LiveScoresPage({super.key});

  Future<List<Map<String, dynamic>>> fetchLiveScores(String date) async {
    var headers = {
      'x-rapidapi-host': 'api-nba-v1.p.rapidapi.com',
      'x-rapidapi-key': 'c58bd41582msh5ab0fd968e4ca6fp1dfebcjsn6754b6572502',
    };

    var queryParams = {
      'date': date,
    };

    var uri = Uri.https('api-nba-v1.p.rapidapi.com', '/games', queryParams);

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      if (parsedJson != null && parsedJson['response'] != null) {
        List<dynamic> gamesJson = parsedJson['response'];
        return List<Map<String, dynamic>>.from(gamesJson);
      } else {
        throw Exception('The expected "response" key was not found in the response.');
      }
    } else {
      throw Exception('Failed to load live scores: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current date in YYYY-MM-DD format
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text('Live Scores')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchLiveScores(currentDate),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No live scores found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final game = snapshot.data![index];
                return ListTile(
                  title: Text('${game['teams']['home']['name']} vs ${game['teams']['visitors']['name']}'),
                  subtitle: Text('Score: ${game['scores']['home']['points']} - ${game['scores']['visitors']['points']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}