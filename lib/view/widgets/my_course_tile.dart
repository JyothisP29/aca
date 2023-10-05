import 'package:acadle/view/screens/course_details_two.dart';
import 'package:flutter/material.dart';

import '../../Utilities/app_colors.dart';
import '../../Utilities/app_icons.dart';
import '../../Utilities/app_textstyle.dart';
import '../../Utilities/contstants.dart';
import '../../Utilities/custom_darktheme.dart';
import '../../controller/mycourse_controller.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({
    super.key,
  });

  final String defaultCountryname = 'Ind';
  final String longText =
      "In this course, we will specialize more on how to get the external applications...";

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: myCourseList.length,
      itemBuilder: (context, index) {
        final list = myCourseList.elementAt(index);
        final shortenedText = shortenText(list.description ?? "", 60);

        return InkWell(
          onTap:(){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CourseDetailsTwo()));
          },


          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(list.image??"",width: 100,)),
                    ),
                    list.tag!.isNotEmpty?
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color:list.tag=="New"?AppColorPalette.profileGreen: AppColorPalette.chipBlue),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 5),
                          child: Text(
                            myCourseList.elementAt(index).tag ?? "",
                            style: AppTextStyle.tagFont(),
                          ),
                        )),
                      ),
                    ):Container()
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                        Text(
                          list.name ?? "",
                          style: AppTextStyle.courseTileHeader(),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppIcons.person,
                              height: 10,
                            ),
                            sbw5,
                            Text(
                              list.adminName ?? "",
                              style: AppTextStyle.courseTileAdmin(),
                            )
                          ],
                        ),
                      ],),
                        sbh5,
                        Text(
                          shortenedText,
                          style: AppTextStyle.courseTileAdmin(),
                        ),
                        sbh5,
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 5,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                          BorderRadius.circular(
                                              5),
                                        ),
                                        height: 2,
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColorPalette
                                                .profileGreen,
                                            borderRadius:
                                            BorderRadius.circular(
                                                10)),
                                        height: 5,
                                        width: 160,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            sbw5,
                            Row(
                              children: [
                                Text(
                                  list.percentage ?? "0",
                                  style: AppTextStyle.percentage(),
                                ),
                                Text(
                                 "%",
                                  style: AppTextStyle.percentage(),
                                ),

                              ],
                            )
                          ],
                        ),
                        sbh5,
                        Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 2.0),
                                    child: Image.asset(AppIcons.eye,color: AppColorPalette.searchBarColor,height: 11,)
                                ),
                                sbw5,
                                Row(
                                  children: [
                                    Text(
                                      list.students ?? "",
                                      style: AppTextStyle.footerFont(),
                                    ),
                              Container(width: 3,)
                                    ,Text(
                                      "Students",
                                      style: AppTextStyle.footerFont(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            sbw15,
                            Container(
                              height: 11,
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                            sbw15,
                            Row(
                              children: [
                                const Icon(
                                  Icons.alarm,
                                  size: 10,
                                  color: AppColorPalette.searchBarColor,
                                ),
                                sbw5,
                                Row(
                                  children: [
                                    Text(
                                      list.duration ?? "",
                                      style: AppTextStyle.footerFont(),
                                    ),
                                    sbw5,
                                    Text(
                                      "Hours",
                                      style: AppTextStyle.footerFont(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            sbh5,
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey.withOpacity(.2),
          ),
        );
      },
    );
  }

  String shortenText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength - 3) + '...';
  }
}
