import 'package:flutter/material.dart';
import 'package:flutter_assignment/src/appbar/appbar.dart';
import 'package:flutter_assignment/src/circle_menu/circle_menu.dart';
import 'package:flutter_assignment/src/custom_textfield/custom_textfield.dart';
import 'package:flutter_assignment/src/pages/create_password_page.dart';
import 'package:flutter_assignment/src/widgets/button_card.dart';

// ignore: must_be_immutable
class EmailPage extends StatefulWidget {
  EmailPage({Key key, this.isEmailcomplete}) : super(key: key);
  bool isEmailcomplete = false;
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final formKey = new GlobalKey<FormState>();
  bool isObscureText = false;
  bool isIncorrect = false;
  String email, password;

  @override
  void initState() {
    // TODO: implement initState
    email = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
          child: ClipPath(
            clipper: CustomAppBar(),
            child: Container(
              height: 250,
              color: const Color(0xff5389F4),
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: CircleMenu(
                  numberMenu: 0,
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 250)),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 60),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'GIN',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Finans',
                          style: TextStyle(
                              color: Colors.blueAccent[400],
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
                    'Welcome to The Bank of The Future. \nManage and track your accounts on \nthe go.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                            color: Colors.white,
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
                            fontSize: 16,
                            prefixIcon: Icon(Icons.email_outlined),
                            placeholder: "Email",
                            onTap: () {
                              print('Click');
                            },
                            onChanged: (value) {
                              RegExp regex = new RegExp(pattern);
                              setState(() {
                                this.email = value;
                                if (value == null || value.isEmpty) {
                                  print('Please enter some text');
                                } else if (!(regex.hasMatch(value))) {
                                  isIncorrect = true;
                                } else {
                                  isIncorrect = false;
                                  print('valid');
                                }
                              });
                              print(isIncorrect);
                            },
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
                    if (email == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email is empty')),
                      );
                    } else if (isIncorrect == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email is invalid')),
                      );
                    }
                    if (isIncorrect == false && email != null) {
                      setState(() {
                        widget.isEmailcomplete = true;
                      });
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
                          builder: (context) => PasswordPage(
                            isEmailComplete: widget.isEmailcomplete,
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
