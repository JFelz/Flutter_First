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
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        ),
        home: MyHomePage(),
      ),
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
        var appState = context.watch<MyAppState>();
    var pair = appState.current;              

    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 77, 0, 0),
              Color.fromARGB(255, 156, 0, 0),
              Color.fromARGB(255, 202, 0, 0),
              Color.fromARGB(255, 255, 0, 0),
              Color.fromARGB(255, 255, 31, 31),
              Color.fromARGB(255, 255, 124, 124),
            ],
              ),
            ),
        child: Center(
          child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('TableTalkz',
                          style: TextStyle(fontSize: 15),
                           ),
                        ),
                        BigCard(pair: pair),
                        SizedBox(height: 10),              
                        ElevatedButton(
                          onPressed: () {
                            appState.getNext();
                          },
                          child: Text('Next Word', style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20.0
                          ),),
                        ),
                      ],
                    ),
        ),
      ),
              );
  }
}

// class GradientContainer extends StatelessWidget {

// @override
//   Widget build(BuildContext context) {

//     return Container(
//     );
//   }
// }


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