import 'package:chat_bot_app/color/colors.dart';
import 'package:chat_bot_app/widgets/text.form.dart';
import 'package:flutter/material.dart';

import '../widgets/button.form.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController accController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'CHATBOT',
                  style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Login to your Account',
                style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              TextForm(
                controller: accController,
                typeInput: 'Account',
                textInputType: TextInputType.text,
                obscure: false,
              ),
              const SizedBox(
                height: 10,
              ),
              TextForm(
                controller: passController,
                typeInput: 'Password',
                textInputType: TextInputType.visiblePassword,
                obscure: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                accController: accController,
                passController: passController,
              ),
            ],
          )),
    ),
    bottomNavigationBar: Container(
      height: 80,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account?',
            style: TextStyle(fontSize: 16),
            ),
          Text('Sign up',style: TextStyle(
            color: GlobalColors.mainColor,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),),
      ]
      ),
    ),
    
    );
  }
}
