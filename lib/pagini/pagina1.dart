import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:beiu_project/pagini/pagina2.dart';
import 'package:google_fonts/google_fonts.dart';

class Pagina1 extends StatelessWidget {
  static const id = '/p1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Image.asset('pagina1.png')),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Aceasta aplicatie este un calculator numerologic, destinat pentru ajutarea dumneavoastra',
                textAlign: TextAlign.center,
                style: GoogleFonts.pacifico()
                    .copyWith(color: Colors.black, fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff628915),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          side:
                              BorderSide(color: Color(0xff3F473A), width: 4.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          textStyle: const TextStyle(fontSize: 20.0)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Pagina2()));
                      },
                      child: Text('Continua',
                          style: GoogleFonts.pacifico()
                              .copyWith(color: Colors.white))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
