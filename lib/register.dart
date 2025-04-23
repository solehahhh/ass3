import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    color: Color(0xff2c2c2e),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Create Account'),
                    TextSpan(
                      text: '.',
                      style: GoogleFonts.poppins(
                        color: Color(0xff79e5b4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Please enter your credentials.',
                style: GoogleFonts.poppins(
                  color: Color(0xff2c2c2e),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 35),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffeee8e8),
                  border: Border.all(color: Color(0xffeee8e8)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email Address',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffeee8e8),
                  border: Border.all(color: Color(0xffeee8e8)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffeee8e8),
                  border: Border.all(color: Color(0xffeee8e8)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () async {
                    try {
                      final userCredential = await auth.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      final user = userCredential.user;

                      if(user == null){
                        throw Exception('User login unsuccessful');
                      }

                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Success'),
                            content: Text('Account created successfully!'),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacementNamed(context, '/LoginPage');
                                },
                                child: Text('OK'),
                              )
                            ],
                          )
                      );

                    } catch(e){print('Error: ${e}');}
                  },
                  color: Color(0xff79e5b4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account?",
                    style: GoogleFonts.workSans(color: Color(0xff2c2c2e)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/LoginPage');
                    },
                    child: Text(
                      ' Login',
                      style: GoogleFonts.poppins(
                        color: Color(0xff2c2c2e),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

