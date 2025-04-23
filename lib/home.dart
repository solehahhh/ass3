import 'package:ass3/chart.dart';
import 'package:ass3/help.dart';
import 'package:ass3/login.dart';
import 'package:ass3/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getFormattedDate() {
    return DateFormat('EEEE, MMMM d').format(DateTime.now());
  }

  final DatabaseReference myRTDB = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
    "https://fb-project-faea6-default-rtdb.asia-southeast1.firebasedatabase.app",
  ).ref();
  String tempValue = '0';
  String humValue = '0';
  String soilValue = '0';
  String distValue = '0';
  bool pumpSwitch = false;

  void readSensorValue() {
    myRTDB.child('Sensor').onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          tempValue = data['temperature'].toString();
          humValue = data['humidity'].toString();
          soilValue = data['soil'].toString();
          distValue = data['distance'].toString();

          double temp = double.tryParse(tempValue) ?? 0;
          double hum = double.tryParse(humValue) ?? 0;
          double soil = double.tryParse(soilValue) ?? 0;
          double dist = double.tryParse(distValue) ?? 0;

          tempSpots.add(FlSpot(xValue.toDouble(), temp));
          humSpots.add(FlSpot(xValue.toDouble(), hum));
          soilSpots.add(FlSpot(xValue.toDouble(), soil));
          distSpots.add(FlSpot(xValue.toDouble(), dist));

          if (tempSpots.length > 20) tempSpots.removeAt(0);
          if (humSpots.length > 20) humSpots.removeAt(0);
          if (soilSpots.length > 20) soilSpots.removeAt(0);
          if (distSpots.length > 20) distSpots.removeAt(0);

          xValue++;
        });
      }
    });

    myRTDB.child('Actuator/led').onValue.listen((event) {
      final value = event.snapshot.value as bool?;
      setState(() {
        pumpSwitch = value ?? false;
      });
    });
  }

  void updatePumpSwitch(bool value) {
    myRTDB.child('Actuator/led').set(value);
    setState(() {
      pumpSwitch = value;
    });
  }

  List<FlSpot> tempSpots = [];
  List<FlSpot> humSpots = [];
  List<FlSpot> soilSpots = [];
  List<FlSpot> distSpots = [];
  int xValue = 0;

  @override
  void initState() {
    super.initState();
    readSensorValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8),
            child: IconButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  } catch (e) {
                    print("Error during logout: $e");
                  }
                },
                icon: Icon(Icons.logout, color: Colors.black, size: 25)
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xff1f1f1f),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.eco, size: 50, color: Colors.greenAccent),
                    SizedBox(width: 12),
                    Text(
                      'Smart Farming',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      leading: Icon(Icons.home, color: Colors.white70),
                      title: Text('Home',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                      leading: Icon(Icons.person, color: Colors.white70),
                      title: Text('Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage()));
                      },
                      leading: Icon(Icons.help_outline, color: Colors.white70),
                      title: Text('Help',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () async {
                  try {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  } catch (e) {
                    print("Error during logout: $e");
                  }
                },
                leading: Icon(Icons.logout, color: Colors.white70),
                title: Text('Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, User',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Dashboard',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorColor: Color(0xff564324),
                  tabs: [
                    Tab(text: 'Readings'),
                    Tab(text: 'Chart'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xff2b3522),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.thermostat, size: 30, color: Colors.white),
                                      SizedBox(height: 8),
                                      Text(
                                        'Temperature',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '$tempValue °C',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xff79802d),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.water_drop, size: 30, color: Colors.white),
                                      SizedBox(height: 8),
                                      Text(
                                        'Humidity',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '$humValue %',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xffe5ecd6),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.eco, size: 30),
                                      SizedBox(height: 8),
                                      Text(
                                        'Soil Moisture',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '$soilValue %',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xff8dbac4),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.linear_scale, size: 30),
                                      SizedBox(height: 8),
                                      Text(
                                        'Distance',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '$distValue cm',
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Color(0xffe6b483),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.gas_meter, size: 30, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'Pump',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Switch(
                                  activeColor: Color(0xffe57402),
                                  value: pumpSwitch,
                                  onChanged: (bool value) {
                                    updatePumpSwitch(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SensorChart(title: 'Temperature (°C)', data: tempSpots, color: Colors.red),
                          SensorChart(title: 'Humidity (%)', data: humSpots, color: Colors.blue),
                          SensorChart(title: 'Soil Moisture (%)', data: soilSpots, color: Colors.green),
                          SensorChart(title: 'Distance (cm)', data: distSpots, color: Colors.orange),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}