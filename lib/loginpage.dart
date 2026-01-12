import 'package:flutter/material.dart';
import 'package:talentconnect/client/home.dart';
import 'package:talentconnect/client/registerpage.dart';
import 'package:talentconnect/freelancer/home.dart';
import 'package:talentconnect/freelancer/register.dart';

class LogninPage extends StatefulWidget {
  const LogninPage({super.key});

  @override
  State<LogninPage> createState() => _LogninPageState();
}

TextEditingController username = TextEditingController();
TextEditingController Password = TextEditingController();
int? loginid;
String? usertype;

Future<void> post_login(context) async {
  try {
    final response = await dio.post(
      '$baseurl/Login',
      data: {'Username': username.text, 'Password': Password.text},
    );
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      loginid = response.data['login_id'];
      usertype = response.data['usertype'];
      if (usertype == 'Freelancer') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homefreelancer()),
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('login succesfull')));
      } else if (usertype == 'Client') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeClient()),
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('login succesfull')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Invalid usertype')));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('login failed')));
    }
  } catch (e) {
    print(e);
  }
}

class _LogninPageState extends State<LogninPage> {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 700,
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -40,
                      left: -40,
                      child: CustomPaint(
                        size: const Size(200, 200),
                        painter: RotatedTrianglePainter(),
                      ),
                    ),
                    Positioned(
                      top: -50,
                      right: -40,
                      child: Transform.rotate(
                        angle: 3.14159,
                        child: CustomPaint(
                          size: const Size(200, 200),
                          painter: RotatedTrianglePainter(),
                        ),
                      ),
                    ),
                    Center(
                      child: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 25),
                              Image.asset(
                                'assets/images/logo.png',
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Talent Connect',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              const Text(
                                'Unlock Your Future',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 22, 121, 202),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 50),
                              const Text(
                                'Welcome Back',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const Text(
                                'Sign in to continue',
                                style: TextStyle(
                                  color: Color.fromARGB(130, 0, 0, 0),
                                ),
                              ),
                              const SizedBox(height: 50),
                              Customfield(
                                prefix: const Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.black38,
                                ),
                                hinttext: 'Username',
                                controller: username,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Username';
                                  } else if (!value.contains('@') &&
                                      !value.endsWith('@gmail.com')) {
                                    return 'enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              Customfield(
                                prefix: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black38,
                                ),
                                hinttext: 'Password',
                                controller: Password,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                  post_login(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  minimumSize: const Size(150, 45),
                                ),
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 60),
                              const Text("Don't Have An Account ? "),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const SignupRoleDialog(),
                                  );
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.blue,
                                    decorationThickness: 2,
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

class SignupRoleDialog extends StatelessWidget {
  const SignupRoleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(25),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sign Up As',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPagefreelancer(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Freelancer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  side: const BorderSide(color: Colors.blue, width: 1.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Client',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
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
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
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

  const Customfield({
    super.key,
    required this.hinttext,
    required this.controller,
    required this.validator,
    required this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hinttext,
          prefixIcon: prefix,
          hintStyle: const TextStyle(color: Colors.black38),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black38, width: 1.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black38, width: 1.3),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(width: 1.3),
          ),
        ),
      ),
    );
  }
}
