import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime wt = WorldTime(
        location: 'Karachi', flag: 'pak.png', url: 'Asia/Karachi');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDay': wt.isDay,
    });
  }






  @override
  void initState() {
    // TODO: implement initState


    super.initState();

    setupWorldTime();


  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(

        child: SpinKitRipple(
          color: Colors.white,
          size: 50.0,
        ),

      ),
    );
  }
}

