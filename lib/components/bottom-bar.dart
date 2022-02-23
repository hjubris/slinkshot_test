import 'package:flutter/material.dart';
import 'package:slinkshot_test/pages/home-page.dart';
import 'package:slinkshot_test/pages/profile-page.dart';

class MyBottomBar extends StatefulWidget {
  final int selectedIndex;
  const MyBottomBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {

  List pageOptions = [HomePage(), ProfilePage()];

  onPageIconTapped(int index) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>pageOptions[index]));
  }

  void _onItemTapped(int index) {

  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 20,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  _onItemTapped(0);
                },
              ),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "Upload"),
          BottomNavigationBarItem(icon: Icon(Icons.face_retouching_natural), label: "Skins"),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  onPageIconTapped(1);
                  _onItemTapped(4);
                },
              ),
              label: "Account")
        ],
        selectedIconTheme: IconThemeData(color: Colors.white, opacity: 1.0),
        unselectedIconTheme: IconThemeData(color: Colors.white, opacity: 0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: widget.selectedIndex,
        onTap: _onItemTapped);
  }
}
