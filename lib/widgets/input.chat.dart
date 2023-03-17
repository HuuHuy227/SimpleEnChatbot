import 'package:flutter/material.dart';

class InputChat extends StatelessWidget {
  const InputChat({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Expanded build(BuildContext context) {
    return Expanded(
      child: TextField(
      // inputFormatters: [BlacklistingTextInputFormatter(new RegExp(r"\s\b|\b\s"))],
      // textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: const InputDecoration(
          fillColor: Color.fromARGB(255, 241, 230, 230),
          filled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none),
    ));
  }
}
