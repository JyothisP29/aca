import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_images.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:acadle/models/leaderboard/leaderboard_model.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<LeaderBoardModel> leaderboardList = [
    LeaderBoardModel(1, "Darwin Robertson", AppImages.z, "492", "4"),
    LeaderBoardModel(2, "Ralph Edwards", AppImages.x, "492", "6"),
    LeaderBoardModel(3, "Guy Halkins", AppImages.c, "492", "7"),
    LeaderBoardModel(4, "Robert Fox", AppImages.v, "492", "8"),
    LeaderBoardModel(5, "Wade Warren", AppImages.b, "492", "9"),
    LeaderBoardModel(6, "Esher Howard", AppImages.n, "492", "10"),
    LeaderBoardModel(7, "Joem Bell", AppImages.m, "492", "11"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Top 10 Leaders",
                      style: AppTextStyle.header(fontSize: 14),
                    ),
                  ],
                ),
                sbh5,
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Your position in the leaderboard is ',
                              style: AppTextStyle.body()),
                          const TextSpan(
                            text: '#59',
                            style: TextStyle(
                              color: Color(0xFF001737),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                sbh15,
                topLeaders(context),
                sbh15,
                leaderboard(),
                sbh10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView leaderboard() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColorPalette.notificationSwap),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey,
                        child: Image.asset(
                            leaderboardList.elementAt(index).image ?? ""),
                      ),
                      sbw10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            leaderboardList.elementAt(index).name ?? "",
                            style: AppTextStyle.leaderboardName(
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                leaderboardList.elementAt(index).points ?? "",
                                style: AppTextStyle.leaderboardBody(),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Points",
                                style: AppTextStyle.leaderboardBody(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.grey.shade400,
                    child: Center(
                        child: Text(
                      leaderboardList.elementAt(index).rank ?? "",
                      style: const TextStyle(fontSize: 8, color: Colors.white),
                    )),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 7,
            ),
        itemCount: leaderboardList.length);
  }

  Container topLeaders(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 135,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColorPalette.notificationSwap),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0, top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 55,
                          child: Stack(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: const Color(0xFFA1A5B8),
                                  child: Image.asset(AppImages.s),
                                ),
                              ),
                              const Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor:
                                        AppColorPalette.profileGreen,
                                    child: Center(
                                        child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10),
                                    )),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  sbh5,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Vishnu",
                          style: AppTextStyle.leaderboardName(
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "492 points",
                          style: AppTextStyle.leaderboardBody(
                              color: AppColorPalette.searchBarColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: Image.asset(AppImages.d),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 5,
                            right: 0,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColorPalette.profileGreen,
                              child: Image.asset(
                                AppIcons.leaderboard,
                                height: 16,
                              ),
                            ))
                      ],
                    ),
                  ),
                  sbh5,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        children: [
                          Text(
                            "Vishnu",
                            style: AppTextStyle.leaderboardName(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "492 points",
                            style: AppTextStyle.leaderboardBody(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 55,
                          child: Stack(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey,
                                  child: Image.asset(AppImages.a),
                                ),
                              ),
                              const Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: AppColorPalette.profileGreen,
                                  child: Center(
                                    child: Text(
                                      "3",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  sbh5,
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Vishnu",
                          style: AppTextStyle.leaderboardName(
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "492 points",
                          style: AppTextStyle.leaderboardBody(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
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
              "Leaderboard",
              style: AppTextStyle.appbarTitle(),
            ),
          ],
        ));
  }
}
