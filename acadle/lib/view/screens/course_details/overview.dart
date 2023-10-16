import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_images.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:flutter/material.dart';
import '../../../models/faq_model/faq_model.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  List<String> list = [
    "What is Acadle",
    "How to use Acadle",
    "Acadle Use-cases",
    "Integration opportunities",
  ];
  final ExpansionTileController controller = ExpansionTileController();

  bool isChecked = false;
  bool follow = false;

  List<FaqModel> faq = [
    FaqModel(1, "Where is Acadle hosted?", false),
    FaqModel(2, "Is it secured", false),
    FaqModel(3, "How to get help?", false),
    FaqModel(4, "Where is the company based?", false)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why Acadle",
            style: AppTextStyle.header(),
          ),
          Ratings(context),
          sbh5,
          Row(
            children: [
              SizedBox(
                  width: 70,
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CREATED AT",
                        style: AppTextStyle.subHeader(),
                      ),
                      sbh5,
                      Text(
                        "2 years ago",
                        style: AppTextStyle.smallBody(),
                      ),
                    ],
                  ))),
              sbw20,
              verticalDivider(),
              SizedBox(
                  width: 100,
                  child: (Column(
                    children: [
                      Text(
                        "STUDENTS",
                        style: AppTextStyle.subHeader(),
                      ),
                      sbh5,
                      Text(
                        "1469",
                        style: AppTextStyle.smallBody(),
                      ),
                    ],
                  ))),
              verticalDivider(),
              SizedBox(
                  width: 100,
                  child: (Column(
                    children: [
                      Text(
                        "HOURS",
                        style: AppTextStyle.subHeader(),
                      ),
                      sbh5,
                      Text(
                        "01:20",
                        style: AppTextStyle.smallBody(),
                      ),
                    ],
                  ))),
              Expanded(child: Container()),
            ],
          ),
          sbh20,
          Text(
            "Give your team a complete resource library",
            style: AppTextStyle.courseTileHeader(),
          ),
          const SizedBox(height: 7),
          Text(
            "Set up a White-Labeled Academy with 100% author controls, Structure content with agility, Integrate with your existing IT infrastructure. Acadle helps you capture and retain your team's knowledge and measure the results of you training.",
            style: AppTextStyle.body(),
          ),
          sbh20,
          Text(
            "What you will learn",
            style: AppTextStyle.courseTileHeader(),
          ),
          sbh10,
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(
                    AppIcons.tick,
                    width: 16,
                  ),
                  sbw10,
                  Text(
                    list.elementAt(index),
                    style: AppTextStyle.body(),
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return sbh10;
            },
          ),

          // Row(
          //   children: [
          //     Image.asset(
          //       AppIcons.tick,
          //       width: 16,
          //     ),
          //     sbw10,
          //     Text(
          //       "What is Acadle",
          //       style: AppTextStyle.body(),
          //     )
          //   ],
          // ),
          // sbh10,
          // Row(
          //   children: [
          //     Image.asset(
          //       AppIcons.tick,
          //       width: 16,
          //     ),
          //     sbw10,
          //     Text(
          //       "How to use Acadle",
          //       style: AppTextStyle.body(),
          //     )
          //   ],
          // ),
          // sbh10,
          // Row(
          //   children: [
          //     Image.asset(
          //       AppIcons.tick,
          //       width: 16,
          //     ),
          //     sbw10,
          //     Text(
          //       "Acadle Use-cases",
          //       style: AppTextStyle.body(),
          //     )
          //   ],
          // ),
          // sbh10,
          // Row(
          //   children: [
          //     Image.asset(
          //       AppIcons.tick,
          //       width: 16,
          //     ),
          //     sbw10,
          //     Text(
          //       "Integration opportunities",
          //       style: AppTextStyle.body(),
          //     )
          //   ],
          // ),
          sbh20,
          Text(
            "Requirements",
            style: AppTextStyle.courseTileHeader(),
          ),
          sbh10,
          Row(
            children: [
              Image.asset(
                AppIcons.tick,
                width: 16,
              ),
              sbw10,
              Text(
                "Laptop (cloud based)",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh10,
          Row(
            children: [
              Image.asset(
                AppIcons.tick,
                width: 16,
              ),
              sbw10,
              Text(
                "Mobile Responsive",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh20,
          Text(
            "This Course Includes",
            style: AppTextStyle.courseTileHeader(),
          ),
          sbh10,
          Row(
            children: [
              Image.asset(
                AppIcons.playButton,
                width: 17,
                height: 17,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "5 Videos",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh5,
          Row(
            children: [
              Image.asset(
                AppIcons.file,
                width: 17,
                height: 17,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "7 Articles",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh5,
          Row(
            children: [
              Image.asset(
                AppIcons.download,
                width: 17,
                height: 17,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "Downloadable Materials",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh5,
          Row(
            children: [
              Image.asset(
                AppIcons.clock,
                width: 17,
                height: 17,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "10 Min",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh5,
          Row(
            children: [
              Image.asset(
                AppIcons.phone,
                width: 16,
                height: 16,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "Mobile Friendly",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh5,
          Row(
            children: [
              Image.asset(
                AppIcons.certificate,
                width: 17,
                height: 17,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                "Certificate",
                style: AppTextStyle.body(),
              )
            ],
          ),
          sbh30,
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColorPalette.notificationSwap,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sbh10,
                  Text("About the Author",
                      style: AppTextStyle.courseTileHeader()),
                  sbh10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColorPalette.grey,
                            child: Image.asset(AppImages.d),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nizamudheen", style: AppTextStyle.author()),
                              sbh5,
                              Text("Admin",
                                  style: AppTextStyle.courseTileAdmin()),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: followfn,
                        child: Container(
                          width: follow ? 100 : 70,
                          height: 30,
                          decoration: BoxDecoration(
                              border: follow
                                  ? Border.all(
                                      color: AppColorPalette.profileGreen,
                                      width: 1)
                                  : null,
                              borderRadius: BorderRadius.circular(15),
                              color: follow
                                  ? AppColorPalette.notificationSwap
                                  : AppColorPalette.profileGreen),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              follow
                                  ? Image.asset(
                                      AppIcons.follow,
                                      height: 14,
                                    )
                                  : Container(),
                              sbw5,
                              follow
                                  ? const Text("Following",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: AppColorPalette.profileGreen))
                                  : const Text("Follow",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  sbh15,
                ],
              ),
            ),
          ),
          sbh20,
          Text(
            "FAQ",
            style: AppTextStyle.courseTileHeader(),
          ),
          sbh5,
          // ListView.builder(
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: faq.length,
          //   itemBuilder: (context, index) {
          //     return ListTileTheme(
          //       contentPadding: const EdgeInsets.all(0),
          //       dense: true,
          //       horizontalTitleGap: 0.0,
          //       minLeadingWidth: 0,
          //       child: ExpansionTile(
          //         tilePadding: EdgeInsets.zero,
          //         title: Text(
          //           faq.elementAt(index),
          //           style: AppTextStyle.body(),
          //         ),
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               'Contents ', // Modify the contents as needed
          //               style: AppTextStyle.smallRegular(
          //                   color: AppColorPalette.searchBarColor),
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
          faqList(),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget faqList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: faq.length,
      itemBuilder: (context, index) {
        FaqModel faqList = faq.elementAt(index);
        return GestureDetector(
          onTap: () {
            faqList.open = !faqList.open;
            setState(() {});
          },
          child: Container(
            height: faqList.open ? 70 : 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: faqList.open
                    ? const Color(0xFFF2F3F8)
                    : Colors.transparent),
            child: Padding(
              padding: faqList.open
                  ? const EdgeInsets.only(top: 8.0, bottom: 8, left: 12)
                  : const EdgeInsets.only(top: 8.0, bottom: 8, left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          faqList.name ?? "", // Modify the contents as needed
                          style: AppTextStyle.body(),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey.shade600,
                        )
                      ],
                    ),
                  ),
                  faqList.open
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "It is hosted in AWS",
                              style: AppTextStyle.courseTileAdmin(),
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 3,
        );
      },
    );
  }

  Widget verticalDivider() {
    return Container(
      color: Colors.grey.withOpacity(.3),
      width: 1,
      height: 25,
    );
  }

  Widget Ratings(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: Row(
        children: [
          Text(
            "4.5",
            style: AppTextStyle.courseTileHeader(),
          ),
          sbw10,
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Image.asset(
                    AppIcons.rating,
                    width: 10,
                    height: 10,
                    color: Colors.orange,
                    fit: BoxFit.fitWidth,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 5,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }

  void followfn() {
    follow = !follow;
    setState(() {});
  }
}
