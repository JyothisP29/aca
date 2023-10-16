import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:flutter/material.dart';

import '../../../Utilities/contstants.dart';

class BookmarksBottomSheet extends StatefulWidget {
  const BookmarksBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<BookmarksBottomSheet> createState() => _BookmarksBottomSheet();
}

class _BookmarksBottomSheet extends State<BookmarksBottomSheet> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          expand = true;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: expand
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * .7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sbh10,
                Center(
                  child: Container(
                    height: 3,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  ),
                ),
                sbh10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bookmarks",
                      style: AppTextStyle.header(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppIcons.close,
                        height: 24,
                      ),
                    )
                  ],
                ),
                sbh10,
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade200,
                  height: 1,
                ),
                sbh10,
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColorPalette.notificationSwap),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Build White-labelled Academies with Acadle",
                                  style: AppTextStyle.courseTileHeader(),
                                ),
                                sbh5,
                                Text(
                                  "Create user groups and assign courses to them. For example, you may want to create teams for various departments",
                                  style: AppTextStyle.body(),
                                ),
                                sbh5,
                                Text(
                                  "acadle.com",
                                  style: AppTextStyle.leaderboardBody(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 5,
                          ),
                      itemCount: 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
