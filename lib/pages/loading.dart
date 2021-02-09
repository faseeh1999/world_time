import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {

  String time='loading';

  void setupWorldTime() async {
    WorldTime wt = WorldTime(location: 'Karachi',flag: 'pak.png',url: 'Asia/Karachi');
    await wt.getTime();
    setState(() {
      time=wt.time;
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
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
