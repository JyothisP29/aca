import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:flutter/material.dart';

class CourseContent extends StatefulWidget {
  const CourseContent({super.key});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  List<String> checkList = [
    "About",
    "What is Acadle",
    "Why we build Acadle",
    "About us",
    "Some numbers again!",
    "Academy Use-cases",
    "Some numbers",
    "Acadle for Marketing",
    "For Employee Training",
    "Qiwio",
    "Flipbook",
    "Livo",
    "Lesson title",
    "Quiz",
    "Video Upload",
    "Video Upload Sample",
    "Test assessment",
    "Test Survey",

  ];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contents",
            style: AppTextStyle.smallBold(),
          ),
          sbh10,
        ListView.separated(
            shrinkWrap: true,

            itemBuilder: (context,index){
          return   Row(
            children: [
              Image.asset(AppIcons.tick,width: 16,),

              const SizedBox(width: 7,),
              Text(
                checkList.elementAt(index),
                style: AppTextStyle.body(),
              )
            ],
          );
        }, separatorBuilder: (context, index) => const SizedBox(height: 10,), itemCount: checkList.length)
        ,
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
