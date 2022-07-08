import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/widgets/custom_button.dart';
import 'package:quizapp/data/repos/quiz_repo.dart';
import 'package:quizapp/widgets/icon_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String question;
  bool isFinished;

  Widget correctIcon = const IconWidget(
    color: Color(0xff4EA052),
    icons: FontAwesomeIcons.check,
  );
  Widget wrongIcon = const IconWidget(
    color: Color(0xffF54335),
    icons: FontAwesomeIcons.xmark,
  );

  List<Widget> icons = <Widget>[];

  @override
  void initState() {
    question = quizRepo.getQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'ТАПШЫРМА-07',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Text(
              question,
              style: const TextStyle(fontSize: 35.0, color: Colors.white),
            ),
            if (isFinished == true)
              reset()
            else
              Column(
                children: [
                  CustomButton(
                    text: 'Туура',
                    color: const Color(0xff4EA052),
                    onPressed: () {
                      userAnswerd(true);
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomButton(
                    text: 'Ката',
                    color: const Color(0xffF54335),
                    onPressed: () {
                      userAnswerd(false);
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            Row(
              children: icons,
            )
          ],
        ),
      ),
    );
  }

  void userAnswerd(bool koldonuuchununJoobu) {
    bool tuuraJooptor = quizRepo.getAnswer();
    if (koldonuuchununJoobu == tuuraJooptor) {
      icons.add(correctIcon);
    } else {
      icons.add(wrongIcon);
    }
    quizRepo.getNext();
    question = quizRepo.getQuestion();
    if (question == 'БУТТУ') {
      isFinished = true;
    }
    setState(() {});
  }

  Widget reset() {
    return CustomButton(
      color: Colors.green,
      text: 'кайрадан баштаа',
      onPressed: () {
        quizRepo.reset();
        question = quizRepo.getQuestion();
        isFinished = false;
        icons = [];
        setState(() {});
      },
    );
  }
}
