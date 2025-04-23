import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Help & Support",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FAQs',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ExpansionTile(
                  shape: Border(),
                  title: Row(
                    children: [
                      Text(
                        'How do I use the app?',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_drop_down),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        "To use the app, create an account, log in, and navigate through the menu to access features.",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ExpansionTile(
                  shape: Border(),
                  title: Row(
                    children: [
                      Text(
                        'Is internet required?',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_drop_down),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        "Yes, you need internet to sync your data.",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ExpansionTile(
                  shape: Border(),
                  title: Row(
                    children: [
                      Text(
                        'How to contact support?',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_drop_down),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        "You can reach out via the 'Contact Us' section in the app, or email us directly at support@farmingapp.com.",
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email:'),
                  subtitle: Text('support@farmingapp.com'),
                ),
              ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone:'),
                  subtitle: Text('+1 800 88 5252'),
                ),
              SizedBox(height: 20),
              Text(
                'Video Tutorials',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.play_circle_fill),
                title: Text('Getting Started'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.play_circle_fill),
                title: Text('More Features'),
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
