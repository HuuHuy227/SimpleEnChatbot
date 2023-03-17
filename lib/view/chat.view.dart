import 'dart:convert';
import 'package:chat_bot_app/color/colors.dart';
import 'package:chat_bot_app/widgets/input.chat.dart';
import 'package:chat_bot_app/widgets/submit.chat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../items/chat.message.dart';
import '../widgets/chat.message.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

Future<String> callAPI(String prompt) async {
  var url = Uri.https('enchatbotapi.onrender.com', '/respone');
  final respone = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "sentence": prompt, 
        "max_token": 12
      }));

  Map<String, dynamic> newrespone = json.decode(respone.body);
  //var newrespone = jsonDecode(respone.body);
  if (newrespone['code'] == 0) {
    return newrespone['result'];
  } else {
    throw Exception('Something wrong!');
  }
}

class _ChatViewState extends State<ChatView> {
  final List<ChatMessage> message = [
    ChatMessage(
        text: "Hello. I'm Chatbot, how can i help you?",
        chatMessageType: ChatMessageType.bot)
  ];
  TextEditingController controller = TextEditingController();
  late bool isLoading;
  final scrollController = ScrollController();

  void handleSubmit() {
    setState(() {
      message.add(ChatMessage(
          text: controller.text, chatMessageType: ChatMessageType.user));
      isLoading = true;
    });
    var input = controller.text.trim();
    controller.clear();
    Future.delayed(const Duration(milliseconds: 50))
        .then((value) => scrollDown());
    //print(input);
    callAPI(input).then((value) {
      setState(() {
        isLoading = false;
        message.add(
            ChatMessage(text: value, chatMessageType: ChatMessageType.bot));
      });
    });
    controller.clear();
    Future.delayed(const Duration(milliseconds: 50))
        .then((value) => scrollDown());
  }

  void scrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  ListView buildList() {
    return ListView.builder(
        itemCount: message.length,
        controller: scrollController,
        itemBuilder: ((context, idx) {
          var res = message[idx];
          return ChatMessageWidget(
              text: res.text, chatMessageType: res.chatMessageType);
        }));
  }

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: GlobalColors.mainColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: GlobalColors.mainColor,
        centerTitle: true,
        title: const Text(
          "ChatApp",
          style: TextStyle(fontSize: 40),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        //padding: const EdgeInsets.only(top: 5),
        child: Column(children: [
          Expanded(child: buildList()),
          Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(children: [
              InputChat(controller: controller),
              SubmitChat(handleSubmit: handleSubmit)
            ]),
          ),
        ]),
      ),

      //  body: SingleChildScrollView(
      //     padding: const EdgeInsets.all(20),
    );
  }
}
