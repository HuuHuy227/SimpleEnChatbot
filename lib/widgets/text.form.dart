import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({super.key, 
                  required this.controller, 
                  required this.typeInput, 
                  required this.textInputType, 
                  required this.obscure});
  final TextEditingController controller;
  final String typeInput;
  final TextInputType textInputType;
  final bool obscure;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
          ]),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          hintText: typeInput,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
