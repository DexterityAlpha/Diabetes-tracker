import 'package:diabetes_tracker/screens/Historyscreen.dart';
import 'package:diabetes_tracker/screens/HomeScreen.dart';
import 'package:diabetes_tracker/screens/SearchScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routname = "/HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    HistoryScreen(),
  ];
  int _currindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: screens[_currindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currindex,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _currindex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: ""),
          ],
        ),
      ),
    );
  }
}
