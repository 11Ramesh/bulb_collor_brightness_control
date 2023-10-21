import 'package:flutter/material.dart';
import 'package:led_control_2/home.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(7, 169, 181, 0.996),
                Color.fromRGBO(0, 100, 231, 0.914)
              ], begin: Alignment.bottomLeft, end: Alignment.topCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              child: Image.asset(
                "assets/icon/image_hame.webp",
              ),
            ),
            SizedBox(
              height: 180,
            ),
            start_btn(),
          ],
        ),
      ),
    );
  }

  Widget start_btn() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home()));
        },
        child: Text(
          "Get Start",
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
            backgroundColor: Color.fromRGBO(87, 117, 236, 1),
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )));
  }
}
