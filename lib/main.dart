import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
MyApp()         //  It creates the app-wide state, name of app, visual theme, and home
  );
}

class MyApp extends StatelessWidget {
  // Get the UID
  const MyApp({super.key});

  // Create the constructor that would be my widget component

  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider( //The state is created and provided to the whole app using a ChangeNotifierProvider. This allows any widget in the app to get hold of the state.
        create: (context) => MyAppState(), // Creates an instance whenever MyApp is called, so I can use state whenever throughout the app.
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

//The state location
  /* defines the data the app needs to function. Right now, it only contains a single variable with the current random word pair. */
class MyAppState extends ChangeNotifier { //ChangeNotifier- it can notify others about its own changes. For example, if the current word pair changes, some widgets in the app need to know.
  var current = WordPair.random(); //Add TableTalkz questions here
  void getNext(){
    current = WordPair.random();
    notifyListeners(); // Calls notifyListeners()(a method of ChangeNotifier)that ensures that anyone watching MyAppState is notified.
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Tracks changes to the app's current state using the watch method.
    var pair = appState.current;

    return Scaffold(
      appBar: AppBar(
        title: Text('TableTalkz'),
        backgroundColor: const Color.fromARGB(255, 128, 116, 240),
        foregroundColor: const Color.fromARGB(255, 241, 241, 241),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: BigCard(pair: pair),
              ),
              ElevatedButton(onPressed: () {
                appState.getNext();
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
                color: Color.fromARGB(255, 128, 116, 240),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 128, 116, 240)),
                accountName: Text(
                  "Jovanni Feliz",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("jojo@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 235, 176, 66),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Color.fromARGB(255, 17, 17, 17),
                    ),
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
              title: const Text(' My Collection '),
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
              title: const Text(' My Own Questions '),
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

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(color: Colors.black);

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text( pair.asLowerCase,
        style: style),
        ),
      );
  }
}