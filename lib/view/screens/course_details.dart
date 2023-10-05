import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:flutter/material.dart';

import '../../Utilities/app_colors.dart';
import '../../Utilities/app_images.dart';
import '../../Utilities/contstants.dart';
import 'course_details/contentcourse.dart';
import 'course_details/overview.dart';
import 'course_details_two.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  PageController pageController = PageController();

  int selectedTag = 0;
  List<String> tags = [
    "Overview",
    "Course Content",
  ];

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
                style: AppTextStyle.appbarTitle(),
              ),
            ],
          )),
      body: Stack(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .3,
                        child: Image.asset(AppImages.e, fit: BoxFit.fitWidth),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: AppColorPalette.profileGreen),
                          width: 55,
                          height: 22,
                          child: Center(
                            child: Text(
                              "New",
                              style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  sbh10,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColorPalette.notificationSwap),
                    height: 43,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tags.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 5),
                          child: InkWell(
                            onTap: () {
                              selectedTag = index;
                              pageController.animateToPage(
                                index, // The page index you want to navigate to
                                duration: const Duration(milliseconds: 400),
                                // Duration of the animation
                                curve: Curves.easeInOut, // Animation curve
                              );
                              setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .416,
                              height: 50,
                              decoration: BoxDecoration(
                                color: selectedTag == index
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  tags.elementAt(index),
                                  style: TextStyle(
                                      fontSize:  selectedTag == index?16:14,
                                      fontWeight: selectedTag == index
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                      color: selectedTag == index
                                          ? Color(0xFF001737)
                                          : AppColorPalette
                                              .notificationUnSelected),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  sbh20,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      child: PageView(
                        onPageChanged: (index) {
                          selectedTag = index;
                          setState(() {});
                        },
                        pageSnapping: true,
                        controller: pageController,
                        children: const [OverView(), CourseContent()],
                      ),
                    ),
                  )
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height,
                  //   child: DefaultTabController(
                  //     length: 1,
                  //     child: Column(
                  //       children: [
                  //
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // sbh10,
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: AppColorPalette.notificationSwap,
                  //         ),
                  //         height: 43,
                  //         child: ListView.builder(
                  //           scrollDirection: Axis.horizontal,
                  //           itemCount: tags.length,
                  //           shrinkWrap: true,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           padding: EdgeInsets.zero,
                  //           itemBuilder: (context, index) {
                  //             return Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   vertical: 5, horizontal: 7),
                  //               child: InkWell(
                  //                 onTap: () {
                  //                   selectedTag = index;
                  //                   setState(() {});
                  //                 },
                  //                 child: Container(
                  //                   width: MediaQuery.of(context).size.width *
                  //                       .42,
                  //                   height: 50,
                  //                   decoration: BoxDecoration(
                  //                     color: selectedTag == index
                  //                         ? Colors.white
                  //                         : Colors.transparent,
                  //                     borderRadius: BorderRadius.circular(6),
                  //                   ),
                  //                   child: Center(
                  //                     child: Text(
                  //                       tags.elementAt(index),
                  //                       style: TextStyle(
                  //                           fontWeight: selectedTag == index
                  //                               ? FontWeight.bold
                  //                               : FontWeight.normal,
                  //                           fontSize: 12,
                  //                           color: selectedTag == index
                  //                               ? Colors.black
                  //                               : AppColorPalette
                  //                                   .notificationUnSelected),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //       sbh20,
                  //       selectedTag == 0 ? const OverView() : const CourseContent()
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CourseDetailsTwo()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColorPalette.profileGreen),
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Enroll Now",
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
