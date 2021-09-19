//@dart=2.9

class QuestionModel {
  final String question;
  final String answer;
  final options;

  QuestionModel({this.question, this.answer, this.options});

  QuestionModel.fromJson(Map<String, dynamic> json)
      : answer = json["answer"],
        question = json["question_statement"],
        options = json["options"];

  Map<String, dynamic> toJson() {
    return {'answer': answer, 'question': question, "options": options};
  }
}
