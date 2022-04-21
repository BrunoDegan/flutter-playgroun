import 'package:flutter/material.dart';
import 'package:flutter_playground/src/about_page/flutterando_about_page.dart';
import 'package:flutter_playground/src/about_page/store/about_screen_store.dart';
import 'package:flutter_playground/src/common/strings_constants.dart';
import 'package:flutter_playground/src/main_page/view/page/flutterando_main_page.dart';
import 'package:flutter_playground/src/github_page/blocs/github_page_bloc.dart';
import 'package:flutter_playground/src/github_page/view/page/repositories_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  late List _pageOptions;

  @override
  Widget build(BuildContext context) {
    _pageOptions = [
      const FlutterandoActivitiesPage(),
      RepositoriesPage(bloc: Provider.of<GithubPageBloc>(context)),
      FlutterandoAboutPage(store: Provider.of<AboutPageStore>(context))
    ];

    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: _bottomNav(),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  BottomNavigationBar _bottomNav() {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      currentIndex: _selectedPage,
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color(0xFF055AA3),
      elevation: 20,
      backgroundColor: const Color(0XFF121517),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/flutterando_screen/activities_icon.png',
            width: 20,
            height: 20,
          ),
          label: flutterandoBottomsheetTitle1,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/flutterando_screen/github_icon.png',
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
      onTap: _onItemTapped,
    );
  }
}
