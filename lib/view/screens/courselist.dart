import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:acadle/view/screens/course_details.dart';
import 'package:flutter/material.dart';
import '../../controller/maincontroller.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: courseList.length,
      itemBuilder: (context, index) {
        final list = courseList.elementAt(index);
        final shortenedText =
            shortenText(courseList.elementAt(index).description ?? "", 65);
        final shortenedTitle =
        shortenText(list.name??"", 25);

        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CourseDetails()));
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
                      child: Image.asset(list.image ?? ""),
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: list.tag!.isEmpty
                          ? Container()
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: list.tag == "Featured"
                                      ? AppColorPalette.chipBlue
                                      : AppColorPalette.profileGreen),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 5),
                                child: Text(
                                  list.tag ?? "",
                                  style: AppTextStyle.tagFont(),
                                ),
                              )),
                            ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shortenedTitle,
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
                          sbh5,
                          Text(
                            shortenedText,
                            style: AppTextStyle.courseTileAdmin(),
                          ),
                        ],
                      ),
                        SizedBox(
                          height: 16,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final tagList =
                                list.courseTagList.elementAt(index);
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: const Color(0xFFA1A4B7)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                    child: Center(
                                      child: Text(
                                        tagList.tagName ?? "",
                                        style: AppTextStyle.tagFont(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                width: 5,
                              ),
                              itemCount: list.courseTagList.length),
                        ),

                        Column(
                          children: [
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
                                          style: AppTextStyle.footerFont(
                                           ),
                                        ),
                                        Container(width: 3,),
                                        Text(
                                          "Students",
                                          style: AppTextStyle.footerFont(
                                           ),
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
                                          style: AppTextStyle.footerFont(
                                              ),
                                        ),
                                        Container(width: 3,),

                                        Text(
                                          "Hours",
                                          style: AppTextStyle.footerFont(
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 3,),
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
    return '${text.substring(0, maxLength - 3)}...';
  }
}
