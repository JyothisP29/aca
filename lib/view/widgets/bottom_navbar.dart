import 'package:flutter/material.dart';

import '../../Utilities/app_colors.dart';
import '../../Utilities/app_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 4,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-5,0),
            )
          ]
      ),
      height: 64,
      child: BottomNavigationBar(
        selectedFontSize: 12.0,

        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: AppColorPalette.grey,
        selectedItemColor: AppColorPalette.green,
        items:  [
          BottomNavigationBarItem(
              icon:currentIndex==0?const ImageIcon(AssetImage(AppIcons.selCourse)): const ImageIcon(AssetImage(AppIcons.courseNavBar)),
              label: 'Courses'),
           BottomNavigationBarItem(
              icon:currentIndex==1? const ImageIcon(AssetImage(AppIcons.selMyCourse)): const ImageIcon(AssetImage(AppIcons.myCourseNavBar)),
              label: 'My Courses'),
           BottomNavigationBarItem(
              icon: currentIndex==2?const ImageIcon(AssetImage(AppIcons.selNotification)):const ImageIcon(AssetImage(AppIcons.notificationsNavBar)),
              label: 'Notifications'),
           BottomNavigationBarItem(
              icon:currentIndex==3?const ImageIcon(AssetImage(AppIcons.selProfile)): const ImageIcon(AssetImage(AppIcons.profileNavBar)),
              label: 'Profile'),
        ],
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
