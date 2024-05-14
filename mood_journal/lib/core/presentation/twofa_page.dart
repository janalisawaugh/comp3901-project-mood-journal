import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_journal/core/presentation/account_setup_info.dart';
import 'package:mood_journal/core/presentation/home_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
import 'package:mood_journal/core/ui_features/images.dart';

class TwoFactorInputPage extends StatefulWidget {
  @override
  State<TwoFactorInputPage> createState() => _TwoFactorInputPage();
}

class _TwoFactorInputPage extends State<TwoFactorInputPage> {
  bool emailSelected = false;
  bool smsSelected = false;

  //For getting text from text fields, add controllers to respective fields
  //then use setState to assign controller values to string variables
  TextEditingController codeController = TextEditingController();

  String collectedCode = "";

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed to avoid memory leaks
    codeController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: ColourPalette.indigo,
            appBar: AppBar(
              leading: BackButton(),
              elevation: 0,
              backgroundColor: ColourPalette.indigo,
            ),
            body: SingleChildScrollView(
              child: Center(
                  child: Container(
                      margin: const EdgeInsets.all(15.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "T W O  F A C T O R ",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontFamily: 'Inter',
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                        color: ColourPalette.purple),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "A U T H E N T I C A T I O N",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontFamily: 'Inter',
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                        color: ColourPalette.purple),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              width: 180,
                              child: Image.asset(Images.loginLogo2,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(height: 60),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "You are required to setup and use 2FA for the security of your profile",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.white),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  SizedBox(
                                    height: 94,
                                    width: 322,
                                    child: TextFormField(
                                        controller: codeController,
                                        decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: ColourPalette.white,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)))),
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 20,
                                            color: ColourPalette.black)),
                                  ),
                                ]),
                            SizedBox(height: 30),
                            SizedBox(height: 100),
                            SizedBox(
                              width: 200,
                              child: TextButton(
                                onPressed: () {
                                  //TODO fix navigation
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePageBar()));
                                  setState(() {
                                    collectedCode = codeController.text;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: ColourPalette.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "Done",
                                  style: TextStyle(
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ]))),
            )));
  }
}
