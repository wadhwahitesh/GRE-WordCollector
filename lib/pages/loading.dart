import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    sendData();

    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, '/search', arguments: prefs);
    // });
  }

  void sendData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2), (){});
    Navigator.pushReplacementNamed(context, '/search', arguments: prefs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors: <Color>[Colors.blue[800]!, Colors.blue[200]!],
            ),
          ),
          child: Center(
            child: Text("GRE WordCollector",
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'Satisfy',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
          ),
        ),
      ),
    );
  }
}
