import 'package:cool_alert/cool_alert.dart';
import 'package:expandable_widgets/expandable_widgets.dart';

import '../../constants.dart';
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

class Nume extends StatefulWidget {
  static const String id = '/n';

  @override
  _NumeState createState() => _NumeState();
}

class _NumeState extends State<Nume> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? nume_complet;

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
                'Numele Dumneavoastra complet',
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
                  nume_complet = value;
                },
                style: GoogleFonts.poppins().copyWith(fontSize: 25),
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Introduceti-va numele complet',
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
                onPressed: () {
                  Provider.of<Data>(context, listen: false)
                      .schimba_nume_persoana(nume_complet!);
                  Navigator.pushNamed(context, Variabile.id);
                },
                child: Text('Continua',
                    style:
                        GoogleFonts.pacifico().copyWith(color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
