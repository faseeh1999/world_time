import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: (){
              print("Settings CLicked");
            },
          ),

        ],
        backgroundColor: Colors.cyan,
        title: Text("Home Screen",style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,

        ),
        ),
        centerTitle: true,

      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location")),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: RaisedButton(

                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                onPressed: () {},
                color: Colors.red,
                child: Text(
                  "Second Button",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
