import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Text h1(String text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 32,
  fontWeight: fw ?? FontWeight.w800,
  color: tc ?? Colors.black,
));

Text h2(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 28,
  fontWeight: fw ?? FontWeight.w700,
  color: tc ?? Colors.black,
));

Text h3(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 28,
  fontWeight: fw ?? FontWeight.w700,
  color: tc ?? Colors.black,
));

Text h4(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 24,
  fontWeight: fw ?? FontWeight.w500,
  color: tc ?? Colors.black,
));

Text h5(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 18,
  fontWeight: fw ?? FontWeight.w500,
  color: tc ?? Colors.black,
));

Text h6(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 14,
  fontWeight: fw ?? FontWeight.w400,
  color: tc ?? Colors.black,
));

Text h7(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 12,
  fontWeight: fw ?? FontWeight.w300,
  color: tc ?? Colors.black,
));

Text h8(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 10,
  fontWeight: fw ?? FontWeight.w300,
  color: tc ?? Colors.black,
));
Text h9(text, {fs, fw, tc, ta}) => Text(text, textAlign: ta ?? TextAlign.center, style: GoogleFonts.poppins(
  fontSize: fs ?? 8,
  fontWeight: fw ?? FontWeight.w500,
  color: tc ?? Colors.black,
));