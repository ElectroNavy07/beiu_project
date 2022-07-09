import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Data extends ChangeNotifier {
  bool e1 = true;
  bool e2 = true;
  bool e3 = true;
  bool deschis = true;
  RichText richText = new RichText(text: TextSpan());
  String anunt_panou = 'nu merge';
  String anunt_id = '2';
  int da = 0;
  int nu = 0;
  int numar = 1;
  int numar_documente = 4;
  List denumiri = [];
  int numar_grupa = 1;
  int numar_grupa_expand = 1;
  bool widget = true;
  String data = 'Nu exista data';
  String ora = '';
  String nume_grupa = '';
  String nume_persoana = 'dasd';
  String mesaj_grupa = 'df';
  bool merge = false;
  int persoane_da = 0;
  int persoane_total = 0;
  int index = 1;
  bool bla = true;
  List particip = [];
  List nu_particip = [];
  String nume_persoan2 = '';
  String data_grupa = '';
  String data2 = '';
  bool adevarat = true;
  bool adevarat1 = true;
  var anul_numerologic;
  String token = '';
  var coloane = [
    {'domain': '1', 'measure': 2}
  ];
  var coloane2 = [
    {'domain': '1', 'measure': 2}
  ];

  void schimba_anul_numerologic(int ziua, int luna, int anul, int ziua_curenta,
      var luna_curenta, var anul_curent) {
    if (luna_curenta > luna || luna_curenta == luna && ziua_curenta > ziua) {
      anul_numerologic = (anul_curent - anul + 1) % 9;
      if (anul_numerologic == 0) {
        anul_numerologic = 9;
      }
      notifyListeners();
    } else {
      anul_numerologic = (anul_curent - anul) % 9;
      if (anul_numerologic == 0) {
        anul_numerologic = 9;
      }
      notifyListeners();
    }
  }

  void adauga(BuildContext context, List numere) {
    coloane.clear();
    coloane2.clear();
    coloane.add({'domain': '.', 'measure': 9});
    coloane2.add({'domain': '.', 'measure': 9});
    for (int x = 1; x <= numere.length; x++) {
      coloane.add({'domain': '${numere[x - 1]}[$x]', 'measure': numere[x - 1]});
      coloane2.add({'domain': '$x', 'measure': 0});
    }
    notifyListeners();
  }

  void schimba_token(String altceva) {
    token = altceva;
    notifyListeners();
  }

  void merge12() {
    adevarat1 = true;
    notifyListeners();
  }

  void nu_merge12() {
    adevarat1 = false;
    notifyListeners();
  }

  void schimba_data1(String cevva) {
    data_grupa = cevva;
    notifyListeners();
  }

  void schimba_data2(String cecea) {
    data2 = cecea;
    notifyListeners();
  }

  void schimba_nume_persoan2(String ceva) {
    nume_persoan2 = ceva;
    notifyListeners();
  }

  void schimba_participa(List ceva321) {
    particip = ceva321;
    notifyListeners();
  }

  void schimba_nu_participa(List ceva321) {
    nu_particip = ceva321;
    notifyListeners();
  }

  void schimba_bool1() {
    merge = true;
  }

  void schimba_bool2() {
    merge = false;
  }

  void pleaca() {
    bla = false;
    notifyListeners();
  }

  bool bla1 = true;

  void pleaca1() {
    bla1 = true;
    notifyListeners();
  }

  void nu_pleaca1() {
    bla1 = false;
    notifyListeners();
  }

  void nu_pleaca() {
    bla = true;
    notifyListeners();
  }

  void schimba_index(int index1) {
    index = index1;
    notifyListeners();
  }

  void schimba_da_persoane(int ceva) {
    persoane_da = ceva;
    notifyListeners();
  }

  void schimba_total(int ceva) {
    persoane_total = ceva;
    notifyListeners();
  }

  void reset_da() {
    persoane_da = 0;
    notifyListeners();
  }

  void reset_total() {
    persoane_total = 0;
    notifyListeners();
  }

  List<Widget> lista_noua = [Text('data')];
  List<Widget> lista_noua_da = [Text('data')];
  List<Widget> lista_noua_nu = [];
  List<Widget> lista_noua_nume = [Text('data')];
  List<Widget> lista_noua_butoane = [Text('data')];
  List<Widget> lista_noua_butoane_1 = [Text('data')];
  List<Widget> lista_belea_mica = [Text('data')];

  void schimba_adevarat1() {
    adevarat = true;
    notifyListeners();
  }

  void schimba_adevarat(bool ceva123) {
    adevarat = ceva123;
    notifyListeners();
  }

  void schimba_adevarat2() {
    adevarat = false;
    notifyListeners();
  }

  void schimba_bool() {
    merge = !merge;
    notifyListeners();
  }

  void schimba_nume_belea_mica(List<Widget> belea_mica) {
    lista_belea_mica = belea_mica;
    notifyListeners();
  }

  void schimba_lista_butoane_1(List<Widget> cea_buna) {
    lista_noua_butoane_1 = cea_buna;
    notifyListeners();
  }

  void schimba_lista_butoane(List<Widget> cea_buna) {
    lista_noua_butoane = cea_buna;
    notifyListeners();
  }

  void schimba_lista_nume(List<Widget> cea_buna) {
    lista_noua_nume = cea_buna;
    notifyListeners();
  }

  void schimba_mesaj_grupa(String mesaj_nou) {
    mesaj_grupa = mesaj_nou;
    notifyListeners();
  }

  void schimba_nume_persoana(String nume) {
    nume_persoana = nume;
    notifyListeners();
  }

  void numar_definitiv(int numar) {
    numar_grupa = numar;
    notifyListeners();
  }

  void schimba_nume_grupa(String ceva) {
    nume_grupa = ceva;
    notifyListeners();
  }

  void schimba_data(String data_noua) {
    data = data_noua;
    notifyListeners();
  }

  void schimba_ora(String ora_noua) {
    ora = ora_noua;
    notifyListeners();
  }

  void schimba_bool_widget() {
    widget = false;
    notifyListeners();
  }

  void schimba_numar_expand(int numar123) {
    numar_grupa_expand = numar123;
    notifyListeners();
  }

  void schimba_numar_grupa(int numar) {
    numar_grupa = numar;
    notifyListeners();
  }

  void schimba_numar_grupa_reset() {
    numar_grupa = 1;
    notifyListeners();
  }

  void countDocuments() async {
    QuerySnapshot _myDoc =
        await FirebaseFirestore.instance.collection('grupele').get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    numar_documente = _myDocCount.length;
    notifyListeners();
  }

  void countDenumiri() async {
    denumiri.clear();
    DocumentSnapshot _myDoc = await FirebaseFirestore.instance
        .collection('anunt')
        .doc('denumiri')
        .get();
    List _myDocCount = _myDoc['denumiri'];
    denumiri = _myDocCount;
    notifyListeners();
  }

  void schimba_numar_doc(int numar_nou) {
    numar = numar_nou;
    notifyListeners();
  }

  void schimba_lista(List<Widget> cea_buna) {
    lista_noua = cea_buna;
    notifyListeners();
  }

  void schimba_lista_da(List<Widget> cea_buna) {
    lista_noua_da = cea_buna;
    notifyListeners();
  }

  void schimba_lista_nu(List<Widget> cea_buna) {
    lista_noua_nu = cea_buna;
    notifyListeners();
  }

  void inchide_deschide(bool valoare) {
    deschis = valoare;
    notifyListeners();
  }

  void schimba_da(int altceva) {
    da = altceva;
    notifyListeners();
  }

  void schimba_nu(int altceva) {
    nu = altceva;
    notifyListeners();
  }

  void schimba_anunt_id(String altceva) {
    anunt_id = altceva;
    notifyListeners();
  }

  void schimba_anunt(String altceva) {
    anunt_panou = altceva;
    notifyListeners();
  }

  void schimba(RichText ceva) {
    richText = ceva;
    notifyListeners();
  }

  List cnp = [];
  void schimba_lista_cnp(List cevae) {
    cnp = cevae;
    notifyListeners();
  }

  int rezultat_realizari = 0;
  int rezultat_resurse = 0;
  int rezultat_provocari = 0;
  int rezultat_personalitate = 0;
  int rezultat_mentalitate = 0;
  int rezultat_dorinte = 0;
  int rezultat_destin = 0;
  int rezultat_obstacole = 0;
  int rezultat_manifestare = 0;
  String numar_cantitate1 = '0';
  String numar_cantitate2 = '0';
  String numar_cantitate3 = '0';
  String numar_cantitate4 = '0';
  String numar_cantitate5 = '0';
  String numar_cantitate6 = '0';
  String numar_cantitate7 = '0';
  String numar_cantitate8 = '0';
  String numar_cantitate9 = '0';
  int max = 0;
  String spatiu1 = '';
  String spatiu2 = '';
  String spatiu3 = '';
  String spatiu4 = '';
  String spatiu5 = '';
  String spatiu6 = '';
  String spatiu7 = '';
  String spatiu8 = '';
  String spatiu9 = '';

  String poveste = 'Eroare';

  void schimba_poveste(String nou) {
    poveste = nou;
    notifyListeners();
  }

  void schimbatot(
    int realizari,
    int resurse,
    int provocari,
    int personalitate,
    int mentalitate,
    int dorinte,
    int destin,
    int obstacole,
    int manifestareRezultat,
    String cantitate1,
    String cantitate2,
    String cantitate3,
    String cantitate4,
    String cantitate5,
    String cantitate6,
    String cantitate7,
    String cantitate8,
    String cantitate9,
  ) {
    rezultat_realizari = realizari;
    rezultat_resurse = resurse;
    rezultat_provocari = provocari;
    rezultat_destin = destin;
    rezultat_dorinte = dorinte;
    rezultat_mentalitate = mentalitate;
    rezultat_personalitate = personalitate;
    rezultat_obstacole = obstacole;
    rezultat_manifestare = manifestareRezultat;
    numar_cantitate1 = cantitate1;
    numar_cantitate2 = cantitate2;
    numar_cantitate3 = cantitate3;
    numar_cantitate4 = cantitate4;
    numar_cantitate5 = cantitate5;
    numar_cantitate6 = cantitate6;
    numar_cantitate7 = cantitate7;
    numar_cantitate8 = cantitate8;
    numar_cantitate9 = cantitate9;

    notifyListeners();
  }

  void reset() {
    spatiu1 = '';
    spatiu2 = '';
    spatiu3 = '';
    spatiu4 = '';
    spatiu5 = '';
    spatiu6 = '';
    spatiu7 = '';
    spatiu8 = '';
    spatiu9 = '';
  }

  void schimba3() {
    e3 = false;
    notifyListeners();
  }

  void schimba1() {
    e1 = false;
    notifyListeners();
  }

  void schimba2() {
    e2 = false;
    notifyListeners();
  }
}
