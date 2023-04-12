import 'package:flutter/material.dart';
import 'package:flutter_start3/main.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {

    print("Context es : ${ModalRoute.of(context)!.settings.arguments}");

    Persona persona = ModalRoute.of(context)!.settings.arguments as Persona;

    return Scaffold(
      appBar: AppBar(title:const Text("Second Page")),
      body:   Center(
        child: Text(persona.nombre),
      )

    );
  }
}