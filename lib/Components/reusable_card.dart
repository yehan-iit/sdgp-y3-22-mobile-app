import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reusable_Card extends StatelessWidget {
  final Widget? cardchild;
  final onpressed;
  Reusable_Card({this.cardchild, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              // boxShadow: [
              //   BoxShadow(
              //     blurRadius: 10,
              //     color: Colors.black.withOpacity(.2),
              //   )
              // ]
    ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 7),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            onPressed: onpressed,
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // This makes the button square
              ),
              // Additional styling as needed
            ),
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
    child: cardchild!,

          ),
        ));
  }
}
