import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talentconnect/loginpage.dart';
import 'package:geolocator/geolocator.dart';

class RegisterPagefreelancer extends StatefulWidget {
  const RegisterPagefreelancer({super.key});

  @override
  State<RegisterPagefreelancer> createState() =>
      _RegisterPagefreelancerState();
}

// ---------------- CONTROLLERS ----------------
TextEditingController name = TextEditingController();
TextEditingController Password = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phono = TextEditingController();
TextEditingController job = TextEditingController();

// ---------------- LOCATION ----------------
double? latitude;
double? longitude;

// ---------------- API ----------------
final dio = Dio();
final baseurl = 'http://192.168.1.63:5000';

// ---------------- GET CURRENT LOCATION ----------------
Future<void> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permission permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  latitude = position.latitude;
  longitude = position.longitude;
}

// ---------------- REGISTER API ----------------
Future<void> post_reg(context) async {
  try {
    await getCurrentLocation(); // 📍 get location first

    final response = await dio.post(
      '$baseurl/freelancer',
      data: {
        'Fullname': name.text,
        'Phone': phono.text,
        'Description': job.text,
        'Email': email.text,
        'Username': email.text,
        'Password': Password.text,
        'Latitude': latitude,   // ✅ sent to backend
        'Longitude': longitude, // ✅ sent to backend
      },
    );

    print(response.data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogninPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('registration successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('registration failed')),
      );
    }
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Location or registration error')),
    );
  }
}


// ---------------- UI ----------------
class _RegisterPagefreelancerState
    extends State<RegisterPagefreelancer> {
      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }
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
                                  color: Color.fromARGB(255, 22, 121, 202),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
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
                                  color: Color.fromARGB(130, 0, 0, 0),
                                ),
                              ),
                              SizedBox(height: 30),
                              Customfield(
                                prefix: Icon(Icons.person_2_outlined,
                                    color: Colors.black38),
                                hinttext: 'Fullname',
                                controller: name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Fullname';
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              Customfield(
                                prefix: Icon(Icons.phone_outlined,
                                    color: Colors.black38),
                                hinttext: 'Phone Number',
                                controller: phono,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your phone number';
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              Customfield(
                                prefix: Icon(Icons.work_outline,
                                    color: Colors.black38),
                                hinttext: 'Job Description',
                                controller: job,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Job Description';
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              Customfield(
                                prefix: Icon(Icons.email_outlined,
                                    color: Colors.black38),
                                hinttext: 'Email',
                                controller: email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Email';
                                  } else if (!value.contains('@')) {
                                    return 'Enter a valid email';
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              Customfield(
                                prefix: Icon(Icons.lock_outline,
                                    color: Colors.black38),
                                hinttext: 'Password',
                                controller: Password,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Password';
                                  } else if (value.length < 6) {
                                    return 'Password must contain 6 characters';
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  post_reg(context);
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

// ---------------- TRIANGLE PAINTER ----------------
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

// ---------------- CUSTOM FIELD ----------------
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
