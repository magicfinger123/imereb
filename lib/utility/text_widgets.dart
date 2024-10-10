import 'package:bs_educativo/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Text txtR(title,size,{weight = FontWeight.w400,maxLines = 1,textAlign = TextAlign.start,color = AppColors.txt1}) {
  return Text(title,
    style: GoogleFonts.inter(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}
Text txtB(title,size,{weight = FontWeight.w700,maxLines = 1,textAlign = TextAlign.start,color = AppColors.txt1}) {
  return Text(title,
    style: GoogleFonts.inter(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
  );
}