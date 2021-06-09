import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/circle_menu/circle_menu.dart';
import 'package:flutter_assignment/src/custom_textfield/custom_textfield.dart';
import 'package:flutter_assignment/src/pages/personal_information.dart';
import 'package:intl/intl.dart';
import 'package:flutter_assignment/src/widgets/button_card.dart';

// ignore: must_be_immutable
class VideoCallPage extends StatefulWidget {
  VideoCallPage(
      {Key key, this.isEmailComplete, this.complexity, this.colorComplexPass})
      : super(key: key);
  bool isEmailComplete;
  String complexity;
  Color colorComplexPass;
  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  @override
  void initState() {
    // TODO: implement initState
    email = '';
    password = '';
    // isPasswordCompliant('asd123');
    super.initState();
  }

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final formKey = new GlobalKey<FormState>();

  String dropdownDateValue = '- Choose Date -';
  String dropdownTimeValue = '- Choose Time -';

  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime chooseDate;
  TimeOfDay chooseTime;
  final dateController = TextEditingController();
  final timeController = TextEditingController();

  bool isObscureText = false;
  bool isIncorrect = false;

  bool hasLowercase;
  bool hasUppercase;
  bool hasDigits;
  bool hasSpecialCharacters;

  bool hasMinLength;

  String email, password;
  int paswordStrengthCount = 0;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    setState(() {
      paswordStrengthCount = 0;
    });

    hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    hasDigits = password.contains(new RegExp(r'[0-9]'));
    hasLowercase = password.contains(new RegExp(r'[a-z]'));
    hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasMinLength = password.length >= minLength;

    print("hasDigits : $hasDigits");
    print("hasUppercase : $hasUppercase");
    print("hasLowercase : $hasLowercase");
    print("hasSpecialCharacters : $hasSpecialCharacters");
    print("hasMinLength : $hasMinLength");

    if (hasDigits == true) {
      setState(() {
        paswordStrengthCount = paswordStrengthCount + 1;
      });
    }
    if (hasUppercase == true) {
      setState(() {
        paswordStrengthCount = paswordStrengthCount + 1;
      });
    }
    if (hasLowercase == true) {
      setState(() {
        paswordStrengthCount = paswordStrengthCount + 1;
      });
    }
    if (hasSpecialCharacters == true) {
      setState(() {
        paswordStrengthCount = paswordStrengthCount + 1;
      });
    }
    if (hasMinLength == true) {
      setState(() {
        paswordStrengthCount = paswordStrengthCount + 1;
      });
    } else {
      setState(() {
        paswordStrengthCount = paswordStrengthCount + 0;
      });
    }

    print('paswordStrengthCount : $paswordStrengthCount');
    if (paswordStrengthCount == 0) {
      setState(() {
        widget.complexity = 'Bad';
        widget.colorComplexPass = Colors.red;
      });
    }
    if (paswordStrengthCount == 1) {
      setState(() {
        widget.complexity = 'Very Weak';
        widget.colorComplexPass = Colors.amber[300];
      });
    }
    if (paswordStrengthCount == 2) {
      setState(() {
        widget.complexity = 'Weak';
        widget.colorComplexPass = Colors.amber;
      });
    }
    if (paswordStrengthCount == 3) {
      setState(() {
        widget.complexity = 'Normal';
        widget.colorComplexPass = Colors.green[100];
      });
    }
    if (paswordStrengthCount == 4) {
      setState(() {
        widget.complexity = 'Strong';
        widget.colorComplexPass = Colors.green[300];
      });
    }
    if (paswordStrengthCount == 5) {
      setState(() {
        widget.complexity = 'Very Strong';
        widget.colorComplexPass = Colors.green;
      });
    }

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalPage(),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Create Account"),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CircleMenu(
                numberMenu: 4,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 8.0,
                        // assign the color to the border color
                        color: Colors.blueAccent[100],
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(Icons.date_range_rounded, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Schedule Video Call',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Choose the date and time that you preferred, we \nwill send a link via email to make a video call on \nthe schedule date and time',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                          ),
                          padding: EdgeInsets.all(6),
                          child: BeautyTextfield(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 70,
                            duration: Duration(milliseconds: 300),
                            inputType: TextInputType.text,

                            /// menambah parameter [backgroundColor] dan [isFocusTextColor]
                            backgroundColor: Colors.grey[200],
                            isFocusTextColor: Colors.grey,
                            accentColor: Colors.grey[200],

                            controller: dateController,

                            /// fontsize
                            // obscureText: true,
                            fontSize: 16,
                            prefixIcon: null,
                            // suffixIcon: Icon(Icons.remove_red_eye),
                            placeholder: "- Choose Date -",
                            onTap: () async {
                              final datePick = await showDatePicker(
                                context: context,
                                initialDate: new DateTime.now(),
                                firstDate: new DateTime(1900),
                                lastDate: new DateTime(2100),
                              );
                              if (datePick != null && datePick != chooseDate) {
                                setState(() {
                                  chooseDate = datePick;
                                  // isDateSelected = true;

                                  // age format exam. // 08/14/2019
                                  dateController.text =
                                      "${DateFormat('EEEE').format(chooseDate)}, ${chooseDate.day} ${DateFormat('MMM').format(chooseDate)} ${chooseDate.year}";
                                });
                              }
                            },
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                          ),
                          padding: EdgeInsets.all(6),
                          child: BeautyTextfield(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 70,
                            duration: Duration(milliseconds: 300),
                            inputType: TextInputType.text,

                            /// menambah parameter [backgroundColor] dan [isFocusTextColor]
                            backgroundColor: Colors.grey[200],
                            isFocusTextColor: Colors.grey,
                            accentColor: Colors.grey[200],

                            controller: timeController,

                            /// fontsize
                            // obscureText: true,
                            fontSize: 16,
                            prefixIcon: null,
                            // suffixIcon: Icon(Icons.remove_red_eye),
                            placeholder: "- Choose Time -",
                            onTap: () async {
                              _selectTime(context);
                              if (selectedTime != null) {
                                setState(() {
                                  chooseTime = selectedTime;
                                  // isDateSelected = true;

                                  // age format exam. // 08/14/2019
                                  timeController.text =
                                      "${chooseTime.format(context)}";
                                });
                              }
                            },
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                // margin: EdgeInsets.all(25),
                child: ButtonCard(
                  textButton: 'Next',
                  color: Colors.grey[800],
                  width: MediaQuery.of(context).size.width * 0.9,
                  withIcon: true,
                  icon: Icons.person,
                  onPressed: () {
                    if ((chooseDate.toString() != null) &&
                        (chooseTime.toString() != null)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Your choose is not complete')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Processing data',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
