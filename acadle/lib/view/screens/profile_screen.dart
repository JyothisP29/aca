import 'dart:io';

import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:acadle/models/profile_model/profile_screen_menu_model.dart';
import 'package:acadle/view/screens/certificate.dart';
import 'package:acadle/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../Utilities/app_icons.dart';
import 'leaderboard.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  static const route = '/Courses_page';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DateTime currentDate = DateTime.now();
  int selected = 0;
  File? image;

  void currentIndexPage(int num) {
    setState(() {
      selected = num;
    });
  }

  List<ProfileMenu> profileList = <ProfileMenu>[
    ProfileMenu(1, "Leaderboard", "assets/icons/prof_leaderboard.png"),
    ProfileMenu(2, "Certificate", "assets/icons/prof_certificate.png"),
    ProfileMenu(3, "Announcements", "assets/icons/prof_announcement.png"),
    ProfileMenu(4, "Dark Mode", "assets/icons/prof_moon.png"),
    ProfileMenu(5, "Redeem Coupon", "assets/icons/prof_coupon.png"),
    ProfileMenu(6, "Reset Password", "assets/icons/prof_reset.png"),
    ProfileMenu(7, "Logout", "assets/icons/prof_logout.png")
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColorPalette.profileBg,
                  ),
                  child: Column(
                    children: [
                      sbh10,
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blue.withOpacity(.2),
                              child: image == null
                                  ? Image.asset(
                                      AppIcons.selProfile,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      image!,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                onImageButtonPressed(ImageSource.gallery);
                              },
                              child: const CircleAvatar(
                                backgroundColor: Color(0xff7987A1),
                                radius: 12,
                                child: Icon(
                                  Icons.edit,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      sbh5,
                      Text(
                        "Nizamudheen velliyattu",
                        style: AppTextStyle.profileHeader(
                            fontWeight: FontWeight.w600),
                      ),
                      sbh5,
                      Text(
                        "Academy User",
                        style: AppTextStyle.profileAdmin(),
                      ),
                      sbh10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColorPalette.profileGreen),
                            child: const Center(
                              child: Text(
                                "292 points",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          sbw15,
                          Container(
                            width: 100,
                            height: 23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColorPalette.profileBlue),
                            child: const Center(
                              child: Text(
                                "Level 8",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sbh5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.pinkHat,
                            height: 20,
                          ),
                          sbw5,
                          Image.asset(AppIcons.hole),
                        ],
                      ),
                      sbh10,
                    ],
                  ),
                ),
                sbh20,
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => index == 0
                                  ? const LeaderBoard()
                                  : index == 2
                                      ? const HomeScreen(
                                          index: 2,
                                          notificationTabIndex: 1,
                                        )
                                      : index == 1
                                          ? const Certificate()
                                          : const HomeScreen(
                                              notificationTabIndex: 3,
                                            ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    profileList.elementAt(index).image ?? "",
                                    height: 20,
                                  ),
                                  sbw15,
                                  Text(
                                    profileList.elementAt(index).name ?? "",
                                    style: AppTextStyle.courseTileHeader(),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: profileList.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onImageButtonPressed(ImageSource source) async {
    final pickedFile = await (ImagePicker().pickImage(source: source));

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile!.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxHeight: 700,
      maxWidth: 700,
      compressFormat: ImageCompressFormat.jpg,
    );
    if (croppedFile != null) {
      setState(() {
        image = File(croppedFile.path);
      });
    }
    // else{
    //   Fluttertoast.showToast(msg: "Something went wrong try again!");
    //
    // }

    //capturedImageFile(val.path);
  }
}
