//@dart=2.9

class QuestionModel {
  final String question;
  final String answer;
  final List options;
  int answerIndex;

  QuestionModel({this.question, this.answer, this.options}) {
    options.add(answer);
    options.shuffle();
    for (int i = 0; i < options.length; i++) {
      if (options[i] == answer) {
        answerIndex = i;
      }
    }
  }



  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'question': question,
      "answerIndex": answerIndex,
      "options": options
    };
  }
}
