import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Center(
                child: Column(
                  children: [
                    Image.network(
                      'https://img.freepik.com/free-vector/two-factor-authentication-concept-illustration_114360-5280.jpg?t=st=1745387906~exp=1745391506~hmac=f520116b1ed2b5fea140d1f468d9baa0e32e7bca574cdac9fa36eea59b6b8989&w=826',
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: 270,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    color: Color(0xff2c2c2e),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(text: 'Login'),
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
                'Welcome Back! Please login',
                style: GoogleFonts.poppins(
                  color: Color(0xff2c2c2e),
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 35),
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffeee8e8),
                        border: Border.all(color: Color(0xffeee8e8)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
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
                        padding: const EdgeInsets.only(left: 20.0),
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
                    SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: MaterialButton(
                        elevation: 0,
                        onPressed: () async {
                          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please enter both email and password'),
                              backgroundColor: Colors.red,
                            ));
                            return;
                          }

                          try {
                            final userCredential = await auth.signInWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            final user = userCredential.user;

                            if (user == null) {
                              throw Exception('User login unsuccessful');
                            }

                            Navigator.pushReplacementNamed(context, '/HomePage');
                          } catch (e) {
                            print('Error: $e');
                          }
                        },
                        color: Color(0xff7be1a6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: GoogleFonts.workSans(color: Color(0xff2c2c2e)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/RegisterPage');
                    },
                    child: Text(
                      ' Register',
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
