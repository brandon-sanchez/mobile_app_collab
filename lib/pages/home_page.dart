import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
          backgroundColor: Colors.grey,
          child: ListView(children: [
            //Image of side menu
            DrawerHeader(
              child:
                  Image.asset('lib/images/lebron.jpg', width: 10, height: 10),
            ),

            //Home Tile / Button
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
            ),

            //Live Scores Tile / Button
            ListTile(
              title: Text('Live Scores'),
              leading: Icon(Icons.sports_basketball_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/livescores');
              },
            ),

            //Standings Tile / Button
            ListTile(
              title: Text('Standings'),
              leading: Icon(Icons.leaderboard),
              onTap: () {
                Navigator.pushNamed(context, '/standings');
              },
            ),

            //Teams Tile / Button
            ListTile(
              title: Text('Teams'),
              leading: Icon(Icons.groups_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/teams');
              },
            ),

            //Players Tile / Button
            ListTile(
              title: Text('Players'),
              leading: Icon(Icons.person_search_rounded),
              onTap: () {
                Navigator.pushNamed(context, '/players');
              },
            ),
          ])),
    );
  }
}
