import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Data.dart';
import 'package:provider/provider.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:beiu_project/Anunt.dart';
import 'package:beiu_project/panou_comanda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beiu_project/variabile.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class Panou_comanda extends StatefulWidget {
  static const id = '/pc';

  @override
  State<Panou_comanda> createState() => _Panou_comandaState();
}

class _Panou_comandaState extends State<Panou_comanda> {
  final _firestore = FirebaseFirestore.instance;
  String anunt = 'eroare';
  String anunt_grupa = 'Anunt gol';
  int numar_grupa = 1;
  String text = '';
  int cei_participa = 0;
  int cei_total = 0;
  final _auth = FirebaseAuth.instance;

  List<Widget> lista_card() {
    return Provider.of<Data>(context).lista_noua;
  }

  List<Widget> lista_card_da() {
    return Provider.of<Data>(context).lista_noua_da;
  }

  List<Widget> lista_card_nu() {
    return Provider.of<Data>(context).lista_noua_nu;
  }

  List<Widget> belea = [];
  List<Widget> belea_da = [];
  List<Widget> belea_nu = [];

  List<Widget> belea_da1 = [Text('data')];
  List<Widget> belea_nu1 = [];

  List<Widget> lista_card_butoane() {
    return Provider.of<Data>(context).lista_noua_butoane;
  }

  List<Widget> lista_belea_mica_card() {
    return Provider.of<Data>(context).lista_belea_mica;
  }

  List<Widget> lista_card_butoane_1() {
    return Provider.of<Data>(context).lista_noua_butoane_1;
  }

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Widget _body = CircularProgressIndicator();
  List<Widget> belea_butoane = [];
  List<Widget> belea_butoane_1 = [];
  List belea_mica = [];
  bool e3 = true;
  bool? adevarat;
  List tokere = [];
  @override
  void initState() {
    Provider.of<Data>(context, listen: false).nu_pleaca();
    asta();

    requestPermission();

    loadFCM();

    listenFCM();

    super.initState();
  }

  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCCD8A6),
      body: SingleChildScrollView(
          child: Center(
              child: Provider.of<Data>(context).bla
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                        _body
                      ],
                    )
                  : _colon())),
    );
  }

  Future<void> asta() async {
    await Future.delayed(const Duration(seconds: 2), () {
      belea_butoane_1.clear();
      belea_mica.clear();
      for (int x = belea_mica.length;
          x < Provider.of<Data>(context, listen: false).denumiri.length;
          x++) {
        belea_mica.add(Provider.of<Data>(context, listen: false).denumiri[x]);
      }

      for (int x = belea_butoane_1.length + 1;
          x <= Provider.of<Data>(context, listen: false).numar_documente;
          x++) {
        belea_butoane_1.add(
            ceva1(context, ceva(context, x), belea_mica[x - 1].toString()));
      }

      Provider.of<Data>(context, listen: false)
          .schimba_lista_butoane(belea_butoane);
      Provider.of<Data>(context, listen: false)
          .schimba_lista_butoane_1(belea_butoane_1);
      Provider.of<Data>(context, listen: false).pleaca();
    });
  }

  Widget _colon() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffCCD8A6),
              border: Border.all(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: Expandable(
                backgroundColor: Color(0xffCCD8A6),
                clickable: Clickable.firstChildOnly,
                firstChild: Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Text(
                          ' Grupa ',
                          style: GoogleFonts.montserrat()
                              .copyWith(color: Colors.black, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          belea_mica[
                              Provider.of<Data>(context).numar_grupa_expand -
                                  1],
                          style: GoogleFonts.montserrat()
                              .copyWith(color: Color(0xff628915), fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                secondChild: Column(
                  children: [
                    colon2(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffCCD8A6),
                border: Border.all(color: Colors.black, width: 4.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: Expandable(
                  backgroundColor: Color(0xffCCD8A6),
                  firstChild: Text('Persoane',
                      style: GoogleFonts.montserrat()
                          .copyWith(color: Colors.black, fontSize: 30)),
                  secondChild: lista_persoane_expanded(context)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      side: BorderSide(color: Color(0xff3F473A), width: 4.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      textStyle: TextStyle(fontSize: 15.0)),
                  onPressed: () {
                    CoolAlert.show(
                        title: 'Selecteaza data',
                        context: context,
                        type: CoolAlertType.info,
                        widget: DateTimePicker(
                          type: DateTimePickerType.dateTime,
                          dateMask: 'dd/MM/yyyy',
                          initialValue: DateTime.now().toString(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Data',
                          timeLabelText: "Ora",
                          onChanged: (val) {
                            Provider.of<Data>(context, listen: false)
                                .schimba_data(val);
                          },
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                        onConfirmBtnTap: () {
                          Navigator.pop(context);
                        });
                  },
                  child: Text(
                      '  Data : ' +
                          Provider.of<Data>(context, listen: false)
                              .data
                              .toString(),
                      style: GoogleFonts.montserrat()
                          .copyWith(color: Color(0xff628915), fontSize: 30))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              style: GoogleFonts.montserrat()
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w400),
              onChanged: (String value) {
                anunt_grupa = value;
                if (value != null) {
                  e3 = false;
                }
                if (value == '') {
                  e3 = true;
                }
              },
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  prefixIcon: const Icon(Icons.wechat_outlined),
                  hintText: 'Anunt',
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: !e3 ? Color(0xff628915) : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                side: BorderSide(
                    color: !e3 ? Color(0xff3F473A) : Colors.grey.shade600,
                    width: 4.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                textStyle: const TextStyle(fontSize: 20.0)),
            onPressed: !e3
                ? () async {
                    Provider.of<Data>(context, listen: false)
                        .schimba_adevarat2();
                    try {
                      _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update({'anunt_grupa': anunt_grupa});
                      _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update({
                        'data': Provider.of<Data>(context, listen: false).data
                      });

                      await _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update({'cei_care_vor': FieldValue.delete()});
                      await _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update({'cei_care_nu_vor': FieldValue.delete()});

                      await _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update({'cei_care_vor': FieldValue.arrayUnion([])});
                      await _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update(
                              {'cei_care_nu_vor': FieldValue.arrayUnion([])});
                      _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update({'nu_particip': 0});
                      _firestore
                          .collection('grupele')
                          .doc(numar_grupa.toString())
                          .update({'particip': 0});
                      Provider.of<Data>(context, listen: false)
                          .schimba_adevarat1();
                      for (int x = 0; x < tokere.length; x++) {
                        sendPushMessage(
                            tokere[x],
                            anunt_grupa +
                                '  ' +
                                Provider.of<Data>(context, listen: false).data,
                            'Grupa ' + numar_grupa.toString());
                      }
                      showTopSnackBar(
                        context,
                        CustomSnackBar.success(
                          message: "Mesaj trimis cu succes. O zi buna",
                        ),
                      );
                    } catch (e) {
                      showTopSnackBar(
                        context,
                        CustomSnackBar.error(
                          message: "Eroare. Mesajul nu a fost trimis",
                        ),
                      );
                    }
                  }
                : null,
            child: Text(
              'Adauga',
              style: GoogleFonts.montserrat().copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffCCD8A6),
                border: Border.all(color: Colors.black, width: 4.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              child: Expandable(
                backgroundColor: Color(0xffCCD8A6),
                clickable: Clickable.firstChildOnly,
                firstChild: Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Grupa ' +
                              belea_mica[Provider.of<Data>(context)
                                      .numar_grupa_expand -
                                  1],
                          style: GoogleFonts.montserrat()
                              .copyWith(color: Colors.black, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Row(
                          children: [
                            lista_persoane_care_vor_numar(context),
                            Text(
                              '/',
                              style: GoogleFonts.montserrat()
                                  .copyWith(color: Colors.black, fontSize: 30),
                            ),
                            lista_persoane_expanded_numar(context)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                secondChild: Column(
                  children: [
                    anunt_grupa_expand(context),
                    lista_persoane_care_vor(context),
                    lista_persoane_care_nu_vor(context),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget ceva1(BuildContext context, Widget ceva2, String text) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(text,
              style: GoogleFonts.montserrat()
                  .copyWith(color: Colors.black, fontSize: 30),
              textAlign: TextAlign.center),
        ),
        Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.black, width: 2.0))),
            child: ceva2)
      ],
    );
  }

  Widget ceva(BuildContext context, int numar) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextButton(
            onLongPress: () {
              CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  widget: TextField(
                    style: GoogleFonts.montserrat()
                        .copyWith(fontSize: 30, fontWeight: FontWeight.w400),
                    onChanged: (String value) {
                      _firestore.collection('anunt').doc('denumiri').update({
                        'denumiri': FieldValue.arrayUnion([value])
                      });
                    },
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Denumire',
                        filled: true,
                        fillColor: Colors.grey[200]),
                  ),
                  onConfirmBtnTap: () {
                    Navigator.pop(context);
                    print(belea_mica);
                  });
            },
            child: Text('',
                style: GoogleFonts.montserrat()
                    .copyWith(color: Colors.black, fontSize: 30)),
            onPressed: () {
              numar_grupa = numar;

              Provider.of<Data>(context, listen: false)
                  .schimba_numar_expand(numar_grupa);
              Provider.of<Data>(context, listen: false).schimba_bool_widget();
            },
          ),
        ),
      ],
    );
  }

  Widget lista_persoane_expanded(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('grupele')
          .doc(numar_grupa.toString())
          .snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
        if (snapshot.hasData) {
          var output = snapshot.data!.data();
          List value = output!['persoane'];
          List value123 = output!['token'];
          belea.clear();
          tokere.clear();
          tokere = value123;
          for (int x = belea.length; x < value.length; x++) {
            belea.add(Container(
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black, width: 2.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(value[x],
                          style: GoogleFonts.montserrat()
                              .copyWith(color: Colors.black, fontSize: 30)),
                    ),
                  ),
                ],
              ),
            ));
          }
          Provider.of<Data>(context, listen: false).schimba_lista(belea);
          return colon();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget lista_persoane_expanded_numar(BuildContext context) {
    if (Provider.of<Data>(context).adevarat) {
      return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('grupele')
            .doc(numar_grupa.toString())
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            var output = snapshot.data!.data();
            List value = output!['persoane'];
            cei_total = 0;
            for (int x = cei_total; x < value.length; x++) {
              cei_total++;
            }
            return colon_numar();
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    } else {
      return _body;
    }
  }

  Widget anunt_grupa_expand(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('grupele')
          .doc(numar_grupa.toString())
          .snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
        if (snapshot.hasData) {
          var output = snapshot.data!.data();
          if (output == null) {
            return Text('Eroare');
          } else {
            String value = output!['anunt_grupa'];
            String value1 = output['data'];
            return sfara_in_tara(value, value1);
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget lista_persoane_care_vor(BuildContext context) {
    if (Provider.of<Data>(context).adevarat) {
      return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('grupele')
            .doc(numar_grupa.toString())
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            var output = snapshot.data!.data();
            if (output == null) {
              return Text('Eroare');
            } else {
              var value = output!['cei_care_vor'];
              belea_da.clear();
              cei_participa = 0;
              for (int x = belea_da.length; x < value.length; x++) {
                cei_participa++;
                belea_da.add(Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border(
                          top: BorderSide(color: Colors.black, width: 2.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(value[x],
                              style: GoogleFonts.montserrat()
                                  .copyWith(color: Colors.black, fontSize: 30)),
                        ),
                      ),
                    ],
                  ),
                ));
              }
              Provider.of<Data>(context, listen: false)
                  .schimba_lista_da(belea_da);
              return colon_da();
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    } else {
      return _body;
    }
  }

  Widget lista_persoane_care_vor_numar(BuildContext context) {
    if (Provider.of<Data>(context).adevarat) {
      return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('grupele')
            .doc(numar_grupa.toString())
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (!snapshot.hasData) {
            return Text('Eroare');
          }
          if (snapshot.hasData) {
            var output = snapshot.data!.data();
            if (output == null) {
              return Text('Eroare');
            } else {
              var value = output['cei_care_vor'];

              if (!value.isEmpty) {
                cei_participa = 0;
                for (int x = cei_participa; x < value.length; x++) {
                  cei_participa++;
                }
              }

              return colon_da_numar();
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    } else {
      return _body;
    }
  }

  Widget lista_persoane_care_nu_vor(BuildContext context) {
    if (Provider.of<Data>(context).adevarat) {
      return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('grupele')
              .doc(numar_grupa.toString())
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');
            if (!snapshot.hasData) {
              return _body;
            }
            if (snapshot.hasData) {
              var output = snapshot.data!.data();
              if (output == null) {
                return Text('Eroare');
              } else {
                var value = output!['cei_care_nu_vor'];
                belea_nu.clear();
                for (int x = belea_nu.length; x < value.length; x++) {
                  belea_nu.add(Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border(
                            top: BorderSide(color: Colors.black, width: 2.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(value[x],
                                style: GoogleFonts.montserrat().copyWith(
                                    color: Colors.black, fontSize: 30)),
                          ),
                        ),
                      ],
                    ),
                  ));
                }
                Provider.of<Data>(context, listen: false)
                    .schimba_lista_nu(belea_nu);
                return colon_nu();
              }
            }
            return const Center(child: CircularProgressIndicator());
          });
    } else {
      return _body;
    }
  }

  Column colon() {
    return Column(
      children: lista_card(),
    );
  }

  Column colon1() {
    return Column(
      children: lista_card_butoane(),
    );
  }

  Column colon2() {
    return Column(
      children: lista_card_butoane_1(),
    );
  }

  Text colon_numar() {
    return Text(cei_total.toString(),
        style: GoogleFonts.montserrat()
            .copyWith(color: Colors.black, fontSize: 30));
  }

  Column sfara_in_tara(String anunt, String data) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Flexible(
            child: Text(
              anunt,
              style: GoogleFonts.montserrat()
                  .copyWith(color: Colors.black, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(data,
              style: GoogleFonts.montserrat()
                  .copyWith(color: Colors.black, fontSize: 30),
              textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Column colon_da() {
    return Column(
      children: lista_card_da(),
    );
  }

  Text colon_da_numar() {
    return Text(cei_participa.toString(),
        style: GoogleFonts.montserrat()
            .copyWith(color: Colors.black, fontSize: 30));
  }

  Column colon_nu() {
    return Column(children: lista_card_nu());
  }

  void sendPushMessage(String token, String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA-n2A0vE:APA91bGPY8gk9vlBg92buUtowqkNtthPG5n3orcaATvi_'
                  'lR6bcZoT6cNJYltay78PkwS2GFiDazH45v6okM7EACcEl-3gAnV--0skpWpsvQfobUwKtxPi-YUZ1_BTGsvMh4IxAYnvAjG',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'body': body, 'title': title},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: '@drawable/ic_stat_copac_bec_succecs_1',
            ),
          ),
        );
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }
}
