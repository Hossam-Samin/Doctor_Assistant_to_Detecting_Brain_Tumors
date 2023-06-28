import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/chat_screen/chat_login_screen.dart';
import '../detecting_images/brain_tumor/brain_tumor.dart';
import '../favirote_screen/favirote_screen.dart';
import '../settings_screen/settings_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const BrainScreen(),
    const FaviroteScreen(),
    const ChatLogin(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home_filled),
              inactiveColor: Colors.black,
              textAlign: TextAlign.center,
              title: const Text('Home Check'),
              activeColor: Colors.orange,
            ),
            BottomNavyBarItem(
                inactiveColor: Colors.black,
                textAlign: TextAlign.center,
                icon: const Icon(Icons.favorite_outline),
                title: const Text('Favorite'),
                activeColor: Colors.orange),
            BottomNavyBarItem(
                inactiveColor: Colors.black,
                textAlign: TextAlign.center,
                icon: const Icon(Icons.chat_outlined),
                title: const Text('Chat'),
                activeColor: Colors.orange),
            BottomNavyBarItem(
                inactiveColor: Colors.black,
                textAlign: TextAlign.center,
                icon: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                activeColor: Colors.orange),
          ],
        ));
  }
}
