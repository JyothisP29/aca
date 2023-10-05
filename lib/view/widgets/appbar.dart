import 'package:flutter/material.dart';

import '../../Utilities/app_colors.dart';
import '../../Utilities/app_icons.dart';
import '../../Utilities/custom_darktheme.dart';

class AppAppbar extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  const AppAppbar({super.key, this.title = '', this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 4, left: 0),
            child: SizedBox(
              child: Theme(
                data: Styles.themeData(true, context),
                child: Image.asset(
                  AppIcons.logoAcadle,
                  width: 121,
                  height: 30,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )),
        CircleAvatar(
          radius: 16,
          backgroundColor: AppColorPalette.lightGreen,
          child: Image.asset(
            AppIcons.leaderboard,
            width: 23,
            height: 23,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
