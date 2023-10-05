import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:acadle/view/widgets/bottom_sheet/bookmarks_bottom_sheet.dart';
import 'package:acadle/view/widgets/bottom_sheet/notes_bottom_sheet.dart';
import 'package:acadle/view/widgets/bottom_sheet/discussion_botom_sheet.dart';
import 'package:flutter/material.dart';

class CourseDetailsTwo extends StatefulWidget {
  const CourseDetailsTwo({super.key});

  @override
  State<CourseDetailsTwo> createState() => _CourseDetailsTwoState();
}

class _CourseDetailsTwoState extends State<CourseDetailsTwo> {
  bool isButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_outlined)),
              sbw10,
              Text(
                "Why Acadle",
                style: AppTextStyle.header(),
              ),
            ],
          )),
      body: Stack(
        children: [
          NotificationListener<ScrollUpdateNotification>(
            onNotification: (notification) {
              // Detect scroll direction
              if (notification.scrollDelta! < 0) {
                // Scrolling down
                setState(() {
                  isButtonVisible = false;
                });
              } else if (notification.scrollDelta! > 0) {
                // Scrolling up
                setState(() {
                  isButtonVisible = true;
                });
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Set up a White-Labeled Academy with 100% author controls, Structure content with agility, Integrate with your existing IT infrastructure. Acadle helps you capture and retain your team's knowledge and measure the results of your training. Set up a White-Labeled Academy with 100% author controls, Structure content with agility, Integrate with your existing IT infrastructure. Acadle helps you capture and retain your team's knowledge and measure the results of your training.",
                      style: AppTextStyle.body(),
                    ),
                    sbh15,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.withOpacity(.2),
                            ),
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.ac_unit_outlined,
                                    color: AppColorPalette.profileGreen,
                                  ),
                                  sbh10,
                                  Text(
                                    "Set up a White-Labeled Academy",
                                    style: AppTextStyle.courseTileHeader(),
                                  ),
                                  sbh15,
                                  Text(
                                    "Set up a White-Labeled Academy with 100% author controls.",
                                    style: AppTextStyle.body(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.grey.withOpacity(.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.ac_unit_outlined,
                                    color: AppColorPalette.profileGreen,
                                  ),
                                  sbh10,
                                  Text(
                                    "Set up a White-Labeled Academy",
                                    style: AppTextStyle.courseTileHeader(),
                                  ),
                                  sbh15,
                                  Text(
                                    "Set up a White-Labeled Academy with 100% author controls.",
                                    style: AppTextStyle.body(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sbh15,
                    Text(
                      "Build Courses",
                      style: AppTextStyle.courseTileHeader(),
                    ),
                    sbh10,
                    Text(
                      "Include videos, embeds, pdf etc. in the courses to develop and comprehensive training process.",
                      style: AppTextStyle.body(),
                    ),
                    sbh15,
                    Text(
                      "Assign to team members or customers",
                      style: AppTextStyle.courseTileHeader(),
                    ),
                    sbh10,
                    Text(
                      "Create user groups and assign courses to them. For example, you may want to create teams for various departments, such as marketing and sales, so you can assign them specific courses. Create user groups and assign courses to them. For example, you may want to create teams for various departments, such as marketing and sales, so you can assign them specific courses.",
                      style: AppTextStyle.body(),
                    ),
                    sbh15,
                    Text(
                      "Analyse the performance",
                      style: AppTextStyle.courseTileHeader(),
                    ),
                    sbh10,
                    Text(
                      "Thanks to comprehensive learner statistics, you can see what stage of their training each learner has reached, which learners are successfully completing quizzes, and which learners need to spend more time on their training. Thanks to comprehensive learner statistics, you can see what stage of their training each learner has reached, which learners are successfully completing quizzes, and which learners need to spend more time on their training.",
                      style: AppTextStyle.body(),
                    ),
                    sbh50,
                    sbh10,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColorPalette.buttonBlue),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next Lesson",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white)
                          ),
                          sbw10,
                          Image.asset(
                            AppIcons.forwardArrow,
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    )
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: isButtonVisible ? 20 : -80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColorPalette.bottomSheetBlack),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  context: context,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15.0),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return const NotesBottomSheet();
                                  });
                            },
                            child: const Text("Notes",
                                style: TextStyle(color: Colors.white)),
                          ),
                          Container(
                            color: Colors.white,
                            width: 1,
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: const Color(0xffEBECF2),
                                  context: context,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return const DiscussionBottomSheet();
                                  });
                            },
                            child: const Text(
                              "Discussions",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 1,
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: const Color(0xffEBECF2),
                                  context: context,
                                  // enableDrag:true,

                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return const BookmarksBottomSheet();
                                  });
                            },
                            child: const Text(
                              "Bookmarks",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
