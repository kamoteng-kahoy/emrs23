import 'package:flutter/material.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 414,
          height: 896,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFE4E5EF)),
          child: Stack(
            children: [
              Positioned(
                left: 64,
                top: 430,
                child: Container(
                  width: 285,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for signup button here
                      print('Signup button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF00094D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Send Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE4E5EF),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 2,
                top: 292,
                child: Container(
                  width: 330,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 42,
                        top: 0,
                        child: Container(
                          width: 330,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Email Address/Mobile Number',
                              hintStyle: TextStyle(
                                color: Color(0x7F0C0C0C),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.70,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.only(bottom: 8),
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 163,
                child: SizedBox(
                  width: 307,
                  child: Text(
                    'Enter Email or Phone Number to Sign-Up',
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 27,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 32,
                top: 72,
                child: Container(
                  width: 24,
                  height: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 6.25,
                            left: 4.25,
                            right: 4.75,
                            bottom: 5.70,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform(
                                transform: Matrix4.identity()
                                  ..translate(0.0, 0.0)
                                  ..rotateZ(1.57),
                                child: Container(
                                  width: 12.05,
                                  height: 15,
                                  child: Stack(
                                    children: [
                                      // Your additional stack children can go here
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
