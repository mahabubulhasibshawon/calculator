import 'package:flutter/material.dart';
import '../pages/calculator_page.dart';

class CircleButton extends StatelessWidget {
  final String btnText;
  final Color btncolor;
  final Color txtcolor;
  const CircleButton({super.key, required this.btnText, required this.btncolor, required this.txtcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 90,
        height: 90,
        child: ElevatedButton(onPressed: (){
          // calculation(btnText);
        },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: btncolor
          ),
          child: Text(
          btnText,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: txtcolor
          ),
        ),
        ),
      ),
    );
  }

}
