import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableButton extends StatelessWidget {
  final String? showText;
  final Color? color;
  final VoidCallback? onPressed;
  final double? minWidth;
  final double? height;
  ReusableButton(
      {this.color,
        required this.onPressed,
        this.showText,
        this.height,
        this.minWidth});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: minWidth,
            height: height,
            child: Text(
              showText!,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )),
            )),
      ),
    );
  }
}
