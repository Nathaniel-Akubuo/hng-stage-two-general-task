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
      theme: ThemeData(
          primaryColor: Color(0xff00BCD4), accentColor: Color(0xff009688)),
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff923FE2),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => _launchURL(hngURL),
                child: Image.asset('assets/hng.png', height: 75),
              ),
              SizedBox(height: 100),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormFieldContainer(
                      controller: controller,
                    ),
                    SizedBox(height: 100),
                    RoundedButton(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          var snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color(0xffB2EBF2),
                            content: Text(
                              controller.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff212121),
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 150,
              ),
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
      ),
    );
  }
}
