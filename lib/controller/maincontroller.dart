import 'package:acadle/models/courses/course_model.dart';

List<CourseModel> courseList = <CourseModel>[
  CourseModel(
      1,
      "Third Party Integrations",
      "assets/images/img_1.png",
      "Nizamudheen",
      "In this course, we will specialize more on how to get the external applications...",
      "256",
      "00:20",
      "Featured", [
    CourseTag(1, "Featured"),
    CourseTag(2, "About"),
  ]),
  CourseModel(
      2,
      "Why Acadle",
      "assets/images/img_2.png",
      "Vishnu",
      "This is all about how you can use Acade for your team as well as customers...",
      "165",
      "01:18",
      "", [
    CourseTag(1, "Intro"),
    CourseTag(2, "About"),
  ]),
  CourseModel(
      3,
      "Managing Your Courses",
      "assets/images/img_3.png",
      "Vidya",
      "In this course, you will learn more abouthow to manage courses, add lessons...",
      "256",
      "00:20",
      "New", [
    CourseTag(1, "Featured"),
    CourseTag(2, "About"),
    CourseTag(3, "New"),
  ]),
  CourseModel(
      4,
      "Bookmarks",
      "assets/images/img_5.png",
      "Sabir",
      "Take a look at these important numbers and resources before start building...",
      "256",
      "00:20",
      "", []),
  CourseModel(
      5,
      "Useful Resources",
      "assets/images/img_4.png",
      "Baskar",
      "A couple of resources for reference if you are planning to build and Academy",
      "256",
      "00:20",
      "New", [
    CourseTag(1, "Featured"),
    CourseTag(2, "About"),
    CourseTag(3, "New"),
  ]),
];
