import 'package:acadle/Utilities/app_colors.dart';
import 'package:acadle/Utilities/app_textstyle.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isComposingMessage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorPalette.notificationSwap,
      padding: const EdgeInsets.only(left: 10.0,right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Add a note...",
                  hintStyle: AppTextStyle.smallRegular(color: AppColorPalette.searchBarColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                ),
                controller: _textEditingController,
                onChanged: (text) {
                  setState(() {
                    _isComposingMessage = text.isNotEmpty;
                  });
                },
              ),
            ),
          ),
          Container(
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
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
