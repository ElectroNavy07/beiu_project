import 'package:beiu_project/firebase/Nume.dart';
import 'package:beiu_project/pagini/pagina1.dart';
import 'package:cool_alert/cool_alert.dart';

import '../constants.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beiu_project/variabile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:beiu_project/Data.dart';
import 'package:beiu_project/Anunt.dart';
import 'package:beiu_project/panou_comanda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:beiu_project/pagini/pagina1.dart';

class Autentificare extends StatefulWidget {
  static const String id = '/l';

  @override
  _AutentificareState createState() => _AutentificareState();
}

class _AutentificareState extends State<Autentificare> {
  static DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String? email;
  String password = '123456';
  bool showSpinner = false;
  String? Id;
  String? model;
  String? parola;
  int numar = 0;
  int numar_grupa = 1;
  int limita1 = 2;
  bool on = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Info();
  }

  Future<void> Info() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      Id = androidInfo.androidId;
      model = androidInfo.model;
      parola = '$Id+$model';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      Id = iosInfo.systemName;
      model = iosInfo.model;
      parola = '$Id+$model';
    } else if (Platform.isWindows) {
      WindowsDeviceInfo windowsDeviceInfo = await deviceInfoPlugin.windowsInfo;
      Id = windowsDeviceInfo.computerName;
      model = windowsDeviceInfo.numberOfCores.toString();
      parola = '$Id+$model';
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo macOsDeviceInfo = await deviceInfoPlugin.macOsInfo;
      Id = macOsDeviceInfo.computerName;
      model = macOsDeviceInfo.systemGUID;
      parola = '$Id+$model';
    } else if (Platform.isLinux) {
      LinuxDeviceInfo linuxDeviceInfo = await deviceInfoPlugin.linuxInfo;
      Id = linuxDeviceInfo.variantId;
      model = linuxDeviceInfo.buildId;
      parola = '$Id+$model';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/copac_misca2.gif'),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Bine ai venit',
                overflow: TextOverflow.fade,
                style: GoogleFonts.pacifico()
                    .copyWith(fontSize: 50, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                style: GoogleFonts.poppins().copyWith(fontSize: 25),
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Introduce email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff628915),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    side: BorderSide(color: Color(0xff3F473A), width: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    textStyle: const TextStyle(fontSize: 20.0)),
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email!, password: password);

                    if (user != null) {
                      await _auth.currentUser?.updatePassword(parola!);
                      if (_auth.currentUser?.email ==
                              'dorina.ionita@ymail.com' ||
                          _auth.currentUser!.email == 'c3vqwea43f@gmail.com') {
                        Navigator.pushNamed(context, Variabile.id);
                      } else {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Pagina1()));
                      }
                    } else {
                      print('ceva');
                    }
                  } catch (e) {
                    print('problema jos');
                    print(e);
                    try {
                      final user1 = await _auth.signInWithEmailAndPassword(
                          email: email!, password: parola!);
                      if (user1 != null) {
                        if (_auth.currentUser?.email ==
                                'dorina.ionita@ymail.com' ||
                            _auth.currentUser?.email == 'ceva@gmail.com') {
                          Navigator.pushNamed(context, Variabile.id);
                        } else {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Pagina1()));
                        }
                      }
                    } catch (e1) {
                      print('problema sus');
                      print(e1);
                      CoolAlert.show(
                          context: context,
                          type: CoolAlertType.error,
                          title: 'Eroare',
                          text: 'Nu sunteti in baza de date');
                    }
                  }
                },
                child: Text('Autentificare',
                    style:
                        GoogleFonts.pacifico().copyWith(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
