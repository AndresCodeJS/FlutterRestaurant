import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Imagen Detail"),
        ),
        body: Hero(
          tag: url,
          child: Image.network(url)
        ));
  }
}
