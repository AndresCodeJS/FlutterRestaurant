/* import 'dart:html'; */

import 'package:flutter/material.dart';
import 'package:flutter_start3/screens/second_page.dart';

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
      /*   home: MyHomePage(title: 'Flutter Demo Home Page'), */
      routes: {
        "/": (BuildContext context) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
        "/second": (BuildContext context) => const SecondPage(),
      },
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
  bool cambiaColor = false;

  late TextEditingController nameTextController;
  late TextEditingController lastNameTextController;

  late FocusNode focusName;
  late FocusNode focusLastName;

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
            GestureDetector(
              onTap: _onTap,
              onLongPress: _onLongPress,
              child: Text(
                '$_counter',
                style: const TextStyle(fontSize: 30, color: Colors.blue),
                /*  style: Theme.of(context).textTheme.headlineMedium, */
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  _showSecondPage(context);
                },
                child: const Text("Second Page")),
            TextButton(onPressed: () {}, child: const Text("Text Button")),
            ElevatedButton(
                onPressed: () {}, child: const Text("Elevated Button")),
            Switch(
              value: valueSwitch,
              onChanged: (value) {
                setState(() {
                  valueSwitch = value;
                });
              },
            ),
             Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
              child: TextField(
                decoration: const InputDecoration(labelText: "Nombre"),
                keyboardType: TextInputType.emailAddress,
                controller: nameTextController,
                focusNode: focusName,
                onEditingComplete: () => requestFocus(context, focusLastName),
                textInputAction: TextInputAction.next,
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
              child: TextField(
                decoration: const InputDecoration(labelText: "Apellido"),
                controller: lastNameTextController,
                focusNode: focusLastName,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    nameTextController = TextEditingController();
    lastNameTextController = TextEditingController();

    focusName = FocusNode();
    focusLastName = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameTextController.dispose();
    lastNameTextController.dispose();

    focusName.dispose();
    focusLastName.dispose();
  }

  //FocusNode
  void requestFocus(BuildContext context, FocusNode focusNode){
    FocusScope.of(context).requestFocus(focusNode);
  }

  void _incrementCounter() {
    setState(() {
      print("Debbugeando");
      _counter++;
    });
  }

  void _onTap() {
    print("Pulsaste");
    setState(() {
      cambiaColor = !cambiaColor;
    });
  }

  void _onLongPress() {
    print("Mantuviste presionando");
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).pushNamed("/second",
        arguments: Persona(apellido: lastNameTextController.text, nombre: nameTextController.text));
  }
}

class Persona {
  final String nombre;
  final String apellido;
  Persona({this.nombre = "", this.apellido = " "});
}
