import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:slinkshot_test/components/bottom-bar.dart';
import 'package:slinkshot_test/components/profile-pic.dart';
import 'package:slinkshot_test/components/profile-videos.dart';
import 'package:slinkshot_test/components/user-data.dart';
import 'package:slinkshot_test/components/video-data-icons.dart';
import 'package:slinkshot_test/utility/constants.dart';
import 'package:slinkshot_test/utility/content.dart';
import 'package:slinkshot_test/utility/profile-persona.dart';
import 'dart:math' as math;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool gridSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
        ),
        bottomNavigationBar: MyBottomBar(
          selectedIndex: 4,
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePic()));
                              },
                              child: Hero(
                                tag: 'profilePic',
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: AssetImage('ProfilePic.jpg'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "${ProfilePersona.bestStreamerPersona.name} (${ProfilePersona.bestStreamerPersona.avatarName})",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Text(ProfilePersona.bestStreamerPersona.description),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineGradientButton(
                              radius: Radius.circular(25),
                              onTap: () {},
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2, child: Center(child: Text("Follow"))),
                              strokeWidth: 2,
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.deepPurple[700]!, Colors.red])),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UserData(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: 20,
                            width: 75,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(50)),

                            ///For the shots/live selection there are two buttons, with basically the same functionality.
                            ///To avoid making another class and creating a list of just two items, I copied the code for the first button
                            ///and modified it to create the second, using a bool called shotsSelected
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        gridSelected = true;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: gridSelected ? Colors.grey[850] : primaryBlack),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                            child: Text("Grid"),
                                          )),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          gridSelected = false;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: !gridSelected ? Colors.grey[850] : primaryBlack),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                            child: Text("List"),
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ])),
            gridSelected
                ? SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) {
                        return videoGridBuilder(index);
                      },
                      childCount: ProfilePersona.bestStreamerPersona.slinkshots,
                    ))
                : SliverFixedExtentList(
              itemExtent: MediaQuery.of(context).size.height-130,
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) {
                        return videoListBuilder(index);
                      },
                      childCount: ProfilePersona.bestStreamerPersona.slinkshots,
                    ))
          ],
        ));
  }

  Widget videoGridBuilder(int index) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration:
            BoxDecoration(color: Color((math.Random().nextDouble() * 0xFFFFFF * (index + 1)).toInt()).withOpacity(0.7)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "This is an awesome clip",
            textAlign: TextAlign.center,
          ),
        )),
      ),
    );
  }

  Widget videoListBuilder(int index) {
    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: OutlineGradientButton(
              onTap: () {},
              gradient: LinearGradient(colors: [
                Color((math.Random().nextDouble() * 0xFFFFFF * (index + 1)).toInt()).withOpacity(1.0),
                Color((math.Random().nextDouble() * 0xFFFFFF * (index + 1)).toInt()).withOpacity(1.0)
              ]),
              radius: Radius.circular(30),
              strokeWidth: 5,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 70,
                    ),

                    ///Video placeholder
                    child: Container(
                        decoration: BoxDecoration(
                      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                    )),
                  ),

                  ///Profile and clip info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePic()));
                                },
                                child: Hero(
                                  tag: Text('profilePic'),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: AssetImage('ProfilePic.jpg'),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ProfilePersona.bestStreamerPersona.name),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: Text("General"))
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.check_circle,
                                size: 15,
                                color: Colors.orange[800],
                              )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: OutlinedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                                onPressed: () {},
                                child: Text("Follow")),
                          )
                        ],
                      ),

                      ///Clip description and data
                      Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Colors.grey[700]!, Colors.black])),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [Text("Clip n° $index"), Text("Clip descritpion")]),
                                    ),
                                  ),
                                ),
                                VideoDataIcons(content: Content.contentSampleList[1]),
                              ]))
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
