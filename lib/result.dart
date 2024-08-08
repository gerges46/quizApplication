import 'package:flutter/material.dart';
import 'package:quizapplication/data/questions.dart';
import 'package:quizapplication/widgets/summery.dart';

class Result extends StatelessWidget {
 Result(this.onSelectedAnswer,this.restart, {super.key});
  final List<String> onSelectedAnswer;
 final void Function() restart;
  // function to check the true answer and cheak the answer of user
  List<Map<String, Object>>get summeryData {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < onSelectedAnswer.length; i++) {
      summery.add({
        "Question_index": i,
        "Question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": onSelectedAnswer[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
   // final summaryData = summeryData();
    // var numOfCorrectAnswer = 0;
    int numOfCorrectAnswer = summeryData
        .where((element) => element["user_answer"] == element["correct_answer"])
        .length;

    /*    for (var i = 0; i < summaryData.length; i++) {
      if (summaryData[i]["user_answer"] == summaryData[i]["correct_answer"]) {
        numOfCorrectAnswer++;
      }
    } */

/*    for (var element in summaryData) {
         if (element["user_answer"] ==element["correct_answer"]) {
        numOfCorrectAnswer++;
   }} */
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered ${numOfCorrectAnswer} questions from ${questions.length} question correct",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
              ),
              const SizedBox(
                height: 30,
              ),
              SummaryPage(summeryData),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                onPressed: restart,
                child: const Text(
                  "Restart Quiz",
                  style: TextStyle(color: Colors.white),
                ),
              ),
    const SizedBox(
                height: 10,
              ),
            ]),
      ),
    );
  }
}
