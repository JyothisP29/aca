// import 'package:acadle/controller/maincontroller.dart';
// import 'package:flutter/material.dart';
//
// import '../../Utilities/app_colors.dart';
// import '../../Utilities/app_icons.dart';
// import '../../Utilities/app_textstyle.dart';
// import '../../Utilities/contstants.dart';
// import '../../Utilities/custom_darktheme.dart';
//
// class CourseTile extends StatelessWidget {
//
//   const CourseTile({
//     super.key,
//   });
//   final String longText = "In this course, we will specialize more on how to get the external applications...";
//
//   final String defaultCountryname = 'Ind';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       height: 120,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Row(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: 120,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey),
//               ),
//               Positioned(
//                 top: 5,
//                 left: 5,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: AppColorPalette.chipBlue),
//                   child: Center(
//                       child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 2.0, horizontal: 5),
//                     child: Text(
//                       courseList.elementAt(index).tag??"",
//                       style: AppTextStyle.extraSmallNormal(
//                           color: Colors.white, fontSize: 8),
//                     ),
//                   )),
//                 ),
//               )
//             ],
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Third Party Integrations",
//                     style: AppTextStyle.normalBold(),
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         AppIcons.person,
//                         height: 12,
//                       ),
//                       sbw5,
//                       Text(
//                         "data",
//                         style: AppTextStyle.smallRegular(
//                             color: AppColorPalette.searchBarColor),
//                       )
//                     ],
//                   ),
//                   Text(shortenedText,
//                     style: AppTextStyle.smallRegular(
//                         color: AppColorPalette.searchBarColor),
//                   ),
//                   sbh5,
//                   SizedBox(
//                     height: 15,
//                     child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return Container(
//
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Colors.grey),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                               child: Text("featured",style: AppTextStyle.extraSmallNormal(color: Colors.white),),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) => const SizedBox(
//                               width: 10,
//                             ),
//                         itemCount: 3),
//                   ),
//                   sbh5,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.visibility,
//                             size: 12,
//                             color: AppColorPalette.searchBarColor,
//                           ),
//                           sbw5,
//                           Text(
//                             "256 students",
//                             style: AppTextStyle.smallRegular(
//                                 color: AppColorPalette.searchBarColor),
//                           ),
//                         ],
//                       ),
//
//                       Container(
//                         height: 10,
//                         width: 2,
//                         color: Colors.grey,
//                       ),
//
//
//
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.alarm,
//                             size: 12,
//                             color: AppColorPalette.searchBarColor,
//                           ),
//                           sbw5,
//                           Text(
//                             "00:20 Hours",
//                             style: AppTextStyle.smallRegular(
//                                 color: AppColorPalette.searchBarColor),
//                           ),
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   String shortenText(String text, int maxLength) {
//     if (text.length <= maxLength) {
//       return text;
//     }
//     return text.substring(0, maxLength - 3) + '...';
//   }
// }
