import 'package:app_sample/messages_user.dart';
import 'package:app_sample/signup.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';


class OvalBorder extends ShapeBorder {
  const OvalBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addOval(rect.inflate(-2.0));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addOval(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return OvalBorder();
  }
}

void main() async{
  runApp(LogIn());
}

class LogIn extends StatelessWidget {
  final pb = PocketBase('http://10.0.2.2:8090');
  final txEmail = TextEditingController();
  final txPass = TextEditingController();

  Future <void> loginAction(BuildContext context) async{
    print('Login Button Pressed');

    try{
      final authData = await pb.collection('users').authWithPassword(
        txEmail.text,
        txPass.text,
      );

      print('User authenticated');
      
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MsgUser()), // Navigate to MsgUser screen
    );
    } 
    catch(e){
      print('Exception during authentication: $e');
    } 
  }

  void signupAction(BuildContext context) {
    // Implement signup logic here
    print('Sign Up Button Pressed');
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUp()), // SignUp Screen
  );
  }

  void forgotPasswordAction() {
    // Implement forgot password logic here
    print('Forgot Password Clicked');
  }

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
                left: 158,
                top: 66,
                child: Container(
                  width: 93,
                  height: 31.12,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 30,
                          height: 31.12,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 21.22,
                                  height: 21.22,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF1F1F1F),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 8.84,
                                top: 8.35,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(0.08),
                                  child: Container(
                                    width: 21.22,
                                    height: 21.22,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF4D4400),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 43,
                        top: 4,
                        child: Text(
                          'EMRS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF191818),
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.06,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 64,
                top: 507,
                child: Container(
                  width: 285,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: (){
                      signupAction(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: Color(0xFFE4E5EF),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF00094D)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0C0C0C),
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
                left: 64,
                top: 430,
                child: Container(
                  width: 285,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => loginAction(context),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: Color(0xFF00094D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Login',
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
                            controller: txEmail,
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
                left: 2.04,
                top: 351,
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
                            controller: txPass,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
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
                left: 86,
                top: 584,
                child: GestureDetector(
                  onTap: forgotPasswordAction,
                  child: SizedBox(
                    width: 242,
                    height: 20,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Forgot Password? ',
                            style: TextStyle(
                              color: Color(0xFF0C0C0C),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.70,
                            ),
                          ),
                          TextSpan(
                            text: 'Click here',
                            style: TextStyle(
                              color: Color(0xFF0C0C0C),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              height: 0,
                              letterSpacing: 0.70,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 85,
                top: 165,
                child: Text(
                  'Login or Sign-Up to \ncontinue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0C0C0C),
                    fontSize: 27,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
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