import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          children: [
            // Drawer header with image
            DrawerHeader(
              child: Image.asset('lib/images/lebron.jpg', width: 10, height: 10),
            ),
            // Home Tile / Button
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            // Live Scores Tile / Button
            ListTile(
              title: const Text('Live Scores'),
              leading: const Icon(Icons.sports_basketball_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/livescores');
              },
            ),
            // Standings Tile / Button
            ListTile(
              title: const Text('Standings'),
              leading: const Icon(Icons.leaderboard),
              onTap: () {
                Navigator.pushNamed(context, '/standings');
              },
            ),
            // Teams Tile / Button
            ListTile(
              title: const Text('Teams'),
              leading: const Icon(Icons.groups_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/teams');
              },
            ),
            // Players Tile / Button
            ListTile(
              title: const Text('Players'),
              leading: const Icon(Icons.person_search_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/players');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text('Welcome to the Sports App!'),
      ),
    );
  }
}