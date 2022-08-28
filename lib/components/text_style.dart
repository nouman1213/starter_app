import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget normalText({required String text, Color? color, required double size}) {
  return Text(
    text,
    style: GoogleFonts.quattrocento(color: color, fontSize: size),
  );
}

Widget headingText({required String text, Color? color, required double size}) {
  return Text(
    text,
    style: GoogleFonts.quattrocento(
        color: color, fontSize: size, fontWeight: FontWeight.bold),
  );
}
