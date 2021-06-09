import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCard extends StatefulWidget {
  final Color color;
  final Color progressIndicatorColor;
  final String textButton;
  final String percentComplete;
  final IconData icon;
  final String cardMenu;
  final onPressed;
  final String members;
  final String date;
  final double width;
  final bool withIcon;
  ButtonCard({
    this.color,
    this.progressIndicatorColor,
    this.percentComplete,
    this.textButton,
    this.icon,
    this.cardMenu,
    this.onPressed,
    this.members,
    this.date,
    this.width = 195,
    this.withIcon = false,
  });
  @override
  _ButtonCardState createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        // focusColor: Colors.blue.withOpacity(0.4)Grey,
        onTap: widget.onPressed,
        child: MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered = true;
              print('on enter');
            });
          },
          onExit: (value) {
            setState(() {
              hovered = false;
              print('on exit');
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 275),
            height: hovered ? 50.0 : 49.0,
            width: hovered ? widget.width + 2 : widget.width,
            decoration: hovered == true
                ? BoxDecoration(
                    color: hovered
                        ? Colors.blueAccent[100]
                        : Colors.blueAccent[100],
                    borderRadius: BorderRadius.circular(5.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.blueAccent[100],
                    //     blurRadius: 4.0,
                    //     spreadRadius: 2.0,
                    //   ),
                    // ],
                  )
                : BoxDecoration(
                    color: hovered
                        ? Colors.blueAccent[100]
                        : Colors.blueAccent[100],
                    borderRadius: BorderRadius.circular(5.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.blueAccent[100],
                    //     blurRadius: 4.0,
                    //     spreadRadius: 2.0,
                    //   ),
                    // ],
                  ),
            // child: Center(
            child: Container(
              child: widget.withIcon == true
                  ? Center(
                      child: Container(
                        width: 60.0,
                        child: Text(
                          widget.textButton,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: hovered ? Colors.white : Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        widget.textButton,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: hovered ? Colors.white : Colors.white,
                        ),
                      ),
                    ),
            ),
            // ),
          ),
        ),
      ),
    );
  }
}
