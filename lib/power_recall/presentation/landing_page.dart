import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:power_recall/power_recall/data/question_model.dart';
import 'package:power_recall/power_recall/presentation/multi_selection.dart';
import 'package:power_recall/power_recall/presentation/question.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<QuestionModel>? questionList;
  ScrollController scrollController = ScrollController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    readJson().then((value) => setState(() {}));
  }

  void _scrollAtIndex(int currentIndex) {
    scrollController
        .jumpTo((MediaQuery.of(context).size.width - 40) * currentIndex);
  }

  Future<void> readJson() async {
    String response = await rootBundle.loadString('assets/question.json');
    final data = await json.decode(response);

    setState(() {
      questionList = List<QuestionModel>.from(
          data.map((model) => QuestionModel.fromJson(model)));

      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POWER RECALL_1"),
      ),
      body: questionList == null
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.only(left: 18, right: 24, bottom: 14),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 10,
                              child: LinearProgressIndicator(
                                value: currentIndex /
                                    questionList!.length, //current / max
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                backgroundColor: Colors.blue.shade100,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Text("$currentIndex/${questionList!.length}")
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      controller: scrollController,
                      itemCount: questionList?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: index == 1
                              ? MultiSelection(
                                  nextClicked: () {
                                    setState(() {
                                      _scrollAtIndex(index + 1);

                                      currentIndex = index + 1;
                                    });
                                  },
                                  prevClicked: () {
                                    setState(() {
                                      _scrollAtIndex(index - 1);
                                      currentIndex = index - 1;
                                    });
                                  },
                                )
                              : QuestionPage(
                                  questionData: questionList![index],
                                  nextClicked: () {
                                    setState(() {
                                      _scrollAtIndex(index + 1);

                                      currentIndex = index + 1;
                                    });
                                  },
                                  prevClicked: () {
                                    setState(() {
                                      _scrollAtIndex(index - 1);
                                      currentIndex = index - 1;
                                    });
                                  },
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
