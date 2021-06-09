import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/circle_menu/circle_menu.dart';
import 'package:flutter_assignment/src/custom_textfield/custom_textfield.dart';
import 'package:flutter_assignment/src/pages/email_page.dart';
import 'package:flutter_assignment/src/pages/personal_information.dart';
import 'package:flutter_assignment/src/widgets/button_card.dart';

// ignore: must_be_immutable
class PasswordPage extends StatefulWidget {
  PasswordPage(
      {Key key, this.isEmailComplete, this.complexity, this.colorComplexPass})
      : super(key: key);
  bool isEmailComplete;
  String complexity;
  Color colorComplexPass;
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
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
              builder: (context) => EmailPage(),
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
                numberMenu: 2,
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
                    'Create Password',
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
                    'Password will be used to login to account',
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

                            /// fontsize
                            obscureText: true,
                            fontSize: 16,
                            prefixIcon: null,
                            suffixIcon: Icon(Icons.remove_red_eye),
                            placeholder: "Password",
                            onTap: () {
                              print('Click');
                            },
                            onChanged: (value) {
                              // RegExp regex = new RegExp(pattern);
                              setState(() {
                                this.password = value;
                                if (value == null || value.isEmpty) {
                                  isIncorrect = true;
                                  print('Please enter some text');
                                }
                                if (value.length <= 6) {
                                  isIncorrect = true;
                                }
                                if (value.length >= 6) {
                                  isPasswordCompliant(value, value.length);
                                  isIncorrect = false;
                                  print('valid');
                                }
                              });
                              print(isIncorrect);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Complexity : ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Text(
                                  widget.complexity == null
                                      ? ' - '
                                      : widget.complexity,
                                  style: widget.complexity != null
                                      ? TextStyle(
                                          color: widget.colorComplexPass,
                                          fontSize: 14,
                                        )
                                      : TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: [
                                  hasLowercase == true
                                      ? Container(
                                          child: Icon(
                                            Icons.verified,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Text(
                                          'a',
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Lowercase',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  hasUppercase == true
                                      ? Container(
                                          child: Icon(
                                            Icons.verified,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Text(
                                          'A',
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Uppercase',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  hasDigits == true
                                      ? Container(
                                          child: Icon(
                                            Icons.verified,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Text(
                                          '123',
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Number',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  hasSpecialCharacters == true
                                      ? Container(
                                          child: Icon(
                                            Icons.verified,
                                            color: Colors.green,
                                          ),
                                        )
                                      : Text(
                                          '9+',
                                          style: TextStyle(
                                            fontSize: 36,
                                            color: Colors.white,
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Characters',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                    if (password == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password is empty')),
                      );
                    } else if (password.length <= 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Password length must 6 characters')),
                      );
                    }
                    if (password.length >= 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Email is valid',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalPage(
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
