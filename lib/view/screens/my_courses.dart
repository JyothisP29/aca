import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/Utilities/contstants.dart';
import 'package:acadle/view/widgets/my_course_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  static const route = '/MyCourses_page';

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int selectedTag = 0;
  List<String> tags = ["All", "New", "Intro", "About"];
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColorPalette.bgColor,
        appBar: AppBar(
            surfaceTintColor: Colors.white,

          automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: Text(
          "My Courses",
          style: AppTextStyle.sectionTitle(),
        ),
            )),
        body:  const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16, top: 8),
            child: SingleChildScrollView(

              child: Column(
                children: [

                  MyCourseList(),
                  sbh10,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
