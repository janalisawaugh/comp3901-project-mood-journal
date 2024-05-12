import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
// import 'package:provider/provider.dart';
import 'dart:ui' show lerpDouble;

import 'package:mood_journal/core/ui_features/images.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(AnalyticsPage());
}

class AnalyticsPage extends StatefulWidget {
  @override
  State<AnalyticsPage> createState() => _AnalyticsPage();
}

class _AnalyticsPage extends State<AnalyticsPage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    SignInPage(),
    LoginPage(),
    AccountSetupConsentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ColourPalette.white,
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: ColourPalette.white,
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
                                "A N A L Y T I C S",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontFamily: 'Inter',
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: ColourPalette.purple),
                              )),
                          SizedBox(height: 15),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 35, 10),
                            child: Text(
                              "R E C O M M E N D A T I O N S",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: ColourPalette.darkPurple),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: const Text(
                              "Based on your data entries today it seems you were mostly sad. We hope these recommendations will help you to feel better, sending hugs!",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 17,
                                  color: ColourPalette.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Image.asset(Images.recommendationIcon),
                                SizedBox(width: 15),
                                Text(
                                  "Have fun",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 17,
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Image.asset(Images.recommendationIcon),
                                SizedBox(width: 15),
                                Text(
                                  "Get money",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 17,
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Image.asset(Images.recommendationIcon),
                                SizedBox(width: 15),
                                Text(
                                  "Skip school",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 17,
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: const Text(
                              "Weekly reports and charts made from the analysis of your journal entries can be found here:",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 17,
                                  color: ColourPalette.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(height: 50),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              onPressed: () {}, //TODO add navigation
                              style: TextButton.styleFrom(
                                backgroundColor: ColourPalette.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Reports",
                                style: TextStyle(
                                    color: ColourPalette.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              onPressed: () {}, //TODO add navigation
                              style: TextButton.styleFrom(
                                backgroundColor: ColourPalette.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side:
                                        BorderSide(color: ColourPalette.black)),
                              ),
                              child: const Text(
                                "Charts",
                                style: TextStyle(
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                        ]))),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.homeIcon),
                      color: ColourPalette.black, size: 20),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.journalIcon),
                      color: ColourPalette.black, size: 20),
                  label: 'Journal'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.graphIcon),
                      color: ColourPalette.black, size: 20),
                  label: 'Analytics'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.profileIcon),
                      color: ColourPalette.black, size: 20),
                  label: 'Account'),
            ],
          ),
        ));
  }
}
