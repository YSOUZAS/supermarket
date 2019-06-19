import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/pages/brand/index.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    Container(),
    Container(),
    BrandsPage(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(_getName()),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text('Brands'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.storeAlt),
            title: Text('Supermarket'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ad),
            title: Text('Brands'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  String _getName() {
    switch (_currentIndex) {
      case 1:
        return "Supermarkets";
        break;
      case 2:
        return "Brands";
        break;
      default:
        return "Home";
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
