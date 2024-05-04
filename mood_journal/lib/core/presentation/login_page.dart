import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
// import 'package:provider/provider.dart';
import 'dart:ui' show lerpDouble;

import 'package:mood_journal/core/ui_features/images.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//functionality for onpressed
void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: ColourPalette.indigo,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColourPalette.indigo,
            ),
            body: Center(
                child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Image.asset(Images.loginLogo),
                          ),
                          Center(
                            child: SizedBox(
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
                                  "Create Account",
                                  style: TextStyle(
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: SizedBox(
                              width: 200,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInPage()));
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
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ])))));
  }
}
