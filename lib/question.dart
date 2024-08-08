import 'package:flutter/material.dart';

import 'package:quizapplication/data/questions.dart';
import 'package:quizapplication/widgets/answer_btn.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer,{super.key,});
  // this to save answer of user
  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex=0;
  void answerQuestions(String answer){
    setState(() {
   widget.onSelectedAnswer(answer);
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
  final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color.fromARGB(255, 82, 145, 246))),
    
          const SizedBox(
            height: 20,
          ),
          ...currentQuestion.shuffeldAnswers.map((e) {
            return Container(
              margin: const EdgeInsets.all(10),
              child: AnswerButton(answerText: e, onPressed: (){
                answerQuestions(e);
              },),
            );
          }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
