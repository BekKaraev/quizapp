import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/suroonun_meesi.dart';
import 'custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({ Key key,}) : super(key: key);



  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int count = 0;
  String suroo = 'суроо жок';

  Widget tuuraikonka = const Padding(
    padding: EdgeInsets.only(left: 15.0),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Color(0xff4CAF52),
      size: 45.0,
    ),
  );

  Widget kataikonka = const Padding(
    padding: EdgeInsets.only(left: 15.0),
    child: FaIcon(
      FontAwesomeIcons.xmark,
      color: Color(0xffF54335),
      size: 45.0,
    ),
  );
  List<Widget> icons = <Widget>[];
  void koldonuchujoopberdi(bool koldonuchununjoobu) {
    bool tuurajooptor = suroonunMeesi.jooptuAlypkel();
    if (koldonuchununjoobu == tuurajooptor) {
      icons.add(tuuraikonka);
    } else {
      icons.add(kataikonka);
    }
    suroonunMeesi.suroonuOtkoz();
    suroo = suroonunMeesi.suroonuAlypkel();

    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    suroo = suroonunMeesi.suroonuAlypkel();
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
            // const SizedBox(
            //   height: 25.0,
            // ),
            Text(
              suroo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
            suroo == 'БУТТУ'
                ? CustomButton(
                    text: 'Кайрадан Башта',
                    tus: const Color(0xff4CAF52),
                    onPressed: () {
                      setState(() {
                        icons = <Widget>[];
                        suroo = suroonunMeesi.reset();
                      });
                    },
                  )
                : Column(
                    children: [
                      CustomButton(
                        text: 'ТУУРА',
                        tus: const Color(0xff4CAF52),
                        onPressed: () {
                          koldonuchujoopberdi(true);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        text: 'ТУУРА ЭМЕС',
                        tus: const Color(0xffF54335),
                        onPressed: () {
                          koldonuchujoopberdi(false);
                        },
                      ),
                      suroo == 'БУТТУ'
                          ? const SizedBox()
                          : Row(
                              children: icons,
                            ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
