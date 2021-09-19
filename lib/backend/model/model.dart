//@dart=2.9

class QuestionModel {
  final String question;
  final String answer;
  final List<String> options;

  QuestionModel({this.question, this.answer, this.options});

  QuestionModel.fromJson(Map<String, dynamic> json)
      : answer = json["questions"]["answer"],
        question = json["questions"]["question_statement"],
        options = json["questions"]["options"];

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'question': question,
      "options":options
    };
  }
}
