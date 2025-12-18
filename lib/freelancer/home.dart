import 'package:flutter/material.dart';
import 'package:talentconnect/client/chat.dart';
import 'package:talentconnect/freelancer/Viewfeedback.dart';
import 'package:talentconnect/freelancer/manage_bookings.dart';
import 'package:talentconnect/freelancer/payement_status.dart';
import 'package:talentconnect/loginpage.dart';

class Homefreelancer extends StatefulWidget {
  const Homefreelancer({super.key});

  @override
  State<Homefreelancer> createState() => _HomefreelancerState();
}

class _HomefreelancerState extends State<Homefreelancer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', height: 50, width: 50),
              SizedBox(height: 8),
              Text(
                'Talent Connect',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                'Unlock Your Future',
                style: TextStyle(
                  color: const Color.fromARGB(255, 22, 121, 202),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Welcome Freelancer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Manage Your Career.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Your Tools',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonfield(
                    text: 'Manage Bookings',
                    color: Colors.blue,
                    textcolor: Colors.white,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Manage_bookings(),
                        ),
                      );
                    },
                  ),
                  buttonfield(
                    text: 'Manage Portfolio',
                    color: const Color.fromARGB(237, 240, 248, 251),
                    textcolor: Colors.black,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Manage_bookings(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonfield(
                    text: 'View Ratings',
                    color: Colors.blue,
                    textcolor: Colors.white,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => View_Feedbacks(),
                        ),
                      );
                    },
                  ),
                  buttonfield(
                    text: 'Chat with User',
                    color: const Color.fromARGB(237, 240, 248, 251),
                    textcolor: Colors.black,
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChataPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Activity',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // offset: Offset(2, 2),
                        blurRadius: 8,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttonfield(
                        text: 'Booking History',
                        color: Colors.blue,
                        textcolor: const Color.fromARGB(255, 253, 252, 252),
                        icon: Icon(
                          Icons.history,
                          size: 30,
                          color: const Color.fromARGB(255, 253, 254, 254),
                        ),
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Manage_bookings(),
                            ),
                          );
                        },
                      ),
                      buttonfield(
                        text: 'Payout History',
                        color: const Color.fromARGB(237, 240, 248, 251),
                        textcolor: Colors.black,
                        icon: Icon(Icons.payment, size: 30, color: Colors.blue),
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payement_status(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70),
              buttonfield(
                icon: Icon(Icons.logout, color: Colors.white, size: 20),
                text: 'LOGOUT',
                color: const Color.fromARGB(255, 198, 39, 27),
                textcolor: Colors.white,
                 onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogninPage(),
                        ),
                      );
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buttonfield extends StatelessWidget {
  String text;
  Color color;
  Color textcolor;
  Icon? icon;
  VoidCallback? onpressed;
  buttonfield({
    super.key,
    required this.text,
    required this.color,
    required this.textcolor,
    this.icon,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: const Color.fromARGB(255, 201, 227, 248),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(22),
      ),
      child: ElevatedButton.icon(
        icon: icon,
        onPressed: onpressed,
        label: Text(text, style: TextStyle(color: textcolor)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(174, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(22),
          ),
        ),
      ),
    );
  }
}
