import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_images.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/controller/bottomsheet_controller/discussion_con.dart';
import 'package:acadle/models/bottomsheetmodels/discussionModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_to/swipe_to.dart';
import '../../../Utilities/contstants.dart';

class DiscussionBottomSheet extends StatefulWidget {
  const DiscussionBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscussionBottomSheet> createState() => _DiscussionBottomSheet();
}

class _DiscussionBottomSheet extends State<DiscussionBottomSheet> {
  DiscussionModel? discussion;
  int count = 1;
  TextEditingController discussionCon = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool reply = false;
  bool expand = false;

  double sheetHeightPercentage = 0.6;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        sheetHeightPercentage = 0.9;
      } else {
        sheetHeightPercentage = 0.6;
      }
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    discussionCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double maxHeight = screenHeight;
    final shortenedText = shortenText(discussion?.discussion ?? "", 40);
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          double newPercentage =
              sheetHeightPercentage - details.primaryDelta! / maxHeight;
          newPercentage = newPercentage.clamp(0.6, 0.9);
          setState(() {
            sheetHeightPercentage = newPercentage;
          });
        },
        child: FractionallySizedBox(
          heightFactor: sheetHeightPercentage,
          child: Container(

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sbh10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Center(
                    child: Container(
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),
                  ),
                ),
                sbh10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discussions",
                        style: AppTextStyle.header(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          AppIcons.close,
                          height: 24,
                        ),
                      )
                    ],
                  ),
                ),
                sbh10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade200,
                    height: 1,
                  ),
                ),
                sbh10,
                // Expanded(
                //   child: ListView.separated(
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) {
                //         final list = discussionList.elementAt(index);
                //         return Padding(
                //           padding: const EdgeInsets.symmetric(
                //             horizontal: 15.0,
                //           ),
                //           child: SwipeTo(
                //             onLeftSwipe: () {
                //               setState(() {
                //                 discussion = discussionList.elementAt(index);
                //                 reply = true;
                //                 FocusScope.of(context).requestFocus(_focusNode);
                //               });
                //             },
                //             onRightSwipe: () {
                //               setState(() {
                //                 discussion = discussionList.elementAt(index);
                //
                //                 reply = true;
                //                 FocusScope.of(context).requestFocus(_focusNode);
                //               });
                //             },
                //             child: list.replyCount!.isNotEmpty &&
                //                     list.replyCount != "0" &&
                //                     list.discussionReplyModel?.discussion != null
                //                 ? Container(
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: AppColorPalette.notificationSwap),
                //                     child: Padding(
                //                       padding: const EdgeInsets.symmetric(
                //                           vertical: 10.0, horizontal: 10),
                //                       child: Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.start,
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Row(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Row(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   CircleAvatar(
                //                                     radius: 18,
                //                                     backgroundColor: Colors.grey,
                //                                     // child: Image.asset(list.img ?? ""),
                //                                     child: Image.asset(list
                //                                             .discussionReplyModel
                //                                             ?.img ??
                //                                         ""),
                //                                   ),
                //                                   sbw5,
                //                                   Column(
                //                                     crossAxisAlignment:
                //                                         CrossAxisAlignment.start,
                //                                     children: [
                //                                       Text(
                //                                         // list.name ?? "",
                //                                         list.discussionReplyModel
                //                                                 ?.name ??
                //                                             "",
                //
                //                                         style: AppTextStyle
                //                                             .smallBold(),
                //                                       ),
                //                                       sbh5,
                //                                       Text(
                //                                         // list.date ?? "",
                //                                         list.discussionReplyModel
                //                                                 ?.date ??
                //                                             "",
                //
                //                                         style: AppTextStyle
                //                                             .extraSmallBold(
                //                                                 color: AppColorPalette
                //                                                     .searchBarColor),
                //                                       )
                //                                     ],
                //                                   ),
                //                                 ],
                //                               ),
                //                               Row(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   list.replyCount == "0"
                //                                       ? Text(
                //                                           "",
                //                                           style: AppTextStyle
                //                                               .extraSmallBold(
                //                                                   color: AppColorPalette
                //                                                       .searchBarColor),
                //                                         )
                //                                       : Text(
                //                                           // list.replyCount ?? "",
                //                                           list.discussionReplyModel
                //                                                   ?.replyCount ??
                //                                               "",
                //
                //                                           style: AppTextStyle
                //                                               .extraSmallBold(
                //                                                   color: AppColorPalette
                //                                                       .searchBarColor),
                //                                         ),
                //                                   sbw5,
                //                                   InkWell(
                //                                     onTap: () {
                //                                       discussion = discussionList
                //                                           .elementAt(index);
                //
                //                                       reply = true;
                //                                       FocusScope.of(context)
                //                                           .requestFocus(
                //                                               _focusNode);
                //                                       setState(() {});
                //                                     },
                //                                     child: Image.asset(
                //                                       AppIcons.reply,
                //                                       height: 15,
                //                                     ),
                //                                   )
                //                                 ],
                //                               )
                //                             ],
                //                           ),
                //                           sbh10,
                //                           Text(
                //                             // list.discussion ?? "",
                //                             list.discussionReplyModel
                //                                     ?.discussion ??
                //                                 "",
                //                             style: AppTextStyle.smallRegular(
                //                                 color: AppColorPalette
                //                                     .searchBarColor),
                //                           ),
                //                           sbh5,
                //                           Container(
                //                             decoration: BoxDecoration(
                //                                 borderRadius:
                //                                     BorderRadius.circular(10),
                //                                 color: AppColorPalette.mentionBox
                //                                     .withOpacity(.1)),
                //                             child: Padding(
                //                               padding: const EdgeInsets.symmetric(
                //                                   vertical: 10.0, horizontal: 10),
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.start,
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   Row(
                //                                     crossAxisAlignment:
                //                                         CrossAxisAlignment.start,
                //                                     mainAxisAlignment:
                //                                         MainAxisAlignment
                //                                             .spaceBetween,
                //                                     children: [
                //                                       Row(
                //                                         crossAxisAlignment:
                //                                             CrossAxisAlignment
                //                                                 .start,
                //                                         children: [
                //                                           CircleAvatar(
                //                                             radius: 16,
                //                                             backgroundColor:
                //                                                 Colors.grey,
                //                                             child: Image.asset(
                //                                                 // list.discussionReplyModel
                //                                                 //     ?.img ??
                //                                                 //     ""),
                //                                                 list.img ?? ""),
                //                                           ),
                //                                           sbw5,
                //                                           Column(
                //                                             crossAxisAlignment:
                //                                                 CrossAxisAlignment
                //                                                     .start,
                //                                             children: [
                //                                               Text(
                //                                                 // list.discussionReplyModel
                //                                                 //     ?.name ??
                //                                                 //     "",
                //                                                 list.name ?? "",
                //                                                 style: AppTextStyle
                //                                                     .smallBold(
                //                                                         fontSize:
                //                                                             10),
                //                                               ),
                //                                               const SizedBox(
                //                                                 height: 3,
                //                                               ),
                //                                               Text(
                //                                                 // list.discussionReplyModel
                //                                                 //     ?.date ??
                //                                                 //     "",
                //                                                 list.date ?? "",
                //                                                 style: AppTextStyle
                //                                                     .extraSmallBold(
                //                                                         fontSize:
                //                                                             10,
                //                                                         color: AppColorPalette
                //                                                             .searchBarColor),
                //                                               )
                //                                             ],
                //                                           ),
                //                                         ],
                //                                       ),
                //                                     ],
                //                                   ),
                //                                   sbh10,
                //                                   Text(
                //                                     // list.discussionReplyModel
                //                                     //     ?.discussion ??
                //                                     //     "",
                //                                     list.discussion ?? "",
                //                                     style:
                //                                         AppTextStyle.smallRegular(
                //                                             fontSize: 10,
                //                                             color: AppColorPalette
                //                                                 .searchBarColor),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   )
                //                 : Container(
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(10),
                //                         color: AppColorPalette.notificationSwap),
                //                     child: Padding(
                //                       padding: const EdgeInsets.symmetric(
                //                           vertical: 10.0, horizontal: 10),
                //                       child: Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.start,
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Row(
                //                             crossAxisAlignment:
                //                                 CrossAxisAlignment.start,
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Row(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   CircleAvatar(
                //                                     radius: 18,
                //                                     backgroundColor: Colors.grey,
                //                                     child: Image.asset(
                //                                         list.img ?? ""),
                //                                   ),
                //                                   sbw5,
                //                                   Column(
                //                                     crossAxisAlignment:
                //                                         CrossAxisAlignment.start,
                //                                     children: [
                //                                       Text(
                //                                         list.name ?? "",
                //                                         style: AppTextStyle
                //                                             .smallBold(),
                //                                       ),
                //                                       sbh5,
                //                                       Text(
                //                                         list.date ?? "",
                //                                         style: AppTextStyle
                //                                             .extraSmallBold(
                //                                                 color: AppColorPalette
                //                                                     .searchBarColor),
                //                                       )
                //                                     ],
                //                                   ),
                //                                 ],
                //                               ),
                //                               Row(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.start,
                //                                 children: [
                //                                   list.replyCount == "0"
                //                                       ? Text(
                //                                           "",
                //                                           style: AppTextStyle
                //                                               .extraSmallBold(
                //                                                   color: AppColorPalette
                //                                                       .searchBarColor),
                //                                         )
                //                                       : Text(
                //                                           list.replyCount ?? "",
                //                                           style: AppTextStyle
                //                                               .extraSmallBold(
                //                                                   color: AppColorPalette
                //                                                       .searchBarColor),
                //                                         ),
                //                                   sbw5,
                //                                   InkWell(
                //                                     onTap: () {
                //                                       discussion = discussionList
                //                                           .elementAt(index);
                //
                //                                       reply = true;
                //                                       FocusScope.of(context)
                //                                           .requestFocus(
                //                                               _focusNode);
                //                                       setState(() {});
                //                                     },
                //                                     child: Image.asset(
                //                                       AppIcons.reply,
                //                                       height: 15,
                //                                     ),
                //                                   )
                //                                 ],
                //                               )
                //                             ],
                //                           ),
                //                           sbh10,
                //                           Text(
                //                             list.discussion ?? "",
                //                             style: AppTextStyle.smallRegular(
                //                                 color: AppColorPalette
                //                                     .searchBarColor),
                //                           ),
                //                           sbh5,
                //                           list.replyCount!.isNotEmpty &&
                //                                   list.replyCount != "0" &&
                //                                   list.discussionReplyModel
                //                                           ?.discussion !=
                //                                       null
                //                               ? Container(
                //                                   decoration: BoxDecoration(
                //                                       borderRadius:
                //                                           BorderRadius.circular(
                //                                               10),
                //                                       color: AppColorPalette
                //                                           .mentionBox
                //                                           .withOpacity(.1)),
                //                                   child: Padding(
                //                                     padding: const EdgeInsets
                //                                         .symmetric(
                //                                         vertical: 10.0,
                //                                         horizontal: 10),
                //                                     child: Column(
                //                                       mainAxisAlignment:
                //                                           MainAxisAlignment.start,
                //                                       crossAxisAlignment:
                //                                           CrossAxisAlignment
                //                                               .start,
                //                                       children: [
                //                                         Row(
                //                                           crossAxisAlignment:
                //                                               CrossAxisAlignment
                //                                                   .start,
                //                                           mainAxisAlignment:
                //                                               MainAxisAlignment
                //                                                   .spaceBetween,
                //                                           children: [
                //                                             Row(
                //                                               crossAxisAlignment:
                //                                                   CrossAxisAlignment
                //                                                       .start,
                //                                               children: [
                //                                                 CircleAvatar(
                //                                                   radius: 16,
                //                                                   backgroundColor:
                //                                                       Colors.grey,
                //                                                   child: Image.asset(list
                //                                                           .discussionReplyModel
                //                                                           ?.img ??
                //                                                       ""),
                //                                                 ),
                //                                                 sbw5,
                //                                                 Column(
                //                                                   crossAxisAlignment:
                //                                                       CrossAxisAlignment
                //                                                           .start,
                //                                                   children: [
                //                                                     Text(
                //                                                       list.discussionReplyModel
                //                                                               ?.name ??
                //                                                           "",
                //                                                       style: AppTextStyle.smallBold(
                //                                                           fontSize:
                //                                                               10),
                //                                                     ),
                //                                                     const SizedBox(
                //                                                       height: 3,
                //                                                     ),
                //                                                     Text(
                //                                                       list.discussionReplyModel
                //                                                               ?.date ??
                //                                                           "",
                //                                                       style: AppTextStyle.extraSmallBold(
                //                                                           fontSize:
                //                                                               10,
                //                                                           color: AppColorPalette
                //                                                               .searchBarColor),
                //                                                     )
                //                                                   ],
                //                                                 ),
                //                                               ],
                //                                             ),
                //                                           ],
                //                                         ),
                //                                         sbh10,
                //                                         Text(
                //                                           list.discussionReplyModel
                //                                                   ?.discussion ??
                //                                               "",
                //                                           style: AppTextStyle
                //                                               .smallRegular(
                //                                                   fontSize: 10,
                //                                                   color: AppColorPalette
                //                                                       .searchBarColor),
                //                                         ),
                //                                       ],
                //                                     ),
                //                                   ),
                //                                 )
                //                               : Container(),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //           ),
                //         );
                //       },
                //       separatorBuilder: (context, index) => const SizedBox(
                //             height: 5,
                //           ),
                //       itemCount: discussionList.length),
                // ),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        DiscussionModel list = discussionList.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SwipeTo(
                            onLeftSwipe: () {
                              setState(
                                    () {
                                  discussion = discussionList.elementAt(index);
                                  reply = true;
                                  FocusScope.of(context)
                                      .requestFocus(_focusNode);
                                },
                              );
                            },
                            onRightSwipe: () {
                              setState(
                                    () {
                                  discussion = discussionList.elementAt(index);

                                  reply = true;
                                  FocusScope.of(context)
                                      .requestFocus(_focusNode);
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColorPalette.notificationSwap),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 18,
                                              backgroundColor: Colors.grey,
                                              child:
                                              Image.asset(list.img ?? ""),
                                            ),
                                            sbw5,
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  list.name ?? "",
                                                  style: AppTextStyle
                                                      .courseTileHeader(),
                                                ),
                                                sbh5,
                                                Text(
                                                  list.date ?? "",
                                                  style:
                                                  AppTextStyle.notesTime(),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            list.mentionList.isEmpty
                                                ? const Text("")
                                                : Row(
                                              children: [
                                                Text(
                                                  "(",
                                                  style: AppTextStyle
                                                      .profileAdmin(),
                                                ),
                                                Text(
                                                  (list.mentionList
                                                      .length)
                                                      .toString(),
                                                  style: AppTextStyle
                                                      .profileAdmin(),
                                                ),
                                                Text(
                                                  ")",
                                                  style: AppTextStyle
                                                      .profileAdmin(),
                                                )
                                              ],
                                            ),
                                            sbw5,
                                            InkWell(
                                              onTap: () {
                                                discussion = discussionList
                                                    .elementAt(index);

                                                reply = true;
                                                FocusScope.of(context)
                                                    .requestFocus(_focusNode);
                                                setState(() {});
                                              },
                                              child: Image.asset(
                                                AppIcons.reply,
                                                height: 15,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    sbh10,
                                    Text(
                                      list.discussion ?? "",
                                      style: AppTextStyle.body(),
                                    ),
                                    sbh10,
                                    list.mentionList.isNotEmpty
                                        ? Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Replies...",
                                          style: AppTextStyle.smallBold(
                                              fontSize: 12,
                                              color:
                                              AppColorPalette.grey),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        ListView.separated(
                                            physics:
                                            const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (context, index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(10),
                                                    color: AppColorPalette
                                                        .mentionBox
                                                        .withOpacity(.1)),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              CircleAvatar(
                                                                radius:
                                                                16,
                                                                backgroundColor:
                                                                Colors
                                                                    .grey,
                                                                child: Image.asset(list
                                                                    .mentionList
                                                                    .elementAt(index)
                                                                    .img ??
                                                                    ""),
                                                              ),
                                                              sbw5,
                                                              Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    list.mentionList.elementAt(index).name ??
                                                                        "",
                                                                    style:
                                                                    AppTextStyle.leaderboardName(),
                                                                  ),
                                                                  const SizedBox(
                                                                    height:
                                                                    3,
                                                                  ),
                                                                  Text(
                                                                    list.mentionList.elementAt(index).date ??
                                                                        "",
                                                                    style:
                                                                    AppTextStyle.mentionTime(),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      sbh10,
                                                      Text(
                                                        list.mentionList
                                                            .elementAt(
                                                            index)
                                                            .discussion ??
                                                            "",
                                                        style:
                                                        AppTextStyle
                                                            .body(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            itemCount:
                                            list.mentionList.length),
                                      ],
                                    )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: discussionList.length),
                ),
                sbh10,
                Container(
                  color: AppColorPalette.notificationSwap,
                  child: Row(
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          child: SizedBox(
                            height: reply ? 158 : 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reply
                                    ? Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 15, top: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                radius: 18,
                                                backgroundColor:
                                                Colors.grey,
                                                child: Image.asset(
                                                    discussion?.img ??
                                                        ""),
                                              ),
                                              sbw5,
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    discussion?.name ??
                                                        "",
                                                    style: AppTextStyle
                                                        .leaderboardName(),
                                                  ),
                                                  sbh5,
                                                  Text(
                                                    discussion?.date ??
                                                        "",
                                                    style: AppTextStyle
                                                        .mentionTime(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              reply = false;
                                              setState(() {});
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.0),
                                              child: Icon(
                                                Icons.close,
                                                size: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    sbh10,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 15),
                                      child: Text(
                                        shortenedText,
                                        style: AppTextStyle.body(),
                                      ),
                                    ),
                                    sbh15,
                                    Container(
                                      height: 1,
                                      color: Colors.grey.withOpacity(.2),
                                    ),
                                  ],
                                )
                                    : Container(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 50,
                                          child: TextField(
                                            maxLines: null,
                                            inputFormatters: [
                                              // Custom formatter to remove leading/trailing spaces
                                              FilteringTextInputFormatter.deny(
                                                  RegExp(r'^\s+$')),
                                            ],
                                            onChanged: (val) {
                                              setState(() {});
                                            },
                                            focusNode: _focusNode,
                                            controller: discussionCon,
                                            decoration: InputDecoration(
                                              contentPadding:
                                              EdgeInsets.only(top: 20),
                                              hintText:
                                              "Start new discussion...",
                                              hintStyle: AppTextStyle.body(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0),
                                                  borderSide: const BorderSide(
                                                      color: AppColorPalette
                                                          .bgColor,
                                                      width: 0)),
                                              disabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5.0),
                                                  borderSide: const BorderSide(
                                                      color: AppColorPalette
                                                          .bgColor,
                                                      width: 0)),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                    color:
                                                    AppColorPalette.bgColor,
                                                    width: 0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      discussionCon.text != ""
                                          ? InkWell(
                                        onTap: () {
                                          // print(discussion
                                          //     ?.mentionList.length);

                                          // String? count="0";
                                          // print('clickd!!!!!!!!!1');
                                          count = int.tryParse(discussion
                                              ?.replyCount ??
                                              "0") ??
                                              0;
                                          reply == true
                                              ? count = count + 1
                                              : count;
                                          if (reply == true) {
                                            discussion?.mentionList.add(
                                                DiscussionModel(
                                                    0,
                                                    "name",
                                                    AppImages.b,
                                                    discussionCon.text,
                                                    "Feb 24, 2022",
                                                    count.toString(),
                                                    []));
                                            setState(() {});
                                            // print("mention");
                                            // print(discussion
                                            //     ?.mentionList.length);
                                          } else {
                                            discussionList.add(
                                                DiscussionModel(
                                                    0,
                                                    "name",
                                                    AppImages.b,
                                                    discussionCon.text,
                                                    "Feb 24, 2022",
                                                    count.toString(),
                                                    []));
                                            setState(() {});
                                            // print('discussion');
                                          }

                                          discussionCon.text = "";
                                          reply = false;
                                          discussion = null;
                                          FocusScope.of(context)
                                              .unfocus();
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              color: AppColorPalette
                                                  .appBlue),
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 2.0),
                                            child: Icon(
                                              Icons.send,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                          // Disable the button when no message is typed
                                        ),
                                      )
                                          : Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color:
                                            AppColorPalette.appBlue),
                                        child: const Padding(
                                          padding:
                                          EdgeInsets.only(left: 2.0),
                                          child: Icon(
                                            Icons.send,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                        // Disable the button when no message is typed
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String shortenText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength - 3)}...';
  }
}
