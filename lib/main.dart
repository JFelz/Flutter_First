import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/button_random.dart';
import 'package:namer_app/title.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/gradient_container.dart';


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
        // AppBar Background Color
        flexibleSpace: GradientContainer(
          alignLeft: Alignment.topLeft, 
          alignRight: Alignment.bottomRight,
          colorStart: Color.fromARGB(255, 56, 119, 92),
          colorEnd: Color.fromARGB(255, 121, 255, 222),
        ),
        title: Text('TableTalkz', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),
        fontWeight:FontWeight.bold
        )),
        foregroundColor: const Color.fromARGB(255, 241, 241, 241),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      
      body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleName('Generate a new question!', textColor: Color.fromARGB(255, 0, 255, 229),),// Calling from external file
              Center(
                child: BigCard(pair: pair),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(onPressed: () {
                  appState.getNext();
                },
                    child: ButtonRandom('NextQuestion',
                    textColor: Color.fromARGB(255, 0, 0, 0),
                    ),
                ),
              ),
            ],
          ),
      //Drawer
    );
  }
}


// I am trying to pass a widget into my custom widget by calling it through the Constructor named parameters

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
