import 'package:flutter/material.dart';
import 'package:talentconnect/freelancer/register.dart';
import 'package:talentconnect/loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController name = TextEditingController();
TextEditingController Password = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phono = TextEditingController();

Future<void> post_regclient(context) async {
  try {
    final response = await dio.post(
      '$baseurl/Client',
      data: {
        'Fullname': name.text,
        'Phone': phono.text,
        'Email': email.text,
        'Username': email.text,
        'Password': Password.text,
      },
    );

    print(response.data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogninPage()),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('registration successful')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('registration failed')));
    }
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Location or registration error')));
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 228, 237, 244),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),

            // ********** CLIP THE INSIDE OF THE CARD **********
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Container(
                height: 700,
                width: double.infinity,
                color: Colors.white,

                child: Stack(
                  children: [
                    // *********** BOTTOM-LEFT TRIANGLE ***********
                    Positioned(
                      bottom: -40,
                      left: -40,
                      child: CustomPaint(
                        size: const Size(200, 200),
                        painter: RotatedTrianglePainter(),
                      ),
                    ),

                    // *********** TOP-RIGHT TRIANGLE ***********
                    Positioned(
                      top: -50,
                      right: -40,
                      child: Transform.rotate(
                        angle: 3.14159, // Rotate 180 degrees to mirror
                        child: CustomPaint(
                          size: const Size(200, 200),
                          painter: RotatedTrianglePainter(),
                        ),
                      ),
                    ),

                    // *********** PAGE CONTENT ***********
                    Center(
                      child: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Talent Connect',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              Text(
                                'Unlock Your Future',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    22,
                                    121,
                                    202,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Create Your Account',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                'Join us to find the perfect talent',
                                style: TextStyle(
                                  color: const Color.fromARGB(130, 0, 0, 0),
                                ),
                              ),
                              SizedBox(height: 50),
                              Customfield(
                                prefix: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.black38,
                                ),
                                hinttext: 'Fullname',
                                controller: name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Fullname';
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              Customfield(
                                prefix: Icon(
                                  Icons.phone_outlined,
                                  color: Colors.black38,
                                ),
                                hinttext: 'Phone Number',
                                controller: phono,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your phone number';
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              Customfield(
                                prefix: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black38,
                                ),
                                hinttext: 'Email',
                                controller: email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Email';
                                  } else if (!value.contains('@') &&
                                      !value.endsWith('@gmail.com')) {
                                    return 'Enter a valid email';
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              Customfield(
                                prefix: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black38,
                                ),
                                hinttext: 'Password',
                                controller: Password,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Password';
                                  } else if (value.length < 6) {
                                    return 'Password must contain 6 charecters';
                                  }
                                },
                              ),
                              SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                  post_regclient(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  minimumSize: Size(150, 45),
                                ),
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RotatedTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 221, 229, 250),
          Color.fromARGB(255, 216, 228, 253),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    // Start at top-left (new apex)
    path.moveTo(0, 0);

    // Go to bottom-left
    path.lineTo(0, size.height);

    // Go to bottom-right
    path.lineTo(size.width, size.height);

    // Close back to top-left
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Customfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Icon prefix;
  Customfield({
    super.key,
    required this.hinttext,
    required this.controller,
    required this.validator,
    required this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hinttext,
          prefixIcon: prefix,
          hintStyle: TextStyle(color: Colors.black38),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.black38, width: 1.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.black38, width: 1.3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 1.3),
          ),
        ),
      ),
    );
  }
}
