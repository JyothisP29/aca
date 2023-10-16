import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_icons.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:acadle/controller/bottomsheet_controller/notes_con.dart';
import 'package:acadle/models/bottomsheetmodels/notes_bottomsheet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Utilities/contstants.dart';

class NotesBottomSheet extends StatefulWidget {
  const NotesBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<NotesBottomSheet> createState() => _NotesBottomSheet();
}

class _NotesBottomSheet extends State<NotesBottomSheet> {
  bool expand = false;
  final TextEditingController _textEditingController = TextEditingController();
  final TextInputFormatter noLeadingSpaceFormatter =
      FilteringTextInputFormatter.deny(RegExp(r'^\s+$'));

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          expand = true;
          setState(() {});
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: expand
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * .7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sbh10,
              Center(
                child: Container(
                  height: 3,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                ),
              ),
              sbh10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notes",
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade200,
                  height: 1,
                ),
              ),
              sbh10,
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColorPalette.notificationSwap),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  noteList.elementAt(index).note ?? "",
                                  style: AppTextStyle.body(),
                                ),
                                sbh5,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      noteList.elementAt(index).date ?? "",
                                      style: AppTextStyle.notesTime(),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        noteList.removeAt(index);
                                        setState(() {});
                                      },
                                      child: Image.asset(
                                        AppIcons.delete,
                                        height: 20,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 5,
                        ),
                    itemCount: noteList.length),
              ),
              sbh10,
              Container(
                color: AppColorPalette.notificationSwap,
                padding: const EdgeInsets.only(left: 10.0, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: SingleChildScrollView(
                          child: TextField(
                            maxLines: null,
                            inputFormatters: [noLeadingSpaceFormatter],
                            decoration: InputDecoration(
                              hintText: "Add a note...",
                              hintStyle: AppTextStyle.body(),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: AppColorPalette.bgColor,
                                      width: 0)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: AppColorPalette.bgColor,
                                      width: 0)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                    color: AppColorPalette.bgColor, width: 0),
                              ),
                            ),
                            controller: _textEditingController,
                            onChanged: (text) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                    _textEditingController.text != ""
                        ? InkWell(
                            onTap: () {
                              if (_textEditingController.text != "") {
                                noteList.add(NotesBottomSheetModel(
                                    0,
                                    _textEditingController.text,
                                    "1 second ago"));
                                _textEditingController.text = "";
                              }
                              setState(() {});
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColorPalette.appBlue),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 2.0),
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
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorPalette.appBlue),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 2.0),
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
    );
  }
}
