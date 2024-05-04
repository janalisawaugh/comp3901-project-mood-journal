import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
// import 'package:provider/provider.dart';
import 'dart:ui' show lerpDouble;

import 'package:mood_journal/core/ui_features/images.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const SignInPage());
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
            body: Center(
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
                                TextFormField(
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: ColourPalette.white,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: "Enter email address",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)))),
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        color: ColourPalette.lightgrayText))
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
                                TextFormField(
                                    decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: ColourPalette.white,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: "Enter password",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)))))
                              ]),
                          SizedBox(height: 100),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              onPressed: () {},
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
                          const Text("Don't have an account? Create an account",
                              style: TextStyle(
                                  color: ColourPalette.grayText,
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400))
                        ])))));
  }
}