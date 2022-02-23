import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:slinkshot_test/utility/profile-persona.dart';

class UserData extends StatelessWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${ProfilePersona.bestStreamerPersona.followers}"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Followers"),
            ),
            OutlineGradientButton(
                radius: Radius.circular(5),
                child: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text("Tip"),
                  ),
                ),
                strokeWidth: 2,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.deepPurple[700]!, Colors.grey[800]!]))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("${ProfilePersona.bestStreamerPersona.slinkshots}"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Slinkshots"),
            ),
            OutlineGradientButton(
                radius: Radius.circular(5),
                child: SizedBox(
                  width: 40,
                  child: Center(
                    child: Text("Chat"),
                  ),
                ),
                strokeWidth: 2,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.deepPurple[700]!, Colors.grey[800]!]))
          ],
        ),
      ],
    );
  }
}
