import 'package:beiu_project/fereastra.dart';
import 'package:beiu_project/firebase/autentificare_widget.dart';
import 'package:beiu_project/pagini/pagina3.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'variabile.dart';
import 'package:provider/provider.dart';
import 'Data.dart';
import 'package:beiu_project/variabile.dart';
import 'package:beiu_project/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'panou_comanda.dart';
import 'package:beiu_project/Anunt.dart';
import 'package:beiu_project/firebase/Nume.dart';
import 'package:beiu_project/pagini/pagina1.dart';
import 'package:beiu_project/pagini/pagina2.dart';
import 'package:beiu_project/pagini/pagina3.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runZonedGuarded(() {
    runApp(ChangeNotifierProvider<Data>(
        create: (context) => Data(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Welcome.id,
          routes: {
            Welcome.id: (BuildContext context) => Welcome(),
            Autentificare.id: (BuildContext context) => Autentificare(),
            Variabile.id: (BuildContext context) => Variabile(),
            Fereastra.id: (BuildContext context) => Fereastra(),
            Panou_comanda.id: (BuildContext context) => Panou_comanda(),
            Anunt.id: (BuildContext context) => Anunt(),
            Nume.id: (BuildContext context) => Nume(),
            Pagina1.id: (BuildContext context) => Pagina1(),
            Pagina2.id: (BuildContext context) => Pagina2(),
            Pagina3.id: (BuildContext context) => Pagina3(),
          },
        )));
  }, (dynamic error, dynamic stack) {
    developer.log("Something went wrong!", error: error, stackTrace: stack);
  });
}
