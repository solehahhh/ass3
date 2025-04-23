import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Developer's Profile",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage("assets/pic.jpg"),
                  ),
                ),
                Text(
                  'Anis Solehah',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'anissolehah.wrk@gmail.com',
                  style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ExpansionTile(
                      shape: Border(),
                      title: Row(
                        children: [
                          Icon(Icons.access_time_filled, size: 22, color: Color(0xff2b3522)),
                          SizedBox(width: 15),
                          Text(
                            'Age',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_drop_down, color: Color(0xff2b3522)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                          child: Text(
                            "20 years old",
                            style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ExpansionTile(
                      shape: Border(),
                      title: Row(
                        children: [
                          Icon(Icons.class_, size: 22, color: Color(0xff79802d)),
                          SizedBox(width: 15),
                          Text(
                            'Class',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_drop_down, color: Color(0xff79802d)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                          child: Text(
                            "Class 4A",
                            style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ExpansionTile(
                      shape: Border(),
                      title: Row(
                        children: [
                          Icon(Icons.engineering, size: 22, color: Color(0xffe6b483)),
                          SizedBox(width: 15),
                          Text(
                            'Education',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_drop_down, color: Color(0xffe6b483)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                          child: Text(
                            "Kolej Kemahiran Tinggi MARA (KKTM) Petaling Jaya",
                            style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ExpansionTile(
                      shape: Border(),
                      title: Row(
                        children: [
                          Icon(Icons.chat, size: 22, color: Color(0xff8dbac4)),
                          SizedBox(width: 15),
                          Text(
                            'Background',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_drop_down, color: Color(0xff8dbac4)),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                          child: Text(
                            "Flutter developer with a focus on creating clean, functional application. Enjoy turning ideas into interactive, user-friendly experiences.",
                            style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
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
      ),
    );
  }
}
