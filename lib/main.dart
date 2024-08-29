import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
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

    final style = theme.textTheme.displayMedium!.copyWith(color: theme.colorScheme.onSurface);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase,
        style: style,
        semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
