import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/team.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  late Future<List<Team>> _futureTeams;

  Future<List<Team>> fetchTeams({Map<String, dynamic>? queryParams}) async {
    var headers = {
      'x-rapidapi-host': 'api-nba-v1.p.rapidapi.com',
      'x-rapidapi-key': 'c58bd41582msh5ab0fd968e4ca6fp1dfebcjsn6754b6572502',
    };

    // Include the query parameters in the request if they are provided
    var uri = Uri.https('api-nba-v1.p.rapidapi.com', '/teams', queryParams);

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      print('Raw Response: ${response.body}');
      var parsedJson = json.decode(response.body);
      if (parsedJson != null && parsedJson['response'] != null) {
        List<dynamic> teamsJson = parsedJson['response'];
        List<Team> nbateams = teamsJson
            .map((json) => Team.fromJson(json))
            .where((team) => team.nbaFranchise == true)
            .toList();

        //Debugging
        print(
            'Conference of first team: ${nbateams.first.conference}, division: ${nbateams.first.division}');
        return nbateams;
      } else {
        throw Exception(
            'The expected "response" key was not found in the response.');
      }
    } else {
      throw Exception('Failed to load teams: ${response.reasonPhrase}');
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch all teams or provide specific query parameters here if needed
    _futureTeams = fetchTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: FutureBuilder<List<Team>>(
        future: _futureTeams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Team nbateam = snapshot.data![index];
                return ListTile(
                  title: Text(
                      '${nbateam.name ?? 'Unknown Name'} (${nbateam.code ?? 'N/A'})'),
                  subtitle: Text(
                      'Conference: ${nbateam.conference ?? 'N/A'}, Division: ${nbateam.division ?? 'N/A'}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No teams found'));
          }
        },
      ),
    );
  }
}
