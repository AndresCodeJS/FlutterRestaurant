import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animations"),
        ),
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
                /*    child: Image.asset(
                "assets/circles-menu-1.gif",
              ), */
                child: FadeInImage(
                  height: 300,
                  
                    placeholder: const AssetImage("assets/circles-menu-1.gif"),
                    image: NetworkImage(
                        "https://picsum.photos/id/$index/400/300")));
          },
        ));
  }
}
