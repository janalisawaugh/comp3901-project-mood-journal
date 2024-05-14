import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_journal/core/presentation/account_setup_info.dart';
import 'package:mood_journal/core/presentation/home_page.dart';
import 'package:mood_journal/core/presentation/twofa_send_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
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
                                  "S I G N  I N",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontFamily: 'Inter',
                                          fontSize: 25,
                                          fontWeight: FontWeight.normal,
                                          color: ColourPalette.purple),
                                )),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 0, 10),
                                    child: Text(
                                      "Email Address",
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
                                  SizedBox(
                                    height: 40,
                                    width: 283,
                                    child: TextFormField(
                                        decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: ColourPalette.white,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Enter email address",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)))),
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            color: ColourPalette.black)),
                                  )
                                ]),
                            SizedBox(height: 30),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 0, 10),
                                    child: Text(
                                      "Password",
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
                                  SizedBox(
                                    height: 40,
                                    width: 283,
                                    child: TextFormField(
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: ColourPalette.white,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            labelText: "Enter password",
                                            labelStyle: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                  )
                                ]),
                            SizedBox(height: 100),
                            SizedBox(
                              width: 200,
                              child: TextButton(
                                onPressed: () {
                                  //TODO fix navigation
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TwoFactorSendPage()));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: ColourPalette.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                      color: ColourPalette.grayText,
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Create an account ",
                                  style: TextStyle(
                                      color: ColourPalette.aquamarine,
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AccountSetupInfoPage()))),
                            ]))
                          ]))),
            )));
  }
}
