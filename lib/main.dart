/* import 'dart:html'; */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/* class MyHomePage extends StatelessWidget {
  final String title;

  List<String> listaLetras = ["a", "b", "d"];

  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mi App",
          textAlign: TextAlign.center,
        ),
        actions: const <Widget>[
          IconButton(onPressed: add, icon: Icon(Icons.add))
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading:
            IconButton(onPressed: () => {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
        itemCount: listaLetras.length,
        itemBuilder: (BuildContext context, int index) {
          final name = listaLetras[index];
          /*   return Card(margin: const EdgeInsets.all(10),child: Text(name), ); */
          return Card(
              child: ListTile(
            title: Text(name),
            leading: const Icon(Icons.person),
            onTap: () => {onTap(name)},
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {print("Soy floating")}),
    );
  }
}

onTap(String name) {
 print("Hola Soy ${name}");
}

add() {
  print('soy appBar');
} */

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool valueSwitch = false;

  void _incrementCounter() {
    setState(() {
      print("Debbugeando");
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Switch(value: valueSwitch, onChanged:(value) {
              setState(() {
              valueSwitch = value;
                
              });
            },)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
