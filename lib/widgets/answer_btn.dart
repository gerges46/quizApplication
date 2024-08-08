import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
   AnswerButton( {super.key, required this.answerText, required this.onPressed});
  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigoAccent,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed, child: Text(answerText,textAlign: TextAlign.center,));
  }
}