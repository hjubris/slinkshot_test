import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:slinkshot_test/components/app-bar.dart';
import 'package:slinkshot_test/components/bottom-bar.dart';
import 'package:slinkshot_test/components/video-data-icons.dart';
import 'package:slinkshot_test/utility/buttons.dart';
import 'package:slinkshot_test/utility/constants.dart';
import 'package:slinkshot_test/utility/content.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ButtonModel> buttonList = ButtonModel.buttonList;
  LinearGradient buttonGradientOn = new LinearGradient(colors: [Colors.orange[600]!, Colors.purple]);
  LinearGradient buttonGradientOff = new LinearGradient(colors: [Colors.white, Colors.grey[800]!]);
  bool isPressed = false;
  int selectedCategory = 0;
  bool shotsSelected = true;

  List<Content>? content = Content.contentSampleList;
  List<Content>? visibleContent;

  @override
  void initState() {
    super.initState();
    visibleContent = content;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(70), child: MyAppBar()),
      bottomNavigationBar: MyBottomBar(selectedIndex: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
            color: primaryBlack,
            width: size.width,
            height: size.height,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 20,

                ///This ListView builder creates a list of categories, based on the games selected by the user.
                ///Here I created a mock list in the category-builder file
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttonList.length,
                    itemBuilder: (context, index) {
                      return buttonBuilder(index);
                    }),
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
                              shotsSelected = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: shotsSelected ? Colors.grey[850] : primaryBlack),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text("Shots"),
                                )),
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.fitHeight,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                shotsSelected = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: !shotsSelected ? Colors.grey[850] : primaryBlack),
                                child: Row(
                                  children: [
                                    Text(
                                      "·",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text("Live"),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: PageView.builder(
                physics: PageScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: visibleContent?.length,
                itemBuilder: (context, index) {
                  return contentBuilder(index);
                },
              ))
            ])),
      ),
    );
  }

  Widget buttonBuilder(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: FittedBox(
        fit: BoxFit.fill,
        child: OutlineGradientButton(
          onTap: () {
            _filterCategory(index);
            setState(() {
              selectedCategory = index;
            });
          },
          strokeWidth: 2,
          radius: Radius.circular(50),
          gradient: selectedCategory == index ? buttonGradientOn : buttonGradientOff,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(buttonList[index].name, style: TextStyle(color: Colors.white, fontSize: 30))),
        ),
      ),
    );
  }

  Widget contentBuilder(int index) {
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
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.account_circle_outlined,
                                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(visibleContent![index].username),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(visibleContent![index].category))
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: visibleContent![index].isVerified!
                              ? Icon(
                                  Icons.check_circle,
                                  size: 15,
                                  color: Colors.orange[800],
                                )
                              : SizedBox.shrink()),
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
                          crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            padding: const EdgeInsets.symmetric(horizontal:10.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start, children: [
                              visibleContent![index].title != null
                                  ? Text(visibleContent![index].title!, style: TextStyle(fontWeight: FontWeight.bold),)
                                  : SizedBox.shrink(),
                              visibleContent![index].description != null
                                  ? Text(visibleContent![index].description!)
                                  : SizedBox.shrink()
                            ]),
                          ),
                        ),
                        VideoDataIcons(content: visibleContent![index]),
                      ]))
                ],
              )
            ],
          )),
    );
  }

  void _filterCategory(int typeId) {
    typeId == 0
        ? visibleContent = content
        : visibleContent = content!.where((Content element) => element.categoryId == typeId).toList();
    setState(() {
      selectedCategory = typeId;
    });
  }
}
