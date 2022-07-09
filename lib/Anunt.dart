import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Data.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:beiu_project/variabile.dart';
import 'fereastra.dart';
import 'package:beiu_project/panou_comanda.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class Anunt extends StatefulWidget {
  static const id = '/a';

  @override
  State<Anunt> createState() => _AnuntState();
}

class _AnuntState extends State<Anunt> {
  String? mtoken = " ";

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  static int numer = 0;
  List participa = [];
  List nu_participa = [];
  Widget _body = CircularProgressIndicator();
  String text = '';
  List<Widget> lista_card_nume() {
    return Provider.of<Data>(context).lista_noua_nume;
  }

  List<Widget> belea_nume = [Text('')];

  @override
  void initState() {
    Provider.of<Data>(context, listen: false).nu_pleaca1();
    asta2();
    super.initState();
  }

  Future<void> asta2() async {
    await Future.delayed(const Duration(seconds: 0), () {
      for (int x = belea_nume.length;
          x <= Provider.of<Data>(context, listen: false).numar_documente;
          x++) {
        belea_nume.add(ceva1(context, x));
      }
      Provider.of<Data>(context, listen: false).schimba_lista_nume(belea_nume);
      Provider.of<Data>(context, listen: false).pleaca1();
    });
  }

  int denumire_directie = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCCD8A6),
      body: SingleChildScrollView(
        child: Center(
            child: !Provider.of<Data>(context).bla1
                ? Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      _body
                    ],
                  )
                : Center(child: colon2())),
      ),
    );
  }

  Widget colon2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 70,
        ),
        colon1(),
        SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }

  Column colon1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: lista_card_nume(),
    );
  }
}

Widget ceva1(BuildContext context, int numar) {
  final _firestore = FirebaseFirestore.instance;

  return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('grupele')
          .doc(numar.toString())
          .snapshots(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          var output = snapshot.data!.data();
          if (output == null) {
            return CircularProgressIndicator();
          } else {
            List value = output['email'];
            List value123 = output['persoane'];
            if (value.contains(FirebaseAuth.instance.currentUser!.email)) {
              getToken(context, numar);
              if (Provider.of<Data>(context).nume_persoana == 'dasd') {
                for (int x = 0; x < value.length; x++) {
                  if (value[x] == FirebaseAuth.instance.currentUser!.email) {
                    Provider.of<Data>(context, listen: false)
                        .schimba_nume_persoana(value123[x]);
                  }
                }
              } else {
                _firestore.collection('grupele').doc(numar.toString()).update({
                  'persoane': FieldValue.arrayUnion(
                      [Provider.of<Data>(context).nume_persoana])
                });
              }
              Provider.of<Data>(context, listen: false)
                  .schimba_numar_grupa(numar);
              Provider.of<Data>(context, listen: false)
                  .schimba_anunt_id(numar.toString());
              var value1 = output['anunt_grupa'];
              var data1 = output['data'];
              var vrea = output['cei_care_vor'];
              var nu_vrea = output['cei_care_nu_vor'];

              int participa = output['particip'];
              int nu_participa = output['nu_particip'];
              if (vrea == null || nu_vrea == null) {
                return CircularProgressIndicator();
              } else if (vrea
                      .contains(Provider.of<Data>(context).nume_persoana) ||
                  nu_vrea.contains(Provider.of<Data>(context).nume_persoana)) {
                Provider.of<Data>(context, listen: false).schimba_bool2();
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffCCD8A6),
                        border: Border.all(color: Colors.black, width: 4.0),
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: EdgeInsets.all(15.0),
                    child: Text('Nu exista anunturi',
                        style: GoogleFonts.montserrat()
                            .copyWith(color: Colors.black, fontSize: 50)),
                  ),
                );
              } else {
                Provider.of<Data>(context, listen: false).schimba_bool1();
                Provider.of<Data>(context, listen: false)
                    .schimba_nume_persoan2(value1);
                Provider.of<Data>(context, listen: false).schimba_data2(data1);
                if (Provider.of<Data>(context).merge) {
                  int numar2 = numar;
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffCCD8A6),
                          border: Border.all(color: Colors.black, width: 4.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text('Grupa $numar2',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat()
                                  .copyWith(color: Colors.black, fontSize: 50)),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Flexible(
                              child: Text(value1,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat().copyWith(
                                      color: Colors.black, fontSize: 50)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(data1,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat().copyWith(
                                    color: Colors.black, fontSize: 50)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            Provider.of<Data>(context).merge
                                                ? Colors.red
                                                : Colors.grey,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        side: BorderSide(
                                            color:
                                                Provider.of<Data>(context).merge
                                                    ? Colors.red.shade700
                                                    : Colors.grey.shade600,
                                            width: 4.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        textStyle: TextStyle(fontSize: 20.0)),
                                    onPressed: Provider.of<Data>(context).merge
                                        ? () {
                                            CoolAlert.show(
                                                showCancelBtn: true,
                                                context: context,
                                                type: CoolAlertType.info,
                                                title: 'Sunteti sigur ?',
                                                onConfirmBtnTap: () {
                                                  _firestore
                                                      .collection('grupele')
                                                      .doc(numar2.toString())
                                                      .update({
                                                    'nu_particip':
                                                        nu_participa + 1
                                                  });

                                                  Provider.of<Data>(context,
                                                          listen: false)
                                                      .schimba_bool2();

                                                  Provider.of<Data>(context,
                                                          listen: false)
                                                      .schimba_mesaj_grupa(
                                                          Provider.of<Data>(
                                                                  context,
                                                                  listen: false)
                                                              .nume_persoan2);
                                                  _firestore
                                                      .collection('grupele')
                                                      .doc(numar2.toString())
                                                      .update({
                                                    'cei_care_nu_vor':
                                                        FieldValue.arrayUnion([
                                                      Provider.of<Data>(context,
                                                              listen: false)
                                                          .nume_persoana
                                                    ])
                                                  });

                                                  Provider.of<Data>(context,
                                                          listen: false)
                                                      .schimba_data1(
                                                          Provider.of<Data>(
                                                                  context,
                                                                  listen: false)
                                                              .data2);

                                                  Navigator.pop(context);
                                                },
                                                onCancelBtnTap: () {
                                                  Navigator.pop(context);
                                                },
                                                confirmBtnText: 'Da',
                                                cancelBtnText: 'Nu');
                                          }
                                        : null,
                                    child: Text('Nu particip',
                                        style: GoogleFonts.pacifico()
                                            .copyWith(color: Colors.white))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            Provider.of<Data>(context).merge
                                                ? Color(0xff3F473A)
                                                : Colors.grey,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 15.0),
                                        side: BorderSide(
                                            color:
                                                Provider.of<Data>(context).merge
                                                    ? Color(0xff628915)
                                                    : Colors.grey.shade600,
                                            width: 4.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        textStyle:
                                            const TextStyle(fontSize: 20.0)),
                                    onPressed: Provider.of<Data>(context).merge
                                        ? () {
                                            CoolAlert.show(
                                                showCancelBtn: true,
                                                context: context,
                                                type: CoolAlertType.info,
                                                title: 'Sunteti sigur ?',
                                                onConfirmBtnTap: () {
                                                  _firestore
                                                      .collection('grupele')
                                                      .doc(numar2.toString())
                                                      .update({
                                                    'particip': participa + 1
                                                  });

                                                  Provider.of<Data>(context,
                                                          listen: false)
                                                      .schimba_bool2();
                                                  Provider.of<Data>(context,
                                                          listen: false)
                                                      .schimba_mesaj_grupa(
                                                          Provider.of<Data>(
                                                                  context,
                                                                  listen: false)
                                                              .nume_persoan2);
                                                  _firestore
                                                      .collection('grupele')
                                                      .doc(numar2.toString())
                                                      .update({
                                                    'cei_care_vor':
                                                        FieldValue.arrayUnion([
                                                      Provider.of<Data>(context,
                                                              listen: false)
                                                          .nume_persoana
                                                    ])
                                                  });

                                                  Provider.of<Data>(context,
                                                          listen: false)
                                                      .schimba_data1(
                                                          Provider.of<Data>(
                                                                  context,
                                                                  listen: false)
                                                              .data2);

                                                  Navigator.pop(context);
                                                },
                                                onCancelBtnTap: () {
                                                  Navigator.pop(context);
                                                },
                                                confirmBtnText: 'Da',
                                                cancelBtnText: 'Nu');
                                          }
                                        : null,
                                    child: Text('Particip',
                                        style: GoogleFonts.pacifico()
                                            .copyWith(color: Colors.white))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffCCD8A6),
                          border: Border.all(color: Colors.black, width: 4.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.all(15.0),
                      child: Text('Nu exista anunturi',
                          style: GoogleFonts.montserrat()
                              .copyWith(color: Colors.black, fontSize: 50)),
                    ),
                  );
                }
              }
            }
          }
        }
        return Text(
          '',
          style: TextStyle(fontSize: 1),
        );
      });
}

void getToken(BuildContext context, int numar) async {
  await FirebaseMessaging.instance.getToken().then((token) {
    Provider.of<Data>(context, listen: false).schimba_token(token!);
    saveToken(token, numar);
  });
}

Future<void> asta3(BuildContext context) async {
  await Future.delayed(const Duration(microseconds: 0), () {
    Provider.of<Data>(context, listen: false).schimba_bool1();
  });
}

Future<void> asta4(BuildContext context) async {
  await Future.delayed(const Duration(microseconds: 0), () {
    Provider.of<Data>(context, listen: false).schimba_bool2();
  });
}

void saveToken(String token, int numar) async {
  await FirebaseFirestore.instance
      .collection('grupele')
      .doc(numar.toString())
      .update({
    'token': FieldValue.arrayUnion([token]),
  });
}
