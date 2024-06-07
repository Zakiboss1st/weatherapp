import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Weather? weather;
  final openweather = WeatherFactory("cb4053634d3b66a0f7dfade31e6aa463");
  String Cityname = "";

  getweather() async {
    try {
      weather = await openweather.currentWeatherByCityName(Cityname);
      setState(() {});
    } catch (e) {
      print("The error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search by city name"),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(29),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  Cityname = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search by city",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    getweather();
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: weather != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${weather!.temperature!.celsius!.round()} C.",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${weather!.weatherDescription}",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
