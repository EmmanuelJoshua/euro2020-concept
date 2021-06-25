import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, this.onPressed, this.text}) : super(key: key);
  final Function? onPressed;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Container(
        width: 130,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFF84B4B),
            borderRadius: BorderRadius.circular(
              10,
            )),
        child: Center(
            child: Text(
          text!,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'HK Grotesk',
              fontSize: 17,
              fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
