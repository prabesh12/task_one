import 'package:flutter/material.dart';
import 'package:task1/pages/form/widgets/display_user.dart';
import 'package:task1/pages/form/widgets/form.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ShowUsers(),
    FormPage(),
  ];

  void _onItemTapped(int index) {
    _selectIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectIndex]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.blue,
          showSelectedLabels: true,
          unselectedItemColor: Colors.white,
          elevation: 10,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: "Show user",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                ),
                label: "Add User"),
          ]),
    );
  }
}
