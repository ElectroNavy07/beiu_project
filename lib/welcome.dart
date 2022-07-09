import 'dart:async';

import 'package:beiu_project/firebase/autentificare_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:beiu_project/constants.dart';
import 'package:beiu_project/variabile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'Data.dart';

class Welcome extends StatefulWidget {
  static const id = '/i1';

  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 300.0,
                    child: Image.asset('assets/copac_misca2.gif'),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
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
                  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                    if (user == null) {
                      Navigator.pushNamed(context, Autentificare.id);
                    } else {
                      user.reload();
                      Navigator.pushNamed(context, Variabile.id);
                    }
                  });
                },
                child: Text(
                  'Autentificare',
                  style: GoogleFonts.pacifico().copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      pause: const Duration(seconds: 1),
                      animatedTexts: [
                        TypewriterAnimatedText('',
                            cursor: '.',
                            textStyle: TextStyle(
                                fontSize: 60,
                                color: Colors.white,
                                fontFamily: 'Aller')),
                        TypewriterAnimatedText('PSIHO',
                            cursor: '',
                            speed: Duration(milliseconds: 200),
                            textStyle: TextStyle(
                                fontSize: 60,
                                color: Color(0xff3F473A),
                                fontFamily: 'Aller')),
                      ],
                    ),
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      pause: const Duration(seconds: 1),
                      animatedTexts: [
                        TypewriterAnimatedText('',
                            cursor: '',
                            textStyle: TextStyle(
                                fontSize: 60,
                                color: Colors.white,
                                fontFamily: 'Aller')),
                        TypewriterAnimatedText('',
                            cursor: '_',
                            textStyle: TextStyle(
                                fontSize: 60,
                                color: Colors.white,
                                fontFamily: 'Aller')),
                        TypewriterAnimatedText(
                          'MAESTRU',
                          cursor: '',
                          speed: Duration(milliseconds: 200),
                          textStyle: TextStyle(
                              fontSize: 60,
                              color: Color(0xff628915),
                              fontFamily: 'Aller'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
