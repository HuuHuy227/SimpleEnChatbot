import 'package:chat_bot_app/color/colors.dart';
import 'package:chat_bot_app/items/chat.message.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({super.key, required this.text, required this.chatMessageType});
  
  final String text;
  final ChatMessageType chatMessageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      color: chatMessageType == ChatMessageType.bot 
              ? Colors.white
              : const Color.fromARGB(255, 233, 231, 230),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          chatMessageType == ChatMessageType.bot
          ? Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
              child: Image.asset(
                    'assets/avt.png',
                    scale: 2,
              ),
            ),
          )
          : Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
          ),
          Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Text(
                          text,
                          //style: GoogleFonts.lato(),
                          style: TextStyle(
                            color: chatMessageType == ChatMessageType.bot ? GlobalColors.textColor : GlobalColors.mainColor,
                            //fontFamily: 'MyFont',
                            fontWeight: FontWeight.w500,
                            fontSize: 12
                          ),
                        ),
                      ),
                    ],
              ),)
      ]),
    );
  }
}
