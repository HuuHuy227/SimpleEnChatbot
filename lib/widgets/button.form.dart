import 'package:chat_bot_app/color/colors.dart';
import 'package:chat_bot_app/view/chat.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.accController, required this.passController});
  final TextEditingController accController;
  final TextEditingController passController;

  showAlertDialog(BuildContext context, String title, String content) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop(true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void handleLogin(BuildContext context) {
    final acc = accController.text;
    final pass = passController.text;
    if (acc.isEmpty || pass.isEmpty) {
      // fix password
      showAlertDialog(context, 'Missing Account or Password Field',
          'Please fill in account and password!');
    } else {
      // Fixed password and login
      if (acc == 'admin' && pass == '123456') {
        accController.clear();
        passController.clear();
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        Get.to(const ChatView());
      } else {
        //Navigator.pop(context);
        showAlertDialog(context, 'Invalid Account or Password',
            'Please enter account and password again!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleLogin(context),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            color: GlobalColors.mainColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ]),
        child: const Text(
          'Sign in',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
