import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:beiu_project/pagini/pagina3.dart';
import 'package:google_fonts/google_fonts.dart';

class Pagina2 extends StatelessWidget {
  static const id = '/p2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Image.asset('pagina2.png')),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Cu un design simplist,minimalist si usor de perceput',
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
                        side: BorderSide(color: Color(0xff3F473A), width: 4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        textStyle: const TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Pagina3()));
                    },
                    child: Text('Continua',
                        style: GoogleFonts.pacifico()
                            .copyWith(color: Colors.white))),
              )
            ],
          )
        ],
      ),
    );
  }
}
