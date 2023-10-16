import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/view/screens/my_courses.dart';
import 'package:acadle/view/screens/profile_screen.dart';
import 'package:acadle/view/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'courses.dart';
import 'notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.index, this.notificationTabIndex});

  final int? index;
  final int? notificationTabIndex;
  static const route = '/home_page';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<int> _previousIndexes = [];
  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      const Courses(),
      const MyCourses(),
      Notifications(tabIndex: widget.notificationTabIndex),
      const Profile(),
    ];
    if (widget.index != null) _selectedIndex = widget.index!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          SystemNavigator.pop();
          return true;
        } else if (_previousIndexes.isNotEmpty) {
          setState(() {
            _selectedIndex = _previousIndexes.removeLast();
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          backgroundColor: AppColorPalette.bgColor,
          body: pages[_selectedIndex],
          bottomNavigationBar: SafeArea(
            child: BottomNavBar(
              currentIndex: _selectedIndex,
              onTap: (int index) {
                _previousIndexes.add(_selectedIndex);
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          )),
    );
  }
}
