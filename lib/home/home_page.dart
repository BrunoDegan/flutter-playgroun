import 'package:flutter/material.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/flutterando_page/about/flutterando_about_page.dart';
import 'package:flutter_playground/flutterando_page/flutterando_main_page.dart';
import 'package:flutter_playground/flutterando_page/repositories_screen/repositories_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final _pageOptions = [
    const FlutterandoActivitiesPage(),
    const RepositoriesPage(),
    const FlutterandoAboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: _bottomNav(),
    );
  }

  BottomNavigationBar _bottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedPage,
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color(0xFF055AA3),
      elevation: 20,
      backgroundColor: const Color(0XFF121517),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/flutterando_screen/activities_icon.png",
            width: 20,
            height: 20,
          ),
          label: flutterandoBottomsheetTitle1,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/flutterando_screen/github_icon.png",
            width: 20,
            height: 20,
          ),
          label: flutterandoBottomsheetTitle2,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: flutterandoBottomsheetTitle3,
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedPage = index;
        });
      },
    );
  }
}
