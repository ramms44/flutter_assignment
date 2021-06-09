import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/circle_menu/circle_menu.dart';
import 'package:flutter_assignment/src/pages/video_call_page.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:flutter_assignment/src/widgets/button_card.dart';

import 'create_password_page.dart';

// ignore: must_be_immutable
class PersonalPage extends StatefulWidget {
  PersonalPage(
      {Key key, this.isEmailComplete, this.complexity, this.colorComplexPass})
      : super(key: key);
  bool isEmailComplete;
  String complexity;
  Color colorComplexPass;
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
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

  String dropdownActivitionValue = '- Choose Option -';
  String dropdownIncomeValue = '- Choose Option -';
  String dropdownExpense = '- Choose Option -';

  bool isObscureText = false;
  bool isIncorrect = false;

  bool hasLowercase;
  bool hasUppercase;
  bool hasDigits;
  bool hasSpecialCharacters;

  bool hasMinLength;

  String email, password;
  int paswordStrengthCount = 0;

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
              builder: (context) => PasswordPage(),
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
                numberMenu: 3,
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
                    'Personal Information',
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
                    'Please fill in the information below and your goal for digital saving',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                          ),
                          padding: EdgeInsets.all(6),
                          child: DropdownButtonHideUnderline(
                            child: GFDropdown(
                              hint: Text(" - Choose Option - "),
                              padding: const EdgeInsets.all(15),
                              borderRadius: BorderRadius.circular(10),
                              border: BorderSide(
                                  color: Colors.grey.withOpacity(0.8),
                                  width: 1.3),
                              dropdownButtonColor: Colors.white,
                              value: dropdownActivitionValue,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownActivitionValue = newValue;
                                });
                              },
                              items: [
                                '- Choose Option -',
                                'Programmer',
                                'Frontend',
                                'Backend',
                                'Fullstack',
                              ]
                                  .map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                          ),
                          padding: EdgeInsets.all(6),
                          child: DropdownButtonHideUnderline(
                            child: GFDropdown(
                              hint: Text(" - Choose Option - "),
                              padding: const EdgeInsets.all(15),
                              borderRadius: BorderRadius.circular(10),
                              border: BorderSide(
                                  color: Colors.grey.withOpacity(0.8),
                                  width: 1.3),
                              dropdownButtonColor: Colors.white,
                              value: dropdownIncomeValue,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownIncomeValue = newValue;
                                });
                              },
                              items: [
                                '- Choose Option -',
                                '3.500.000 IDR',
                                '4.000.000 IDR',
                                '5.000.000 IDR',
                                '6.000.000 IDR',
                              ]
                                  .map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                          ),
                          padding: EdgeInsets.all(6),
                          child: DropdownButtonHideUnderline(
                            child: GFDropdown(
                              hint: Text(" - Choose Option - "),
                              padding: const EdgeInsets.all(15),
                              borderRadius: BorderRadius.circular(10),
                              border: BorderSide(
                                  color: Colors.grey.withOpacity(0.8),
                                  width: 1.3),
                              dropdownButtonColor: Colors.white,
                              value: dropdownExpense,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownExpense = newValue;
                                });
                              },
                              items: [
                                '- Choose Option -',
                                '1.000.000 IDR',
                                '2.000.000 IDR',
                                '3.000.000 IDR',
                                '4.000.000 IDR',
                              ]
                                  .map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
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
                    if ((dropdownActivitionValue == '- Choose Option -') &&
                        (dropdownExpense == '- Choose Option -') &&
                        (dropdownIncomeValue == '- Choose Option -')) {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoCallPage(
                              // isEmailComplete: widget.isEmailcomplete,
                              ),
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
