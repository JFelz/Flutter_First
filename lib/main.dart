

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/practice.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 152, 85, 207)),
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

  String nameX = 'Marcus';
  List<String> road = ['butt'];
  
  void printer(List<dynamic> n) {
    try {
      var priN = printEle;    // Assigning functions to variables
      n.forEach(priN);     /// Testing functions as first-class objects + tear-offs
      /// Tear-Off - Instead of:
      /// list.forEach((x){
      /// print(x);
      /// });
    } on FormatException {
      print('You must insert a non-null value');
    } on Exception catch (e){
      print('Oops! Your error is an unknown Exception: $e');
    } catch (e){
      print('Caught Error: $e');
    }
  }
  printer(list);

    (String N) {            // Anonymous Function
      print('This is $N Aurelius');
    }(nameX);              // Closure -  It's accessing a variable outside it's scope and calling it

    // Generators
    Iterable<dynamic> gener8(dynamic n) sync*{
      int k = 0;
      while (k < n.length) {
        yield k++;
      }
      print(k);
    }

    gener8(list);
    
    Stream<dynamic> gen8(dynamic n) async*{
      int k = 0;
      while (k < n.length) {
        yield k++;
      }
      print(k);
    }

    gen8(list);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('TableTalkz',
              style: TextStyle(fontSize: 25),)
            ),
            BigCard(pair: pair),
            SizedBox(height: 10),               // ← Change to this.
            ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: Text('Next Word'),
            ),
          ],
        ),
      ),
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
