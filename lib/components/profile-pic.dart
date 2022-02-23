import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
              tag: 'profilePic',
              child: Image.asset("ProfilePic.jpg"))),
        )
      );
    }
}
