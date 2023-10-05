import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_images.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:flutter/material.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  final ExpansionTileController controller = ExpansionTileController();

  bool isChecked = false;
  bool follow = false;

  List<String> faq = [
    "Where is Acadle hosted?",
    "Is it secured",
    "How to get help?",
    "Where is the company based?"
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
          Container(
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
          ),
          sbh5,
          Row(
            children: [
              Expanded(
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
              Container(
                color: Colors.grey.withOpacity(.3),
                width: 1,
                height: 25,
              ),
              Expanded(
                  flex: 2,
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
              Container(
                color: Colors.grey.withOpacity(.3),
                width: 1,
                height: 25,
              ),
              Expanded(
                  flex: 2,
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
            style:
                AppTextStyle.body(),
          ),
          sbh20,
          Text(
            "What you will learn",
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
                "What is Acadle",
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
                "How to use Acadle",
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
                "Acadle Use-cases",
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
                "Integration opportunities",
                style: AppTextStyle.body(),

              )
            ],
          ),
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
              Text("5 Videos",
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
              Text("7 Articles",
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
              Text("Downloadable Materials",
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
              Text("10 Min",
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
              Text("Certificate",
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
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sbh10,
                  Text("About the Author", style: AppTextStyle.courseTileHeader()),
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
                              Text("Nizamudheen",
                                  style: AppTextStyle.author()),
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
                                  ? Text(
                                      "Following",
                                      style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white)
                                    )
                                  : Text(
                                      "Follow",
                                  style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white)

                              )
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
          ListView.builder(

            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: faq.length,
            itemBuilder: (context, index) {
              return ListTileTheme(
                contentPadding: EdgeInsets.all(0),
                dense: true,
                horizontalTitleGap: 0.0,
                minLeadingWidth: 0,
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    faq.elementAt(index),
                    style: AppTextStyle.body(),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Contents ', // Modify the contents as needed
                        style: AppTextStyle.smallRegular(
                            color: AppColorPalette.searchBarColor),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(
            height: 100,
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
