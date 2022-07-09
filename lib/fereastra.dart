import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Data.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
import 'package:iconsax/iconsax.dart';
import 'package:beiu_project/Anunt.dart';
import 'package:beiu_project/firebase/Nume.dart';
import 'package:beiu_project/panou_comanda.dart';
import 'package:page_transition/page_transition.dart';

import 'package:d_chart/d_chart.dart';

class Fereastra extends StatefulWidget {
  static const id = '/f';

  @override
  State<Fereastra> createState() => _FereastraState();
}

class _FereastraState extends State<Fereastra> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  int denumire_directie = 0;
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffCCD8A6),
                          border: Border.all(color: Colors.black, width: 4.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.symmetric(
                              inside: BorderSide(
                                  width: 3, color: Color(0xff628915))),
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Iconsax.weight_1,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Obstacole ',
                                            style: GoogleFonts.pacifico()
                                                .copyWith(
                                                    fontSize: 30,
                                                    color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_obstacole
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.assignment_turned_in_outlined,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Realizari ',
                                            style: GoogleFonts.pacifico()
                                                .copyWith(
                                                    fontSize: 40,
                                                    color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_realizari
                                              .toString()
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Center(
                                  child: Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Iconsax.shield,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Provocari ',
                                              style: GoogleFonts.pacifico()
                                                  .copyWith(
                                                      fontSize: 40,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_provocari
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Center(
                                  child: Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.agriculture_outlined,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Resurse ',
                                              style: GoogleFonts.pacifico()
                                                  .copyWith(
                                                      fontSize: 40,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_resurse
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Center(
                                  child: Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.all_inclusive_rounded,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Destin ',
                                              style: GoogleFonts.pacifico()
                                                  .copyWith(
                                                      fontSize: 40,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_destin
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Center(
                                  child: Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.alt_route_rounded,
                                            size: 40,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Personalitate ',
                                              style: GoogleFonts.pacifico()
                                                  .copyWith(
                                                      fontSize: 40,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_personalitate
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.analytics_outlined,
                                          size: 40,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Manifestare ',
                                            style: GoogleFonts.pacifico()
                                                .copyWith(
                                                    fontSize: 40,
                                                    color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_manifestare
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Center(
                                  child: Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.auto_awesome,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Dorinte ',
                                              style: GoogleFonts.pacifico()
                                                  .copyWith(
                                                      fontSize: 40,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_dorinte
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Center(
                                  child: Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.auto_stories_outlined,
                                            size: 40,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Mentalitate ',
                                              style: GoogleFonts.pacifico()
                                                  .copyWith(
                                                      fontSize: 40,
                                                      color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          Provider.of<Data>(context)
                                              .rezultat_mentalitate
                                              .toString(),
                                          style: GoogleFonts.pacifico()
                                              .copyWith(
                                                  fontSize: 40,
                                                  color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Color(0xff628915)),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(Provider.of<Data>(context).cnp.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat()
                              .copyWith(color: Colors.black, fontSize: 30)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffCCD8A6),
                      border: Border.all(color: Colors.black, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                          inside:
                              BorderSide(width: 3.5, color: Color(0xff628915))),
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate1,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate4,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate7,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate2,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate5,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate8,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate3,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate6,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                      Provider.of<Data>(context)
                                          .numar_cantitate9,
                                      style: GoogleFonts.pacifico().copyWith(
                                          fontSize: 40, color: Colors.black)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xffCCD8A6),
                        border: Border.all(color: Colors.black, width: 4.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Provider.of<Data>(context).richText),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Color(0xff628915)),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          'Anul astral: ' +
                              Provider.of<Data>(context)
                                  .anul_numerologic
                                  .toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat()
                              .copyWith(color: Colors.black, fontSize: 30)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 500,
                    width: 500,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xffCCD8A6),
                      border: Border.all(color: Colors.black, width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Stack(alignment: Alignment.center, children: [
                      DChartBar(
                        data: [
                          {
                            'id': 'Bar',
                            'data': Provider.of<Data>(context).coloane,
                          },
                        ],
                        minimumPaddingBetweenLabel: 1,
                        measureLabelFontSize: 15,
                        domainLabelFontSize: 15,
                        domainLabelPaddingToAxisLine: 20,
                        axisLineTick: 3,
                        axisLinePointTick: 3,
                        axisLinePointWidth: 10,
                        axisLineColor: Colors.green,
                        measureLabelPaddingToAxisLine: 16,
                        barColor: (barData, index, id) => Colors.green,
                        showMeasureLine: true,
                      ),
                      DChartBar(
                        data: [
                          {
                            'id': 'Bar',
                            'data': Provider.of<Data>(context).coloane2,
                          },
                        ],
                        minimumPaddingBetweenLabel: 1,
                        measureLabelFontSize: 2,
                        domainLabelFontSize: 0,
                        domainLabelPaddingToAxisLine: 0,
                        axisLineTick: 0,
                        axisLinePointTick: 0,
                        axisLinePointWidth: 0,
                        axisLineColor: Colors.green,
                        measureLabelPaddingToAxisLine: 24,
                        barColor: (barData, index, id) => Color(0xffCCD8A6),
                        showMeasureLine: false,
                        showBarValue: false,
                        showDomainLine: false,
                        barValueColor: Color(0xffCCD8A6),
                        borderColor: Color(0xffCCD8A6),
                        xAxisTitleFontSize: 1,
                        barValueFontSize: 1,
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int schimba(BuildContext context) {
  int size = 0;
  if (MediaQuery.of(context).size.width > 400) {
    size = 20;
    return size;
  } else {
    size = 15;
  }
  return size;
}

class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.3337250, size.height);
    path0.lineTo(size.width * 0.3333333, size.height * 0.6666667);
    path0.lineTo(0, size.height * 0.6663333);
    path0.lineTo(size.width * 0.3336667, size.height * 0.6680000);
    path0.lineTo(size.width * 0.3335000, size.height * 0.3333333);
    path0.lineTo(0, size.height * 0.3326667);
    path0.lineTo(size.width * 0.3340000, size.height * 0.3330000);
    path0.lineTo(size.width * 0.3340000, 0);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6658333, 0);
    path0.lineTo(size.width * 0.6666667, size.height * 0.3333333);
    path0.lineTo(size.width * 0.3341667, size.height * 0.3333333);
    path0.lineTo(size.width, size.height * 0.3350000);
    path0.lineTo(size.width * 0.6665250, size.height * 0.3336833);
    path0.lineTo(size.width * 0.6670833, size.height * 0.6666667);
    path0.lineTo(size.width * 0.3337500, size.height * 0.6666667);
    path0.lineTo(size.width, size.height * 0.6653333);
    path0.lineTo(size.width * 0.6670000, size.height * 0.6671000);
    path0.lineTo(size.width * 0.6675000, size.height);
    path0.lineTo(size.width * 0.3333333, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width * 0.6658917, 0);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.5010000, 0);
    path0.lineTo(size.width * 0.4998750, size.height * 0.1262500);
    path0.lineTo(size.width * 0.6250000, size.height * 0.2475000);
    path0.lineTo(size.width * 0.6889250, size.height * 0.5018250);
    path0.lineTo(size.width * 0.6250000, size.height * 0.7500000);
    path0.lineTo(size.width * 0.5000000, size.height * 0.8750000);
    path0.lineTo(size.width * 0.3737500, size.height * 0.7500000);
    path0.lineTo(size.width * 0.3125000, size.height * 0.4975000);
    path0.lineTo(size.width * 0.3737500, size.height * 0.2500000);
    path0.lineTo(size.width * 0.4996000, size.height * 0.1275250);
    path0.lineTo(size.width * 0.5001750, size.height * 0.3209250);
    path0.lineTo(size.width * 0.5612500, size.height * 0.3750000);
    path0.lineTo(size.width * 0.6248000, size.height * 0.2475500);
    path0.lineTo(size.width * 0.5611125, size.height * 0.3750000);
    path0.lineTo(size.width * 0.5873625, size.height * 0.4988750);
    path0.lineTo(size.width * 0.6892125, size.height * 0.5017750);
    path0.lineTo(size.width * 0.5873250, size.height * 0.4986000);
    path0.lineTo(size.width * 0.5625000, size.height * 0.6250000);
    path0.lineTo(size.width * 0.6254625, size.height * 0.7494500);
    path0.lineTo(size.width * 0.5628000, size.height * 0.6244500);
    path0.lineTo(size.width * 0.5003250, size.height * 0.6780250);
    path0.lineTo(size.width * 0.4361000, size.height * 0.6250000);
    path0.lineTo(size.width * 0.3740875, size.height * 0.7494750);
    path0.lineTo(size.width * 0.4359500, size.height * 0.6235000);
    path0.lineTo(size.width * 0.4125000, size.height * 0.5000000);
    path0.lineTo(size.width * 0.3130375, size.height * 0.4986000);
    path0.lineTo(size.width * 0.4130250, size.height * 0.5002000);
    path0.lineTo(size.width * 0.4365500, size.height * 0.3750000);
    path0.lineTo(size.width * 0.4999375, size.height * 0.3211000);
    path0.lineTo(size.width * 0.4990875, size.height * 0.1264750);
    path0.lineTo(size.width * 0.6249125, size.height * 0.2483750);
    path0.lineTo(size.width, size.height * 0.2500000);
    path0.lineTo(size.width, size.height * 0.5008750);
    path0.lineTo(size.width * 0.6894750, size.height * 0.5017000);
    path0.lineTo(size.width, size.height * 0.5015750);
    path0.lineTo(size.width, size.height * 0.7508250);
    path0.lineTo(size.width * 0.6257125, size.height * 0.7508500);
    path0.lineTo(size.width, size.height * 0.7523500);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width * 0.5003875, size.height);
    path0.lineTo(size.width * 0.5000125, size.height * 0.8756000);
    path0.lineTo(size.width * 0.5005000, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.7510000);
    path0.lineTo(size.width * 0.3727500, size.height * 0.7515000);
    path0.lineTo(0, size.height * 0.7515000);
    path0.lineTo(0, size.height * 0.4985000);
    path0.lineTo(size.width * 0.3125000, size.height * 0.4980000);
    path0.lineTo(0, size.height * 0.5015000);
    path0.lineTo(0, size.height * 0.2460000);
    path0.lineTo(size.width * 0.3745000, size.height * 0.2505000);
    path0.lineTo(size.width * 0.4370000, size.height * 0.3740000);
    path0.lineTo(size.width * 0.4128375, size.height * 0.4993000);
    path0.lineTo(size.width * 0.4365500, size.height * 0.6235000);
    path0.lineTo(size.width * 0.4997625, size.height * 0.6777750);
    path0.lineTo(size.width * 0.5000000, size.height * 0.8730500);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
