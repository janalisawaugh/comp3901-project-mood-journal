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
                            child: Image.asset(Images.loginLogo),
                          ),
                          SizedBox(height: 40),
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
