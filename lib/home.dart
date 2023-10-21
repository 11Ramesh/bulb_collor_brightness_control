import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  DatabaseReference dbref = FirebaseDatabase.instance.ref();
  int r = 1;
  int g = 0;
  int b = 0;
  int a = 0;
  Color choice_color = Colors.red;
  double slidet_value = 0.0;
  final TextEditingController text1 = TextEditingController();
  int bright_widget = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            try {
              Navigator.pop(context);
            } catch (e) {
              print(e);
            }
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Color Controller',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            show_text(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bright_widget == 1
                    ? Brightness_icon_low()
                    : bright_widget == 2
                        ? Brightness_icon_midle()
                        : Brightness_icon_hight(),
                slider()
              ],
            ),
            SizedBox(
              height: 30,
            ),
            color_picker(),
          ],
        ),
      ),
    );
  }

  Widget color_picker() {
    return ColorPicker(
        enableAlpha: false,
        paletteType: PaletteType.hueWheel,
        pickerColor: choice_color,
        colorPickerWidth: 370,
        onColorChanged: (color) {
          setState(() {
            choice_color = color;
            color_convert_value();
            function_database();
          });
        });
  }

  void color_convert_value() {
    List<int> getRGB() {
      return [
        choice_color.red,
        choice_color.green,
        choice_color.blue,
      ];
    }

    r = choice_color.red;
    g = choice_color.green;
    b = choice_color.blue;
  }

  void function_database() {
    Map<String, dynamic> data = {
      "RED": r,
      "GREEN": g,
      "BLUE": b,
      "ALPHA": 2.56 * a,
    };
    try {
      dbref.child("LED").set(data).then((value) {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    function_database();
    super.initState();
  }

  Widget slider() {
    return Container(
      width: 300,
      child: Slider(
          value: slidet_value,
          min: 0.0,
          max: 100.0,
          divisions: 100,
          activeColor: choice_color,
          onChanged: (value) {
            setState(() {
              if (value < 33) {
                bright_widget = 1;
              } else if (value < 80) {
                bright_widget = 2;
              } else {
                bright_widget = 3;
              }

              slidet_value = value;
              a = value.toInt();
              text1.text = value.toStringAsFixed(0);
              function_database();
            });
          }),
    );
  }

  Widget show_text() {
    return Text(
      '$a' + '%',
      style: TextStyle(fontSize: 20),
    );
  }

  Widget Brightness_icon_hight() {
    return Icon(
      Icons.brightness_7,
      size: 35,
    );
  }

  Widget Brightness_icon_low() {
    return Icon(
      Icons.brightness_5_sharp,
      size: 35,
    );
  }

  Widget Brightness_icon_midle() {
    return Icon(
      Icons.brightness_6,
      size: 35,
    );
  }
}
