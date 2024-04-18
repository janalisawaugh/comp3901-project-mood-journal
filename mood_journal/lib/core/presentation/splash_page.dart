import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
import 'dart:ui' show lerpDouble;

import 'package:mood_journal/core/ui_features/images.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const SplashPage());
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(),
            body: Center(
                child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              child: Text(
                            "Mood Journaling App",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontFamily: 'Roboto',
                                    fontSize: 26,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                          )),
                          SizedBox(child: Image.asset(Images.logo))
                        ])))));
  }
}
