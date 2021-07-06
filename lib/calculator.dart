import 'package:Calculator/touchpad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}



class _calculatorState extends State<calculator> {
  Color themebutton = Colors.black54;
  Color buttonpadcolor = Colors.grey.shade200;
  Color textcolor = Colors.black.withOpacity(0.6);
  Color liveeqcolor = Colors.black45;
  String liveequation = '';
  String Result = '';

  // States
  void updatestr(String text)
  {
    setState(() {
      if(text == 'x') text = '*';
      if(text == '÷') text = '/';
      liveequation += text;
    });
  }
  void cleareverything(String txt)
  {
    setState(() {
      liveequation = '';
      Result = '';
    });
  }
  void removelastchar(String text)
  {
    if(liveequation != null && liveequation.length>0)
      {
        setState(() {
          liveequation = liveequation.substring(0,liveequation.length-1);
        });
      }
  }

void calculate(String txt)
  {
    Parser p = Parser();
    Expression exp = p.parse(liveequation);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      Result = eval.toString();
      liveequation =  Result;
    });
  }

  @override
  Widget build(BuildContext context) {

    // Variables Used in app





    return SafeArea(
        child: Scaffold(

        body: Center(
          child: Column(
            children: [
              // Theme Change Button
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Icon(Icons.wb_sunny,color: Colors.deepPurple,),

                 ],
               ),
             ),

              // Live Equation Area
              SafeArea(
                child: (
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(liveequation, maxLines: 1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(
                      fontSize: 40.0,
                      color: liveeqcolor,
                      fontWeight: FontWeight.w300,
                    ),),
                  )

                ),
              ),

              // Result Area
              SafeArea(

                child: (
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(Result,maxLines: 1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(
                      fontSize: 65.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),),
                  )
                )
              ),

              // Actual Typing Pad

              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: buttonpadcolor,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Button(
                            buttontext:'AC',
                            updatestring: cleareverything,
                          ),
                        Button(
                          buttontext:"E",
                          updatestring: removelastchar,
                        ),
                        Button(
                          buttontext:"+",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"-",
                          updatestring: updatestr,
                        ),

                    ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          buttontext:"7",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"8",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"9",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"x",
                          updatestring: updatestr,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          buttontext:"4",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"5",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"6",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"÷",
                          updatestring: updatestr,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          buttontext:"1",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"2",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"3",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"%",
                          updatestring: updatestr,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          buttontext:"00",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"0",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:".",
                          updatestring: updatestr,
                        ),
                        Button(
                          buttontext:"=",
                          updatestring: calculate,
                        ),
                      ],
                    ),

                  ],
                )
              ))
            ],
          )
        ),

    ),
    );
  }

}



