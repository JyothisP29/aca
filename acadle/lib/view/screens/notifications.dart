import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utilities/app_colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key, this.tabIndex});

  final int? tabIndex;
  static const route = '/Courses_page';

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late PageController pageController;

  DateTime currentDate = DateTime.now();
  int selectedTag = 0;
  List<String> tags = [
    "Notifications",
    "Announcements",
  ];

  @override
  void didChangeDependencies() {
    if (widget.tabIndex != null) {
      selectedTag = widget.tabIndex!;
      pageController = PageController(initialPage: widget.tabIndex!);
    } else {
      pageController = PageController();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                tab(),
                sbh15,
                tabView()
                // SizedBox(
                //   height: MediaQuery.of(context).size.height,
                //   child: DefaultTabController(
                //     length: 2,
                //     child: Column(
                //       children: [
                //         // SizedBox(
                //         //   height: 50,
                //         //   child: ListView.separated(
                //         //     scrollDirection: Axis.horizontal,
                //         //     shrinkWrap: true,
                //         //     primary: true,
                //         //     itemCount: tags.length,
                //         //     itemBuilder: (context, index) {
                //         //       return Container(
                //         //         decoration: BoxDecoration(
                //         //             borderRadius: BorderRadius.circular(10),
                //         //             color: AppColorPalette.notificationSwap),
                //         //         height: 43,
                //         //         child: ListView.builder(
                //         //           scrollDirection: Axis.horizontal,
                //         //           itemCount: tags.length,
                //         //           shrinkWrap: true,
                //         //           physics: const BouncingScrollPhysics(),
                //         //           padding: EdgeInsets.zero,
                //         //           itemBuilder: (context, index) {
                //         //             return Padding(
                //         //               padding: const EdgeInsets.symmetric(
                //         //                   horizontal: 7.0, vertical: 5),
                //         //               child: InkWell(
                //         //                 onTap: () {
                //         //                   selectedTag = index;
                //         //                   setState(() {});
                //         //                 },
                //         //                 child: Container(
                //         //                   width: MediaQuery.of(context)
                //         //                           .size
                //         //                           .width *
                //         //                       .416,
                //         //                   height: 50,
                //         //                   decoration: BoxDecoration(
                //         //                     color: selectedTag == index
                //         //                         ? Colors.white
                //         //                         : Colors.transparent,
                //         //                     borderRadius:
                //         //                         BorderRadius.circular(6),
                //         //                   ),
                //         //                   child: Center(
                //         //                     child: Text(
                //         //                       tags.elementAt(index),
                //         //                       style: TextStyle(
                //         //                           fontSize: 12,
                //         //                           fontWeight:
                //         //                               selectedTag == index
                //         //                                   ? FontWeight.bold
                //         //                                   : FontWeight.normal,
                //         //                           color: selectedTag == index
                //         //                               ? Colors.black
                //         //                               : AppColorPalette
                //         //                                   .notificationUnSelected),
                //         //                     ),
                //         //                   ),
                //         //                 ),
                //         //               ),
                //         //             );
                //         //           },
                //         //         ),
                //         //       );
                //         //     },
                //         //     separatorBuilder:
                //         //         (BuildContext context, int index) {
                //         //       return const SizedBox(
                //         //         width: 10,
                //         //       );
                //         //     },
                //         //   ),
                //         // ),
                //
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded tabView() {
    return Expanded(
      child: PageView(
        onPageChanged: (index) {
          selectedTag = index;
          setState(() {});
        },
        pageSnapping: true,
        controller: pageController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColorPalette.notificationSwap,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Aravind Kumar',
                                          style: AppTextStyle.courseTileHeader(
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                            text: ' commented on your post ',
                                            style: AppTextStyle.body(
                                                fontSize: 12)),
                                        TextSpan(
                                            text: 'Test Post',
                                            style:
                                                AppTextStyle.courseTileHeader(
                                                    fontSize: 12)),
                                      ]),
                                ),
                                sbh10,
                                Text(
                                  "2 day ago",
                                  style: AppTextStyle.leaderboardBody(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 12,
                          ),
                      itemCount: 30),
                ),
                sbh10,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    "What i new on collaborative learning",
                    style: AppTextStyle.header(),
                  ),
                ),
                sbh15,
                Container(
                  decoration: BoxDecoration(
                    color: AppColorPalette.notificationSwap,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "November 5, 2022",
                              style: AppTextStyle.leaderboardName(
                                  fontWeight: FontWeight.w600),
                            ),
                            sbw5,
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColorPalette.profileGreen),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 5),
                                child:
                                    Text("New", style: AppTextStyle.tagFont()),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Revamping community to Engage We are super excited to launch the new version of the community and rename the name to 'Engage'. Check the video for more details",
                          style: AppTextStyle.body(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container tab() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColorPalette.notificationSwap),
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5),
            child: InkWell(
              onTap: () {
                pageController.animateToPage(
                  index, // The page index you want to navigate to
                  duration: const Duration(milliseconds: 400),
                  // Duration of the animation
                  curve: Curves.easeInOut, // Animation curve
                );
                selectedTag = index;
                setState(() {});
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .416,
                height: 50,
                decoration: BoxDecoration(
                  color:
                      selectedTag == index ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    tags.elementAt(index),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: selectedTag == index
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: selectedTag == index
                            ? const Color(0xFF001737)
                            : AppColorPalette.notificationUnSelected),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
