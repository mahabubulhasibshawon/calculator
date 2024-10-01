import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  dynamic displaytxt = 20;
  Widget CircleButton(String btnText,Color btncolor,Color txtcolor){
    return Container(
      child: SizedBox(
        width: 90,
        height: 90,
        child: ElevatedButton(onPressed: (){
          calculation(btnText);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                    'AC',
                    Colors.grey,
                    Colors.black),
                CircleButton(
                    '+/-',
                    Colors.grey,
                    Colors.black),
                CircleButton(
                    '%',
                    Colors.grey,
                    Colors.black),
                CircleButton(
                    '/',
                    Colors.amber.shade700,
                    Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                    '7',
                    Colors.grey.shade800,
                    Colors.white),
                CircleButton(
                    '8',
                    Colors.grey.shade800,
                    Colors.white),
                CircleButton(
                    '9',
                    Colors.grey.shade800,
                    Colors.white),
                CircleButton(
                    'x',
                    Colors.amber.shade700,
                    Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                    '4',
                    Colors.grey.shade800,
                    Colors.white),
                CircleButton(
                    '5',
                    Colors.grey.shade800,
                    Colors.white),
                CircleButton(
                    '6',
                    Colors.grey.shade800,
                     Colors.white),
                CircleButton(
                    '-',
                    Colors.amber.shade700,
                     Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton(
                     '1',
                     Colors.grey.shade800,
                     Colors.white),
                CircleButton(
                    '2',
                    Colors.grey.shade800,
                    Colors.white),
                CircleButton(
                    '3',
                    Colors.grey.shade800,
                     Colors.white),
                CircleButton(
                    '+',
                    Colors.amber.shade700,
Colors.white),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(34, 10, 27, 20),
                  child: SizedBox(
                    height: 80,
                    width: 198,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800,
                        ),
                        onPressed: () {},
                        child: const Text(
                          '0',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                  ),
                ),
                CircleButton(
                    '.',
                    Colors.grey.shade800,
                    Colors.white),
                SizedBox(
                  width: 27,
                ),
                CircleButton(
                    '=',
                    Colors.amber.shade700,
                    Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

}
