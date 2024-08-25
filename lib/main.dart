import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
MyApp()
  );
}

class MyApp extends StatelessWidget {
  // Get the UID
  const MyApp({super.key});

  // Create the constructor that would be my widget component

  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 98, 0, 255))
          ),
        home: MyHome(),
          )
        );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); //Add TableTalkz questions here
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('TableTalkz'),
        backgroundColor: const Color.fromARGB(255, 128, 116, 240),
        foregroundColor: const Color.fromARGB(255, 241, 241, 241),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      
      body: Column(
            children: [
              Center(
                child: Text(appState.current.asLowerCase,
                style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),

                
              ),
              ElevatedButton(onPressed: () {
                print('Button is pressed');
              },
              child: Text(' Next Question'),
              ),
            ],
          ),
      drawer: Drawer( // Learning purposes
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //Drawer
    );
  }
}
