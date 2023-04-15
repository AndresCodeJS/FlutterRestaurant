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
            final String url = "https://picsum.photos/id/$index/400/300";
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/second", arguments: url);
              },
              child: Hero(
                tag: url,
                child: Card(
                    /*    child: Image.asset(
                    "assets/circles-menu-1.gif",
                  ), */
                    child: FadeInImage(
                        height: 300,
                        fadeInCurve: Curves.easeOutSine,
                        placeholder:
                            const AssetImage("assets/circles-menu-1.gif"),
                        image: NetworkImage(
                           url))),
              ),
            );
          },
        ));
  }
}
