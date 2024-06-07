import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: weather(),
    );
  }
}

class weather extends StatefulWidget {
  const weather({super.key});

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/weather.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcom To",
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.9)),
                    child: Row(
                      children: [
                        Text(
                          "Weather App ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.breeSerif(
                              fontWeight: FontWeight.w400,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Icon(
                            Icons.wb_sunny,
                            size: 40,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Search()));
        },
        backgroundColor: Colors.white.withOpacity(0.8),
        label: Text("Search"),
      ),
    );
  }
}
