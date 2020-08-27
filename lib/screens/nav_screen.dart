import 'package:flutter/material.dart';
import 'package:myflix/screens/all_screens.dart';
import 'package:myflix/widgets/all_widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 25.0),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 25.0),
                  title: Text('Search'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.queue_play_next, size: 25.0),
                  title: Text('Coming Soon'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_download, size: 25.0),
                  title: Text('Downloads'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu, size: 25.0),
                  title: Text('More'),
                ),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}
