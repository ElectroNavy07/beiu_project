import 'package:beiu_project/Anunt.dart';
import 'package:beiu_project/firebase/Nume.dart';
import 'package:beiu_project/panou_comanda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'fereastra.dart';
import 'package:cool_alert/cool_alert.dart';
import 'Data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

class Variabile extends StatefulWidget {
  static const id = '/v';

  @override
  State<Variabile> createState() => _VariabileState();
}

class _VariabileState extends State<Variabile> {
  final _controller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  int ziua = 0;
  int luna = 0;
  int anul = 0;
  List numere_adunate = [];
  final _firestore = FirebaseFirestore.instance;
  DateTime now = new DateTime.now();
  String primul_nume = '';
  String al_doilea_nume = '';
  String al_treilea_nume = '';
  int _page = 0;
  String nume = '';
  String nume1 = '';
  String nume32 = '';
  int denumire_directie = 0;
  @override
  Widget build(BuildContext context) {
    String data = '';
    return Scaffold(
        backgroundColor: Color(0xffCCD8A6),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(padding: EdgeInsets.all(10.0)),
                        TextField(
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30, fontWeight: FontWeight.w400),
                          onChanged: (String value) {
                            primul_nume = value;
                            nume = primul_nume.toLowerCase().toString();
                            Provider.of<Data>(context, listen: false)
                                .schimba1();
                          },
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Primul Nume',
                              filled: true,
                              fillColor: Colors.grey[200]),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        TextField(
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30, fontWeight: FontWeight.w400),
                          readOnly: Provider.of<Data>(context).e1,
                          onChanged: (String value) {
                            al_doilea_nume = value;
                            nume1 = al_doilea_nume.toLowerCase().toString();
                            Provider.of<Data>(context, listen: false)
                                .schimba2();
                          },
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Al doilea nume',
                              filled: true,
                              fillColor: Colors.grey[200]),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        TextField(
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30, fontWeight: FontWeight.w400),
                          readOnly: Provider.of<Data>(context).e2,
                          onChanged: (String value) {
                            al_treilea_nume = value;
                            nume32 = al_treilea_nume.toLowerCase().toString();
                          },
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Al treilea nume',
                              filled: true,
                              fillColor: Colors.grey[200]),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        TextField(
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30, fontWeight: FontWeight.w400),
                          onChanged: (value) {
                            ziua = int.parse(value);
                          },
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: const Icon(Icons.today),
                              hintText: 'Ziua',
                              filled: true,
                              fillColor: Colors.grey[200]),
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        TextField(
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30, fontWeight: FontWeight.w400),
                          onChanged: (value) {
                            luna = int.parse(value);
                          },
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: const Icon(Icons.calendar_month),
                              hintText: 'Luna',
                              filled: true,
                              fillColor: Colors.grey[200]),
                          keyboardType: TextInputType.number,
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        TextField(
                          style: GoogleFonts.montserrat().copyWith(
                              fontSize: 30, fontWeight: FontWeight.w400),
                          onChanged: (value) {
                            anul = int.parse(value);
                            data = ziua.toString() +
                                ' / ' +
                                luna.toString() +
                                ' / ' +
                                anul.toString();
                          },
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon:
                                  const Icon(Icons.calendar_today_rounded),
                              hintText: 'Anul',
                              filled: true,
                              fillColor: Colors.grey[200]),
                          keyboardType: TextInputType.number,
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          direction: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Color(0xff628915),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40.0, vertical: 15.0),
                                    side: BorderSide(
                                        color: Color(0xff3F473A), width: 4.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    textStyle: const TextStyle(fontSize: 20.0)),
                                onPressed: () {
                                  int anul_curent = new DateTime.now().year;
                                  int luna_curenta = new DateTime.now().month;
                                  int ziua_curenta = new DateTime.now().day;
                                  Provider.of<Data>(context, listen: false)
                                      .schimba_anul_numerologic(
                                          ziua,
                                          luna,
                                          anul,
                                          ziua_curenta,
                                          luna_curenta,
                                          anul_curent);
                                  data = ziua.toString() +
                                      ' / ' +
                                      luna.toString() +
                                      ' / ' +
                                      anul.toString();
                                  if (ziua > 31 ||
                                      luna > 12 ||
                                      ziua == 0 ||
                                      luna == 0 ||
                                      anul == 0) {
                                    CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      title: 'Eroare',
                                      text: "Date incorecte",
                                    );
                                  } else {
                                    print('Data este ' + data);
                                    Provider.of<Data>(context, listen: false)
                                        .schimba(toatachestia(
                                            nume.toString(),
                                            nume1.toString(),
                                            nume32.toString(),
                                            ziua,
                                            luna,
                                            anul,
                                            data));
                                    int numer_magic = ziua * luna * anul;
                                    String smecher = numer_magic.toString();
                                    numere_adunate.clear();
                                    for (int x = 0; x < smecher.length; x++) {
                                      int ceva = int.parse(smecher[x]);
                                      numere_adunate.add(ceva);
                                    }
                                    Provider.of<Data>(context, listen: false)
                                        .adauga(context, numere_adunate!);
                                    Navigator.pushNamed(context, Fereastra.id);
                                  }
                                },
                                child: Text(
                                  'Rezultat',
                                  style: GoogleFonts.pacifico().copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xff3F473A),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 15.0),
                                      side: BorderSide(
                                          color: Color(0xff628915), width: 4.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      textStyle:
                                          const TextStyle(fontSize: 20.0)),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const FeedbackDialog());
                                  },
                                  child: Text('Feedback',
                                      style: GoogleFonts.pacifico()
                                          .copyWith(color: Colors.white))),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xff628915),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 40.0, vertical: 15.0),
                                      side: BorderSide(
                                          color: Colors.white, width: 4.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      textStyle:
                                          const TextStyle(fontSize: 20.0)),
                                  onPressed: () async {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      SchedulerBinding.instance
                                          .addPostFrameCallback((_) {
                                        Future.delayed(Duration.zero, () async {
                                          if (_auth.currentUser!.email ==
                                                  'c3vqwea43f@gmail.com' ||
                                              _auth.currentUser!.email ==
                                                  'dorina.ionita@ymail.com') {
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .countDocuments();
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .countDenumiri();
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .schimba_numar_grupa_reset();
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: Panou_comanda()));
                                          } else {
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .countDocuments();
                                            Provider.of<Data>(context,
                                                    listen: false)
                                                .schimba_numar_grupa_reset();
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: Anunt()));
                                          }
                                          // Your Code
                                        });
                                      });
                                    });
                                  },
                                  child: Text('Inbox',
                                      style: GoogleFonts.pacifico()
                                          .copyWith(color: Colors.white))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }

  RichText toatachestia(String nume_1, String nume_2, String nume_3, int ziua,
      int luna, int anul, String data) {
    var finish = new RichText(text: TextSpan());
    String prima_cifra_nume2 = '';
    String prima_cifra_nume3 = '';
    String prima_cifra_nume1 = '';
    String nume1_cifre = '';
    String nume2_cifre = '';
    String nume3_cifre = '';
    int lungimen = nume_1.length;
    int lungimen1 = nume_2.length;
    int lungimen2 = nume_3.length;
    String schimba(String vari) {
      String par = '';
      if (vari == 'a' || vari == 'j' || vari == 's') {
        par = '1';
      } else if (vari == 'b' || vari == 'k' || vari == 't') {
        par = '2';
      } else if (vari == 'c' || vari == 'l' || vari == 'u') {
        par = '3';
      } else if (vari == 'd' || vari == 'm' || vari == 'v') {
        par = '4';
      } else if (vari == 'e' || vari == 'n' || vari == 'w') {
        par = '5';
      } else if (vari == 'f' || vari == 'o' || vari == 'x') {
        par = '6';
      } else if (vari == 'g' || vari == 'p' || vari == 'y') {
        par = '7';
      } else if (vari == 'h' || vari == 'q' || vari == 'z') {
        par = '8';
      } else if (vari == 'i' || vari == 'r') {
        par = '9';
      }
      return par;
    }

    int suma = 0;
    int suma_cifrelor_data = 0;
    int suma_nume1 = 0;
    int suma_nume2 = 0;
    int suma_nume3 = 0;

    String tot = (ziua.toString() + luna.toString() + anul.toString());
    List lista = tot.split('');
    int tot1 = 0;
    for (int x = 0; x < tot.length; x++) {
      int ceva = int.parse(lista[x]);
      tot1 += ceva;
    }
    int calcul(int ceva) {
      int a = 0;
      int b = 0;
      int ceva2 = 0;
      while (ceva ~/ 10 > 0) {
        a = 0;
        suma = 0;
        ceva2 = ceva;
        while (ceva2 > 0) {
          a++;
          double altceva2 = ceva2 / 10;
          ceva2 = altceva2.toInt();
        }
        for (int x = 0; x <= a; x++) {
          b = (ceva % 10);
          double atlceva = ceva / 10;
          ceva = atlceva.toInt();
          suma = suma + b;
        }
        ceva = suma;
      }
      return ceva;
    }

    int calcul2(int ceva) {
      int oprire = 0;
      int a = 0;
      int b = 0;
      int ceva2 = 0;
      bool tren = true;
      while (ceva ~/ 10 > 0 && tren) {
        oprire += 1;
        if (oprire == 1) {
          tren = false;
        }
        a = 0;
        suma = 0;
        ceva2 = ceva;
        while (ceva2 > 0) {
          a++;
          double altceva2 = ceva2 / 10;
          ceva2 = altceva2.toInt();
        }
        for (int x = 0; x <= a; x++) {
          b = (ceva % 10);
          double atlceva = ceva / 10;
          ceva = atlceva.toInt();
          suma = suma + b;
        }
        ceva = suma;
      }
      return ceva;
    }

    int cifra_personalitati = calcul(ziua);
    int rezultatl = calcul(luna);
    int rezultata = calcul(anul);
    int lungime = tot.length;

    for (int x = 0; x < lungime; x++) {
      int papa = int.parse(tot[x]);
      suma_cifrelor_data += papa;
    }

    int cifra_destinului = (calcul2(tot1));
    int manifestare = cifra_personalitati + cifra_destinului;
    int manifestareRezultat = calcul(manifestare);
    int provocari = rezultatl + manifestareRezultat;
    int rezultatProvocari = calcul(provocari);
    int resurse = ziua + luna;
    int rezultatResurse = calcul(resurse);
    int obstacole = 0;
    if (rezultata > rezultatl) {
      obstacole = rezultata - rezultatl;
    } else {
      obstacole = rezultatl - rezultata;
    }
    int realizari = rezultatResurse + (obstacole);
    int rezultatRealizari = calcul(realizari);

    int numarul_operativ2 = 0;
    int prima_cifra_zi;
    numarul_operativ2 = 0;
    int cifre = 0;
    int numar_operativ4 = 0;
    int numar_operativ3 = 0;
    int numar = 0;
    int cantitate_1 = 0;
    int cantitate_2 = 0;
    int cantitate_3 = 0;
    int cantitate_4 = 0;
    int cantitate_5 = 0;
    int cantitate_6 = 0;
    int cantitate_7 = 0;
    int cantitate_8 = 0;
    int cantitate_9 = 0;
    int clona_cantitate = 0;
    String casuta = '';

    for (int x = 0; x < suma_cifrelor_data.toString().length; x++) {
      String cifra = suma_cifrelor_data.toString()[x];
      cifre = int.parse(cifra);
      numarul_operativ2 += cifre;
    }
    ;
    String ziua_string = ziua.toString()[0];
    prima_cifra_zi = int.parse(ziua_string);
    numar_operativ4 = 0;
    numar_operativ3 = suma_cifrelor_data - (2 * prima_cifra_zi);
    if (numar_operativ3 < 0) {
      numar_operativ3 = numar_operativ3 * (-1);
    }
    for (int x = 0; x < numar_operativ3.toString().length; x++) {
      String cifra = numar_operativ3.toString()[x];
      cifre = int.parse(cifra);
      numar_operativ4 += cifre;
    }
    List codul_numerologic_personl = [];
    void cod(int numar) {
      for (int x = 0; x < numar.toString().length; x++) {
        String cifra = numar.toString()[x];
        cifre = int.parse(cifra);
        codul_numerologic_personl.add(cifre);
      }
      Provider.of<Data>(context, listen: false)
          .schimba_lista_cnp(codul_numerologic_personl);
    }

    cod(ziua);
    cod(luna);
    cod(anul);
    cod(suma_cifrelor_data);
    cod(numarul_operativ2);
    cod(numar_operativ3);
    cod(numar_operativ4);
    for (int x = 0; x < codul_numerologic_personl.length; x++) {
      if (codul_numerologic_personl[x] == 1) {
        cantitate_1 += 1;
      }
      if (codul_numerologic_personl[x] == 2) {
        cantitate_2 += 1;
      }
      if (codul_numerologic_personl[x] == 3) {
        cantitate_3 += 1;
      }
      if (codul_numerologic_personl[x] == 4) {
        cantitate_4 += 1;
      }
      if (codul_numerologic_personl[x] == 5) {
        cantitate_5 += 1;
      }
      if (codul_numerologic_personl[x] == 6) {
        cantitate_6 += 1;
      }
      if (codul_numerologic_personl[x] == 7) {
        cantitate_7 += 1;
      }
      if (codul_numerologic_personl[x] == 8) {
        cantitate_8 += 1;
      }
      if (codul_numerologic_personl[x] == 9) {
        cantitate_9 += 1;
      }
    }

    String numere_matrice(int cantitate, int num) {
      clona_cantitate = cantitate;
      casuta = '';
      while (cantitate > 0) {
        cantitate -= 1;
        casuta += num.toString();
      }
      return casuta;
    }

    String casuta1 = numere_matrice(cantitate_1, 1);
    String casuta2 = numere_matrice(cantitate_2, 2);
    String casuta3 = numere_matrice(cantitate_3, 3);
    String casuta4 = numere_matrice(cantitate_4, 4);
    String casuta5 = numere_matrice(cantitate_5, 5);
    String casuta6 = numere_matrice(cantitate_6, 6);
    String casuta7 = numere_matrice(cantitate_7, 7);
    String casuta8 = numere_matrice(cantitate_8, 8);
    String casuta9 = numere_matrice(cantitate_9, 9);

    if (casuta1 == '') {
      casuta1 = '-';
    }
    if (casuta2 == '') {
      casuta2 = '-';
    }
    if (casuta3 == '') {
      casuta3 = '-';
    }
    if (casuta4 == '') {
      casuta4 = '-';
    }
    if (casuta5 == '') {
      casuta5 = '-';
    }
    if (casuta6 == '') {
      casuta6 = '-';
    }
    if (casuta7 == '') {
      casuta7 = '-';
    }
    if (casuta8 == '') {
      casuta8 = '-';
    }
    if (casuta9 == '') {
      casuta9 = '-';
    }

    Provider.of<Data>(context, listen: false).reset();

    Provider.of<Data>(context, listen: false).schimbatot(
      rezultatRealizari,
      rezultatResurse,
      rezultatProvocari,
      cifra_personalitati,
      rezultata,
      rezultatl,
      cifra_destinului,
      obstacole,
      manifestareRezultat,
      casuta1,
      casuta2,
      casuta3,
      casuta4,
      casuta5,
      casuta6,
      casuta7,
      casuta8,
      casuta9,
    );

    if (lungimen == 0 && lungimen1 == 0 && lungimen2 == 0) {
      finish = RichText(
          text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Ziua de nastere este ', style: knormal),
          TextSpan(text: '$ziua ', style: knormal_negru),
          TextSpan(text: 'cifra personalitatii este ', style: knormal),
          TextSpan(text: '$cifra_personalitati ', style: knormal_negru),
          TextSpan(text: 'luna este ', style: knormal),
          TextSpan(text: '$luna ', style: knormal_negru),
          TextSpan(text: 'anul este ', style: knormal),
          TextSpan(text: '$anul ', style: knormal_negru),
          TextSpan(text: 'suma cifrelor este ', style: knormal),
          TextSpan(text: '$suma_cifrelor_data ', style: knormal_negru),
          TextSpan(text: 'cifra destinului este ', style: knormal),
          TextSpan(text: '$cifra_destinului ', style: knormal_negru),
        ],
      ));

      // '\nZiua de nastere este $ziua '
      //     'cifra personalitatii este $cifra_personalitati'
      //     ' \nluna este $luna '
      //     '\nanul este $anul '
      //     '\ndata este $data suma cifrelor este '
      //     '$suma_cifrelor_data cifra destinului este '
      //     '$cifra_destinului ';
    } else if (lungimen > 0 && lungimen1 == 0 && lungimen2 == 0) {
      for (int x = 0; x < lungimen; x++) {
        String car = nume_1[x];
        int cifra = int.parse(schimba(car));
        nume1_cifre = nume1_cifre + cifra.toString();
      }

      for (int x = 0; x < lungimen; x++) {
        int para = int.parse(nume1_cifre[x]);
        suma_nume1 += para;
      }
      int nume3 = int.parse(nume1_cifre);

      prima_cifra_nume1 = (calcul(nume3)).toString();
      finish = RichText(
          text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Ziua de nastere este ', style: knormal),
          TextSpan(text: '$ziua ', style: knormal_negru),
          TextSpan(text: 'cifra personalitatii este ', style: knormal),
          TextSpan(text: '$cifra_personalitati ', style: knormal_negru),
          TextSpan(text: 'luna este ', style: knormal),
          TextSpan(text: '$luna ', style: knormal_negru),
          TextSpan(text: 'anul este ', style: knormal),
          TextSpan(text: '$anul ', style: knormal_negru),
          TextSpan(text: 'suma cifrelor este ', style: knormal),
          TextSpan(text: '$suma_cifrelor_data ', style: knormal_negru),
          TextSpan(text: 'cifra destinului este ', style: knormal),
          TextSpan(text: '$cifra_destinului ', style: knormal_negru),
          TextSpan(text: 'Primul nume ', style: knormal),
          TextSpan(text: '$primul_nume ', style: knormal_verde),
          TextSpan(text: 'scris in cifre este ', style: knormal),
          TextSpan(text: '$nume1_cifre ', style: knormal_negru),
          TextSpan(text: 'are suma cifrelor ', style: knormal),
          TextSpan(text: '$suma_nume1 ', style: knormal_negru),
          TextSpan(text: 'si redus la o cifra este ', style: knormal),
          TextSpan(text: '$prima_cifra_nume1 ', style: knormal_negru),
        ],
      ));
      // finish = '\nziua de nastere este $ziua '
      //     'cifra personalitatii este $cifra_personalitati'
      //     ' \nluna este $luna '
      //     '\nanul este $anul '
      //     '\ndata este $data suma cifrelor este '
      //     '$suma_cifrelor_data cifra destinului este '
      //     '$cifra_destinului '
      //     ' \nPrimul numele $nume_1 scris in'
      //     ' cifre este $nume1_cifre are suma cifrelor $suma_nume1 si redus la o cifra este $prima_cifra_nume1';
    } else if (lungimen > 0 && lungimen1 > 0 && lungimen2 == 0) {
      for (int x = 0; x < lungimen; x++) {
        String car = nume_1[x];
        int cifra = int.parse(schimba(car));
        nume1_cifre = nume1_cifre + cifra.toString();
      }

      for (int x = 0; x < lungimen; x++) {
        int para = int.parse(nume1_cifre[x]);
        suma_nume1 += para;
      }

      for (int x = 0; x < lungimen1; x++) {
        String car = nume_2[x];
        int cifra = int.parse(schimba(car));
        nume2_cifre = nume2_cifre + cifra.toString();
      }

      for (int x = 0; x < lungimen1; x++) {
        int para = int.parse(nume2_cifre[x]);
        suma_nume2 += para;
      }
      int nume3 = int.parse(nume1_cifre);
      int nume4 = int.parse(nume2_cifre);
      prima_cifra_nume1 = (calcul(nume3)).toString();
      prima_cifra_nume2 = (calcul(nume4)).toString();

      finish = RichText(
          text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Ziua de nastere este ', style: knormal),
          TextSpan(text: '$ziua ', style: knormal_negru),
          TextSpan(text: 'cifra personalitatii este ', style: knormal),
          TextSpan(text: '$cifra_personalitati ', style: knormal_negru),
          TextSpan(text: 'luna este ', style: knormal),
          TextSpan(text: '$luna ', style: knormal_negru),
          TextSpan(text: 'anul este ', style: knormal),
          TextSpan(text: '$anul ', style: knormal_negru),
          TextSpan(text: 'suma cifrelor este ', style: knormal),
          TextSpan(text: '$suma_cifrelor_data ', style: knormal_negru),
          TextSpan(text: 'cifra destinului este ', style: knormal),
          TextSpan(text: '$cifra_destinului ', style: knormal_negru),
          TextSpan(text: 'Primul nume ', style: knormal),
          TextSpan(text: '$primul_nume ', style: knormal_verde),
          TextSpan(text: 'scris in cifre este ', style: knormal),
          TextSpan(text: '$nume1_cifre ', style: knormal_negru),
          TextSpan(text: 'suma lor este ', style: knormal),
          TextSpan(text: '$suma_nume1 ', style: knormal_negru),
          TextSpan(text: 'si redus la o cifra este ', style: knormal),
          TextSpan(text: '$prima_cifra_nume1 ', style: knormal_negru),
          TextSpan(text: 'al doilea nume ', style: knormal),
          TextSpan(text: '$al_doilea_nume ', style: knormal_verde),
          TextSpan(text: 'scris in cifre este ', style: knormal),
          TextSpan(text: '$nume2_cifre ', style: knormal_negru),
          TextSpan(text: 'suma lor este ', style: knormal),
          TextSpan(text: '$suma_nume2 ', style: knormal_negru),
          TextSpan(text: '$nume3_cifre ', style: knormal_negru),
          TextSpan(text: 'si redus la o cifra este ', style: knormal),
          TextSpan(text: '$prima_cifra_nume2 ', style: knormal_negru),
        ],
      ));
      // finish = '\nziua de nastere este $ziua '
      //     'cifra personalitatii este $cifra_personalitati'
      //     ' \nluna este $luna '
      //     '\nanul este $anul '
      //     '\ndata este $data suma cifrelor este '
      //     '$suma_cifrelor_data cifra destinului este '
      //     '$cifra_destinului \nPrimul nume $nume_1 scris in cifre este $nume1_cifre al doilea nume $nume_2 scris in cifre este $nume2_cifre \n '
      //     '$nume1_cifre suma lor este $suma_nume1 la al doilea nume $nume_2 $nume2_cifre suma lor este $suma_nume2 $nume3_cifre suma lor este $suma_nume2'
      //     ' si redus la o cifra primul nume este $prima_cifra_nume1 al doilea este $prima_cifra_nume2 ';
    } else if (lungimen > 0 && lungimen1 > 0 && lungimen2 > 0) {
      for (int x = 0; x < lungimen; x++) {
        String car = nume_1[x];
        int cifra = int.parse(schimba(car));
        nume1_cifre = nume1_cifre + cifra.toString();
      }

      for (int x = 0; x < lungimen; x++) {
        int para = int.parse(nume1_cifre[x]);
        suma_nume1 += para;
      }

      for (int x = 0; x < lungimen1; x++) {
        String car = nume_2[x];
        int cifra = int.parse(schimba(car));
        nume2_cifre = nume2_cifre + cifra.toString();
      }

      for (int x = 0; x < lungimen1; x++) {
        int para = int.parse(nume2_cifre[x]);
        suma_nume2 += para;
      }

      for (int x = 0; x < lungimen2; x++) {
        String car = nume_3[x];
        int cifra = int.parse(schimba(car));
        nume3_cifre = nume3_cifre + cifra.toString();
      }

      for (int x = 0; x < lungimen2; x++) {
        int para = int.parse(nume3_cifre[x]);
        suma_nume3 += para;
      }

      int nume3 = int.parse(nume1_cifre);
      int nume4 = int.parse(nume2_cifre);
      int nume5 = int.parse(nume3_cifre);

      prima_cifra_nume2 = (calcul(nume4)).toString();
      prima_cifra_nume3 = (calcul(nume5)).toString();
      prima_cifra_nume1 = (calcul(nume3)).toString();

      finish = RichText(
          text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Ziua de nastere este ', style: knormal),
          TextSpan(text: '$ziua ', style: knormal_negru),
          TextSpan(text: 'cifra personalitatii este ', style: knormal),
          TextSpan(text: '$cifra_personalitati ', style: knormal_negru),
          TextSpan(text: 'luna este ', style: knormal),
          TextSpan(text: '$luna ', style: knormal_negru),
          TextSpan(text: 'anul este ', style: knormal),
          TextSpan(text: '$anul ', style: knormal_negru),
          TextSpan(text: 'suma cifrelor este ', style: knormal),
          TextSpan(text: '$suma_cifrelor_data ', style: knormal_negru),
          TextSpan(text: 'cifra destinului este ', style: knormal),
          TextSpan(text: '$cifra_destinului ', style: knormal_negru),
          TextSpan(text: 'Primul nume ', style: knormal),
          TextSpan(text: '$primul_nume ', style: knormal_verde),
          TextSpan(text: 'scris in cifre este ', style: knormal),
          TextSpan(text: '$nume1_cifre ', style: knormal_negru),
          TextSpan(text: 'are suma cifrelor ', style: knormal),
          TextSpan(text: '$suma_nume1 ', style: knormal_negru),
          TextSpan(text: 'si redus la o cifra este ', style: knormal),
          TextSpan(text: '$prima_cifra_nume1 ', style: knormal_negru),
          TextSpan(text: 'al doilea nume ', style: knormal),
          TextSpan(text: '$al_doilea_nume ', style: knormal_verde),
          TextSpan(text: 'scris in cifre este ', style: knormal),
          TextSpan(text: '$nume2_cifre ', style: knormal_negru),
          TextSpan(text: 'suma lor este ', style: knormal),
          TextSpan(text: '$suma_nume2 ', style: knormal_negru),
          TextSpan(text: 'si redus la o cifra este ', style: knormal),
          TextSpan(text: '$prima_cifra_nume2 ', style: knormal_negru),
          TextSpan(text: 'al treilea nume ', style: knormal),
          TextSpan(text: '$al_treilea_nume ', style: knormal_verde),
          TextSpan(text: 'scris in cifre este ', style: knormal),
          TextSpan(text: '$nume3_cifre ', style: knormal_negru),
          TextSpan(text: 'suma lor este ', style: knormal),
          TextSpan(text: '$suma_nume3 ', style: knormal_negru),
          TextSpan(text: 'si redus la o cifra este ', style: knormal),
          TextSpan(text: '$prima_cifra_nume3 ', style: knormal_negru),
        ],
      ));
      // finish = '\nziua de nastere este $ziua '
      //     'cifra personalitatii este $cifra_personalitati'
      //     ' \nluna este $luna '
      //     '\nanul este $anul '
      //     '\ndata este $data suma cifrelor este '
      //     '$suma_cifrelor_data cifra destinului este '
      //     '$cifra_destinului  \nPrimul nume $nume_1 scris in cifre este $nume1_cifre al doilea nume $nume_2 scris in cifre este $nume2_cifre \n '
      //     'al treilea nume $nume_3 scris in cifre este $nume3_cifre are suma '
      //     'cifrelor $nume_1 $nume1_cifre suma lor este $suma_nume1 la al doilea nume $nume_2 $nume2_cifre suma lor este $suma_nume2 si la al treilea nume $nume_3 $nume3_cifre suma lor este $suma_nume3'
      //     ' si redus la o cifra primul nume este $prima_cifra_nume1 al doilea este $prima_cifra_nume2 al treilea nume este $prima_cifra_nume3';
    }
    return finish;
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double rating1 = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffCCD8A6),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            hintText: 'Introduce feedback',
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Spuneti-va parerea';
            }
            return null;
          },
        ),
      ),
      actions: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Evalueaza aplicatia',
                  style: GoogleFonts.pacifico()
                      .copyWith(color: Colors.white, fontSize: 30)),
            ),
            RatingBar(
              itemSize: 50.0,
              initialRating: 3,
              glowColor: Colors.yellow,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: Image.asset('assets/bec3.png'),
                half: Image.asset('assets/bec2.png'),
                empty: Image.asset('assets/bec1.png'),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                rating1 = rating;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        side:
                            BorderSide(color: Colors.red.shade700, width: 4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        textStyle: TextStyle(fontSize: 15.0)),
                    child: Text('Anuleaza',
                        style: GoogleFonts.pacifico()
                            .copyWith(color: Colors.white)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xff628915),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        side: BorderSide(color: Color(0xff3F473A), width: 4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        textStyle: TextStyle(fontSize: 15.0)),
                    child: Text('Trimite',
                        style: GoogleFonts.pacifico()
                            .copyWith(color: Colors.white)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          // Get a reference to the `feedback` collection
                          final collection =
                              FirebaseFirestore.instance.collection('feedback');

                          await collection.doc().set({
                            'timestamp': FieldValue.serverTimestamp(),
                            'feedback': _controller.text,
                            'Evaluare': rating1,
                          });

                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: "Feedback trimis cu succes. O zi buna",
                            ),
                          );
                        } catch (e) {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message:
                                  "Ceva nu a mers bine. Mai incercati odata",
                            ),
                          );
                        }

                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
