import 'package:flutter/material.dart';

import '../color/colors.dart';

class SubmitChat extends StatelessWidget {
  const SubmitChat({super.key, required this.handleSubmit});

  final Function handleSubmit; 

  @override
  Widget build(BuildContext context) {
    return Visibility(
        child: Container(
          color: const Color.fromARGB(255, 241, 230, 230),
          child: IconButton(
            icon: Icon(
              Icons.send_rounded,
              color: GlobalColors.mainColor,
            ),
            onPressed: () => handleSubmit(),
          ),
        ));
  }
}
