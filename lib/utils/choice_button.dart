import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String choice;
  final VoidCallback onpressed;
  bool? isCurrentAnswer;
  ChoiceButton(this.choice,
      {super.key, required this.onpressed, this.isCurrentAnswer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isCurrentAnswer == null
              ? Colors.white
              : (isCurrentAnswer == false
                  ? Colors.red
                  : Colors.teal), // This is what you need!
        ),
        child: Text(
          choice,
        ),
      ),
    );
  }
}
