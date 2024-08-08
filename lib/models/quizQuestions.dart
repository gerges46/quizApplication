class QuizQuestion {
  QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
  // function  to make answer not Random 
  List<String>get shuffeldAnswers{
    final shuffeldList=List.of(answers);
    shuffeldList.shuffle();
    return shuffeldList;

  }
}
