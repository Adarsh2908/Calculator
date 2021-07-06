import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
 String buttontext = "";
 Color buttoncolor = Colors.deepPurple;
 Color btntextcolor = Colors.black54;
 Function updatestring;
 Button({Key key, this.buttontext, this.buttoncolor = Colors.transparent,this.updatestring}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.0,
      width: 75.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(buttontext,style: GoogleFonts.poppins(
          fontSize: 30.0,
          fontWeight: FontWeight.w300,
          color: btntextcolor,
        ),),
        onPressed: ()=>{
          updatestring(buttontext),
        },
        // color: buttoncolor != null ? buttoncolor:null,
      ),
    );
  }
}
