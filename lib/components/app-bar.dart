import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text("SLINKSHOT"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.send))
          )
        ],
      );
  }
}
