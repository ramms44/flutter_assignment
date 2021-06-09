import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/appbar/line.dart';

// ignore: must_be_immutable
class CircleMenu extends StatefulWidget {
  final int numberMenu;
  bool color1 = false;
  bool color2 = false;
  bool color3 = false;
  bool color4 = false;

  CircleMenu({
    Key key,
    this.numberMenu,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
  }) : super(key: key);

  @override
  _CircleMenuState createState() => _CircleMenuState();
}

class _CircleMenuState extends State<CircleMenu> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    if (widget.numberMenu == 1) {
      setState(() {
        widget.color1 = false;
        widget.color2 = false;
        widget.color3 = false;
        widget.color4 = false;
      });
    }
    if (widget.numberMenu == 2) {
      setState(() {
        widget.color1 = true;
        widget.color2 = false;
        widget.color3 = false;
        widget.color4 = false;
      });
    }
    if (widget.numberMenu == 3) {
      setState(() {
        widget.color1 = true;
        widget.color2 = true;
        widget.color3 = false;
        widget.color4 = false;
      });
    }
    if (widget.numberMenu == 4) {
      setState(() {
        widget.color1 = true;
        widget.color2 = true;
        widget.color3 = true;
        widget.color4 = false;
      });
    }
    if (widget.numberMenu == 0) {
      setState(() {
        widget.color1 = false;
        widget.color2 = false;
        widget.color3 = false;
        widget.color4 = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('number menu: ${widget.numberMenu}');
    print('color1: ${widget.color1}');
    print('color2: ${widget.color2}');
    print('color3: ${widget.color3}');
    print('color4: ${widget.color4}');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: ClipOval(
              child: Material(
                color: (widget.color1 == false) || widget.color1 == null
                    ? Colors.white
                    : Colors.green, // Button color
                child: InkWell(
                  splashColor: Colors.red, // Splash color
                  onTap: () {},
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          Container(
            margin: EdgeInsets.all(1),
            child: CustomPaint(
              size: Size(50, 3),
              painter: LinePainter(),
            ),
          ),
          Container(
            child: ClipOval(
              child: Material(
                color: (widget.color2 == false) || widget.color2 == null
                    ? Colors.white
                    : Colors.green,
                child: InkWell(
                  splashColor: Colors.red, // Splash color
                  onTap: () {},
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Center(
                        child: Text(
                      '2',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          Container(
            margin: EdgeInsets.all(1),
            child: CustomPaint(
              size: Size(50, 3),
              painter: LinePainter(),
            ),
          ),
          Container(
            child: ClipOval(
              child: Material(
                color: (widget.color3 == false) || widget.color3 == null
                    ? Colors.white
                    : Colors.green,
                child: InkWell(
                  splashColor: Colors.red, // Splash color
                  onTap: () {},
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Center(
                        child: Text(
                      '3',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          Container(
            margin: EdgeInsets.all(1),
            child: CustomPaint(
              size: Size(50, 3),
              painter: LinePainter(),
            ),
          ),
          Container(
            child: ClipOval(
              child: Material(
                color: (widget.color4 == false) || widget.color4 == null
                    ? Colors.white
                    : Colors.green,
                child: InkWell(
                  splashColor: Colors.red, // Splash color
                  onTap: () {},
                  child: SizedBox(
                    width: 45,
                    height: 45,
                    child: Center(
                        child: Text(
                      '4',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ],
      ),
    );
  }
}
