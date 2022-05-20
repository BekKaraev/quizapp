import 'package:quizapp/suroo_model.dart';

class SuroonunMeesi {
  int index = 0;

  // ignore: non_constant_identifier_names
  List<SurooModeli> suroojooptor = [
    SurooModeli(suroo: 'Кыргызстан Кытай менен чектешби ?', joop: true),
    SurooModeli(suroo: 'ОШ борбор шаарбы ?', joop: false),
    SurooModeli(suroo: 'Кыргызстан Эгемендуу олко ?', joop: true),
    SurooModeli(suroo: 'Кытайдын борбору Шанхай ?', joop: false),
    SurooModeli(suroo: 'бишкек москвадабы ?', joop: false),
  ];

  // ignore: non_constant_identifier_names
  String suroonuAlypkel() {
    if (suroojooptor.length == index) {
      return 'БУТТУ';
    }
    return suroojooptor[index].suroo;
  }

  bool jooptuAlypkel() {
    return suroojooptor[index].joop;
  }

  suroonuOtkoz() {
    index++;
  }

  String reset() {
    index = 0;
    return suroonuAlypkel();
  }
}

final SuroonunMeesi suroonunMeesi = SuroonunMeesi();
