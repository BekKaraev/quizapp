import 'package:quizapp/data/services/quiz_services.dart';

class QuizRepo {
  String getQuestion() {
    return quizServices.getQuestion();
  }

  bool getAnswer() {
    return quizServices.getAnswer2();
  }

  void getNext() {
    quizServices.getNext();
  }

  void reset() {
    quizServices.reset();
  }
}

final QuizRepo quizRepo = QuizRepo();