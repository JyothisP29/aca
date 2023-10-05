import 'dart:core';

import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_images.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:acadle/view/screens/courselist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utilities/app_icons.dart';
import '../../Utilities/app_textstyle.dart';
import '../widgets/search_field.dart';
import 'home_screen.dart';
import 'leaderboard.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> with TickerProviderStateMixin {
  int selectedTag = 0;
  List<String> tags = ["All", "New", "Intro", "About"];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Image.asset(
              fit: BoxFit.scaleDown,
              AppIcons.logoAcadle,
            ),
          ),
          leadingWidth: 120,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LeaderBoard()),
                  );
                },
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColorPalette.lightGreen,
                  child: Image.asset(
                    AppIcons.leaderboard,
                    width: 20,
                    height: 20,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1, color: AppColorPalette.borderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color:
                              AppColorPalette.searchBarColor.withOpacity(.7),
                        ),
                        sbw5,
                        SearchField(
                          onChanged: (String) {},
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor:
                              AppColorPalette.iconBg.withOpacity(.5),
                          child: Image.asset(
                            color: AppColorPalette.grey.withOpacity(.6),
                            AppIcons.sort,
                            width: 20,
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                sbh10,
                Container(
                  height: MediaQuery.of(context).size.height*.73,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      sbh10,
                      SizedBox(
                        height: 30,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: tags.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                selectedTag = index;
                                // print(selectedTag);
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedTag == index
                                      ? AppColorPalette.tagColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Center(
                                    child: Text(
                                      tags.elementAt(index),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: selectedTag == index
                                              ? Colors.white
                                              : AppColorPalette.tagColor),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 6,
                            );
                          },
                        ),
                      ),
                      sbh10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Courses",
                            style: AppTextStyle.sectionTitle(),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen(
                                      index: 1,
                                    )),
                              );
                            },
                            child: Text(
                              "See All",
                              style: AppTextStyle.seeAll(),
                            ),
                          )
                        ],
                      ),
                      sbh10,
                      Container(
                        height: 76,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                width: 58,
                                height: 58,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                                child: Image.asset(AppImages.q),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Academy Best Practice",
                                        style: AppTextStyle.courseTileHeader(),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppIcons.person,
                                            height: 12,
                                          ),
                                          sbw5,
                                          Text(
                                            "Nizamudheen",
                                            style: AppTextStyle.courseTileAdmin(),
                                          )
                                        ],
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
                                                        color: Color(0xFFA1A4B7),
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
                                          // const Expanded(
                                          //   child: SizedBox(
                                          //     height: 5,
                                          //     child: LinearProgressIndicator(
                                          //       color: Colors.green,
                                          //       value: 60,
                                          //       semanticsLabel:
                                          //           'Linear progress indicator',
                                          //     ),
                                          //   ),
                                          // ),
                                          sbw5,
                                          Text(
                                            "70%",
                                            style: AppTextStyle.percentage(),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      sbh10,
                      Row(
                        children: [
                          Text(
                            "Courses",
                            style: AppTextStyle.sectionTitle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const CourseList(),
                      sbh10,
                    ],),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
