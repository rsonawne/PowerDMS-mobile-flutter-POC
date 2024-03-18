import 'package:flutter/material.dart';
import 'package:power_recall/power_recall/data/question_model.dart';
import 'package:power_recall/utils/choice_button.dart';
import 'package:power_recall/utils/sine_curve.dart';

enum ShareKeyOption { a, b, c, d }

// ignore:, must_be_immutable
class QuestionPage extends StatefulWidget {
  QuestionModel? questionData;
  final VoidCallback prevClicked;
  final VoidCallback nextClicked;

  QuestionPage(
      {super.key,
      required this.questionData,
      required this.nextClicked,
      required this.prevClicked});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with SingleTickerProviderStateMixin {
  final shakeKeyOptionA = GlobalKey<ShakeWidgetState>();
  final shakeKeyOptionB = GlobalKey<ShakeWidgetState>();
  final shakeKeyOptionC = GlobalKey<ShakeWidgetState>();
  final shakeKeyOptionD = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void shake({required String shakeKey_option}) {
    switch (shakeKey_option) {
      case 'a':
        shakeKeyOptionA.currentState?.shake();
        break;
      case 'b':
        shakeKeyOptionB.currentState?.shake();
        break;
      case 'c':
        shakeKeyOptionC.currentState?.shake();
        break;
      case 'd':
        shakeKeyOptionD.currentState?.shake();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.questionData?.question ?? "--",
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          ShakeWidget(
            key: shakeKeyOptionA,
            shakeCount: 3,
            shakeOffset: 3,
            shakeDuration: const Duration(milliseconds: 400),
            child: ChoiceButton(
              widget.questionData?.a ?? "",
              onpressed: () {
                if (widget.questionData!.answer!.toLowerCase() == "a") {
                } else {
                  shake(
                    shakeKey_option: widget.questionData!.answer!.toLowerCase(),
                  );
                }
              },
            ),
          ),
          ShakeWidget(
            key: shakeKeyOptionB,
            shakeCount: 3,
            shakeOffset: 3,
            shakeDuration: const Duration(milliseconds: 400),
            child: ChoiceButton(
              widget.questionData?.b ?? "",
              onpressed: () {
                if (widget.questionData!.answer!.toLowerCase() == "b") {
                } else {
                  shake(
                    shakeKey_option: widget.questionData!.answer!.toLowerCase(),
                  );
                }
              },
            ),
          ),
          ShakeWidget(
            key: shakeKeyOptionC,
            shakeCount: 3,
            shakeOffset: 3,
            shakeDuration: const Duration(milliseconds: 400),
            child: ChoiceButton(
              widget.questionData?.c ?? "",
              onpressed: () {
                if (widget.questionData!.answer!.toLowerCase() == "c") {
                } else {
                  shake(
                    shakeKey_option: widget.questionData!.answer!.toLowerCase(),
                  );
                }
              },
            ),
          ),
          ShakeWidget(
            key: shakeKeyOptionD,
            shakeCount: 3,
            shakeOffset: 3,
            shakeDuration: const Duration(milliseconds: 400),
            child: ChoiceButton(
              widget.questionData?.d ?? "",
              onpressed: () {
                if (widget.questionData!.answer!.toLowerCase() == "d") {
                } else {
                  shake(
                    shakeKey_option: widget.questionData!.answer!.toLowerCase(),
                  );
                }
              },
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 0, bottom: 20, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: widget.prevClicked,
                  child: Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                    child: Container(
                  height: 10,
                )),
                ElevatedButton(
                  onPressed: widget.nextClicked,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
