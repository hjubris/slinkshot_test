import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:slinkshot_test/components/profile-pic.dart';
import 'package:slinkshot_test/components/video-data-icons.dart';
import 'package:slinkshot_test/utility/content.dart';
import 'package:slinkshot_test/utility/profile-persona.dart';
import 'dart:math' as math;

class ProfileVideos extends StatefulWidget {
  const ProfileVideos({Key? key}) : super(key: key);

  @override
  _ProfileVideosState createState() => _ProfileVideosState();
}

class _ProfileVideosState extends State<ProfileVideos> {
  bool gridSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: ProfilePersona.bestStreamerPersona.slinkshots,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return videoGridBuilder(index);
              })
          // : GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          //     scrollDirection: Axis.vertical,
          //     itemCount: ProfilePersona.bestStreamerPersona.slinkshots,
          //     itemBuilder: (context, index) {
          //       return videoListBuilder(index);
          //     },
          //   ),
    );
  }

  Widget videoGridBuilder(int index) {
    return Container(
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
    );
  }

  Widget videoListBuilder(int index) {
    return Padding(
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
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text("Clip n° $index"), Text("Clip descritpion")]),
                              ),
                            ),
                            VideoDataIcons(content: Content.contentSampleList[1]),
                          ]))
                ],
              )
            ],
          )),
    );
  }
}
