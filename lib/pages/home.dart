import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {


    data = ModalRoute.of(context).settings.arguments;
    print(data);


    String bg_Image = data['isDay'] ? 'day.jpg' : 'night.jpg';
    Color bg_Color = data['isDay'] ? Color(0xff8C6F84) : Color(0xff001C4C);
    Color text_color = data['isDay'] ? Colors.black: Colors.grey[200];




    return Scaffold(

      backgroundColor: bg_Color,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bg_Image'), //$bg_Image
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(Icons.edit_location,
                    color: text_color,

                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                          fontSize: 15.0,
                          letterSpacing: 0.5,
                        color: text_color,
                      ),)),
                SizedBox(height: 10.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        color: text_color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),

                Text(data['time'],
                style: TextStyle(
                    fontSize: 80.0,
                  color: text_color,



                ),),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
