import 'dart:developer';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //variable (var), peremennye, ozgormolor
  String adamAty = 'Jon Doe';

  int baasy = 100;
  double tolukSumma = 10.99;
  Mashina mashina1 = Mashina(jyly: 2021, marka: 'BMW');
  Mashina mashina2 = Mashina(marka: 'Toyota', jyly: 2021);
  Mashina mashina3 = Mashina(marka: 'Toyota', jyly: 2021);

  // Mashina bmw = Mashina('BMW', 1995);//Bul Versiya 1 uchun
  // Mashina bmw2 = Mashina();

  //List (array), massiv, tizme

  List<String> toygoKelgender = ['Jon', 'Doe', 'Jane'];
  List<int> baalar = [
    1,
    4,
    5,
    3,
    4,
    2,
    4,
    5,
    5,
    5
  ]; //Bosh tizme jariyaloo ,ichi bosh, turu int

  // List<Mashina> mashinalarym = <Mashina>[];//Ichi bosh tizme
  List<Mashina> mashinalarym = [
    Mashina(marka: 'Tesla', jyly: 2019),
    Mashina(marka: 'Toyota', jyly: 2020),
    Mashina(marka: 'BMW', jyly: 2001),
    Mashina(marka: 'Opel', jyly: 1983),
  ];

  //IF ELSE, (ELSE IF), egerde minday bolso, a bolboso...

  kolaAlypKel([String kola, String pepsi]) {
    //if else
    if (kola == null) {
      //pepsiAl();
    } else if (pepsi == null) {
      //kolaAl();
    } else {
      //suuAl();
    }

    // //switch case

    // switch (kola) {
    //   case null:
    //   //

    //     break;
    //   case 'Cola':
    //   //

    //     break;
    //   default:
    // }
  }

  beshterdiTap() {
    for (var baa in baalar) {
      if (baa == 5) {
        log('baalar ichindegi 5 ter: $baa');
      }
      // else {
      //   print('baalar ichindegi kalgan baalar: $baa');
      // }
    }
  }

  void toyotanyTap([String marka]) {
    //Verisya 1, for loop
    for (int i = 0; i <= mashinalarym.length - 1; i++) {
      if (mashinalarym[i].marka == 'Toyota') {
        log('Toyotalar: ${mashinalarym[i].marka}');
      }
      if (mashinalarym[i].marka == 'BMW') {
        log('BMW: ${mashinalarym[i].marka}');
      }
    }

    // //Versiya 2, forEach loop
    mashinalarym.forEach((mashina) {
      if (mashina.marka == 'Toyota') {
        log('forEach=> toyota: ${mashina.marka}');
      }
    });

    // //Versiya 3, for in loop (kobuncho ushunu koldongula)

    for (var mashina in mashinalarym) {
      if (mashina.marka == 'Toyota') {
        log('for in=> toyota: ${mashina.marka}');
      }
    }
  }

  int mashinalarymdynIndeksiniTap(Mashina mashina) {
    int _index = mashinalarym.indexOf(mashina);

    // print('mashinalarymdynIndeksiniTap._index: $_index');

    return _index;
  }

  bmwnyTap() {
    int _index = mashinalarymdynIndeksiniTap(mashina2);

    // print('bmwnyTap._index: $_index');

    // mashinalarym.removeAt(_index); //bul ochurot
  }

  void mashinaSatypAl() {
    mashinalarym.add(mashina1);
    mashinalarym.add(mashina2);
    mashinalarym.add(mashina3);
    mashinalarym.add(
        Mashina(marka: 'Mers1')); //Prosto koshot, tizmede akyrky bolup kalat
    mashinalarym.insert(
        0,
        Mashina(
            marka: 'Mers2')); //insert kanchanchy bolup koshkongo jardam beret
  }

  List<Widget> ikonkalarTizmesi = <Widget>[];

  @override
  Widget build(BuildContext context) {
    // beshterdiTap();
    mashinaSatypAl();
    // print('mashinalarymdyn sany: ${mashinalarym.length}');
    // // bmwnyTap();
    // // print('toygoKelgenderdin sany: ${toygoKelgender.length}');
    // print('mashinalarymdyn sany: ${mashinalarym.length}');

    toyotanyTap();
    // print(
    //     'tizmede uchunchu mashinam emne?: ${mashinalarym[2].marka}'); //0 don bashtap eseptelet
    // print('tizmede birinchi mashinam emne?: ${mashinalarym.first.marka}');
    // print('tizmede akykrky mashinam emne?: ${mashinalarym.last.marka}');
    // print('baalar.lenght: ${baalar.length}');

    // print(
    //     'bmw=> marka: ${bmw.marka} jana jyly: ${bmw.jyly} and drive: ${bmw.driveCar()}');
    // print('bmw2=> marka: ${bmw2.marka} jana jyly: ${bmw2.jyly}');

    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}

class Mashina {
  String marka;
  int jyly;
  //Versiya 1. Sozsuz parametr jiberilish kerek
  // Mashina(this.marka, this.jyly);

  //Versiya 2. named optinial constructor Sozsuz parametr jiberbese bolot, birok aty jazilish kerek
  Mashina({this.marka, this.jyly});

  //Versiya 1. parametr jiberbese da bolot
  // Mashina([this.marka, this.jyly]);

  //Versiya 2. Sozsuz parametr jiberish kerke, birok aty jazilish kerek
  // Mashina({@required this.marka, this.jyly = 1950});

  driveCar() {
    print('Mashina jurdu');
  }
}

class Toyota extends Mashina {
  @override
  driveCar() {
    return super.driveCar();
  }
}
