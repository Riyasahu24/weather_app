import 'package:flutter/material.dart';
import 'package:waether_app/activity/location.dart';
import 'package:waether_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class loading extends StatefulWidget {
  String location;
  loading({super.key, required this.location});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;

  // String temperature = "loading";
  void startapp() async {
    worker instance = worker(loc: widget.location);
    await instance.getdata();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "loc_value": widget.location,
      });
    });
  }

  void initState() {
    startapp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://lottie.host/3a01e62d-008a-44a4-8895-ca85e6de8777/r7Nh4MBwMl.json",
                height: 300,
                width: 300),
            // Image.asset(
            //   "images/weather.png",
            //   height: 200,
            //   width: 150,
            // ),
            Text(
              "Mausam App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitThreeBounce(
              color: Colors.white,
              size: 60,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
