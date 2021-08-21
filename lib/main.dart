import 'package:flutter/material.dart';
import 'package:hng_i8_stage_2_task/rounded_button.dart';
import 'package:hng_i8_stage_2_task/text_form_field_container.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff009688)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  String? text;
  var formKey = GlobalKey<FormState>();

  var i4gURL = 'https://ingressive.org/';
  var zuriURL = 'https://internship.zuri.team/';
  var hngURL = 'https://hng.tech/';

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onTap: () => _launchURL(hngURL),
          child: Image.asset('assets/hng.png', height: 55),
        ),
        shape: CurvedShape(_mediaQuery.height * 0.2),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: _mediaQuery.height * 0.3),
            TextFormFieldContainer(
              controller: controller,
              labelText: 'Enter an input'
            ),
            SizedBox(height: _mediaQuery.height * 0.1),
            RoundedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  var snackBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: Text(
                      controller.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Color(0xff009688),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
            SizedBox(height: 100),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () => _launchURL(i4gURL),
                      child: Image.asset('assets/i4g.png', height: 40)),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () => _launchURL(zuriURL),
                      child: Image.asset('assets/zuri.png', height: 40)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CurvedShape extends ContinuousRectangleBorder {
  const CurvedShape(this.curveHeight);

  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(rect.size.width / 5, rect.size.height + curveHeight * 2,
        rect.size.width, rect.size.height)
    ..lineTo(rect.size.width, 0)
    ..close();
}
