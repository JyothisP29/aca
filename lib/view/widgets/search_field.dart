import 'package:flutter/material.dart';

import '../../Utilities/app_colors.dart';
import '../../Utilities/app_textstyle.dart';
import '../../Utilities/custom_darktheme.dart';

class SearchField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? searchController;

  const SearchField(
      {super.key, required this.onChanged, this.searchController});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Styles.themeData(true, context),
        child: Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              controller: searchController,
              onChanged: onChanged,
              cursorColor: AppColorPalette.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: 'Search...',
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColorPalette.white, width: 0),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintStyle: AppTextStyle.searchBarHint(
                    color: AppColorPalette.searchBarColor.withOpacity(.7)),
                // prefixIcon: const Icon(
                //   Icons.search,
                //   size: 24,
                // ),
                // suffix: CircleAvatar(
                //   radius: 20,
                //   backgroundColor: Colors.grey.withOpacity(.2),
                //   child: Icon(Icons.add_chart_sharp),
                // ),
                // prefixIconColor: AppColorPalette.searchColor),
              ),
            ),
          ),
        ));
  }
}
