import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

void navigateToLogIn(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => LogIn()), // Replace LogIn() with your actual login screen
    (route) => false,
  );
}

const primaryColor = Color(0xFF00094D);
const inactiveColor = Color(0xFFE4E5EF);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MyMessagingScreen(),
    );
  }
}

class MyMessagingScreen extends StatefulWidget {
  @override
  _MyMessagingScreenState createState() => _MyMessagingScreenState();
}

class _MyMessagingScreenState extends State<MyMessagingScreen> {
  bool showMessages = true;

  void toggleContent(bool showMessages) {
    setState(() {
      this.showMessages = showMessages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Messages',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFFE4E5EF),
              fontWeight: FontWeight.w700,
              fontSize: 21,
            ),
          ),
        ),
        backgroundColor: primaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.call_missed),
            onPressed: () {
              print("Pressed");
            },
          ),
          PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 0) {
                print("Item 1 pressed");
                navigateToLogIn(context);
              } 
              else if (value == 1) {
                // Functionality for the second item in the menu
                // Perform desired action for Item 2
                print("Item 2 pressed");
              }
              // Add more else-if blocks for additional items in the menu
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text('Logout'),
              ),
              // Add more PopupMenuItems for additional items in the menu
            ],
          ),
        ],
      ),

      // BODY SECTION OF THE APP
      body: Stack(
        children: [
          // Content Area
          Positioned.fill(
            top: 100,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 120),
              switchInCurve: showMessages ? Curves.easeOut : Curves.easeIn,
              switchOutCurve: showMessages ? Curves.easeOut : Curves.easeIn,
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: showMessages ? Offset(-1.0, 0.0) : Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: Center(
                key: ValueKey<bool>(showMessages),
                child: showMessages

                    ? // Message Inbox 
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatScreen()),
                          );
                      },
                      child: Container( 
                        width: 343,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 344,
                                height: 124, // Updated height to accommodate the new content
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('images/profile_orig.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(80),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 64,
                                      top: 0,
                                      child: SizedBox(
                                        width: 115,
                                        child: Text(
                                          'Alice Morales',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 65,
                                      top: 27,
                                      child: SizedBox(
                                        width: 245,
                                        child: Text(
                                          'You: Election is ongoing',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 308,
                                      top: 3,
                                      child: SizedBox(
                                        width: 36,
                                        child: Text(
                                          '10:15 am',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 79,
                              child: Container(
                                width: 344,
                                height: 45,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 64,
                                      top: 0,
                                      child: SizedBox(
                                        width: 115,
                                        child: Text(
                                          'Joshua Rivera',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 65,
                                      top: 27,
                                      child: SizedBox(
                                        width: 245,
                                        child: Text(
                                          'You: Election was going smoothly.',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 308,
                                      top: 3,
                                      child: SizedBox(
                                        width: 36,
                                        child: Text(
                                          '9:45 am',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('images/profile_orig.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(80),
                                          ),
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
                    )
                    
                    : // Report Inbox
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatScreen()),
                          );
                      },
                      child: Container( 
                        width: 343,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 344,
                                height: 124, // Updated height to accommodate the new content
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('images/profile_orig.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(80),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 64,
                                      top: 0,
                                      child: SizedBox(
                                        width: 115,
                                        child: Text(
                                          'Carlo Santos',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 65,
                                      top: 27,
                                      child: SizedBox(
                                        width: 245,
                                        child: Text(
                                          'You: Report #001',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 308,
                                      top: 3,
                                      child: SizedBox(
                                        width: 36,
                                        child: Text(
                                          '11:15 am',
                                          style: TextStyle(
                                            color: Color(0xFF0C0C0C),
                                            fontSize: 11,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
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
                    )
              ),
            ),
          ),

          // Messages button
          Positioned(
            left: 208,
            top: 30,
            child: GestureDetector(
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                color: showMessages ? primaryColor : inactiveColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    print("Messages button pressed");
                    if (!showMessages) {
                      toggleContent(true);
                    }
                  },
                  child: Container(
                    width: 133,
                    height: 35,
                    child: Center(
                      child: Text(
                        'Messages',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: showMessages ? Colors.white : Color(0xFF0C0C0C),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Reports button
          Positioned(
            left: 74,
            top: 30,
            child: GestureDetector(
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                color: showMessages ? inactiveColor : primaryColor,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    print("Reports button pressed");
                    if (showMessages) {
                      toggleContent(false);
                    }
                  },
                  child: Container(
                    width: 133,
                    height: 35,
                    child: Center(
                      child: Text(
                        'Reports',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: showMessages ? Color(0xFF0C0C0C) : Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Start chat button
          Positioned(
            left: 256,
            bottom: 20,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(17),
              child: InkWell(
                borderRadius: BorderRadius.circular(17),
                onTap: () {
                  print("Start chat button pressed");
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Container(
                    width: 129,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Start chat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF0D0D0D),),
        toolbarHeight: 60,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(
            'Sample Chat Box',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color(0xFF0D0D0D),
              fontWeight: FontWeight.w700,
              fontSize: 21,
            ),
          ),
        ),
        backgroundColor: inactiveColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              print("Pressed");
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              print("Pressed");
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              print("Pressed");
            },
          ),
        ],
      ),
      body: Container(color: inactiveColor,)
      // Other chat interface elements
    );
  }
}
