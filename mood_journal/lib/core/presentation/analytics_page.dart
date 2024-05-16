import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/charts_page.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/reports_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
import 'package:mood_journal/core/ui_features/images.dart';

/// The `AnalyticsPage` class is a StatefulWidget in Dart that overrides the `createState` method to
/// return an instance of `_AnalyticsPage`. This page shows recommendations based on identified emotion from journal entries.
class AnalyticsPage extends StatefulWidget {
  @override
  State<AnalyticsPage> createState() => _AnalyticsPage();
}

class _AnalyticsPage extends State<AnalyticsPage> {
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
                                Expanded(
                                  child: Text(
                                    "Allow yourself to feel sadness and seek comfort through self-care and support",
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 17,
                                        color: ColourPalette.black,
                                        fontWeight: FontWeight.w400),
                                  ),
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
                              /// The `onPressed` function is
                              /// responsible for navigating to the `ReportsPage` when a button is
                              /// pressed.
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReportsPage()));
                              },
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
                              /// The `onPressed` function is
                              /// responsible for handling the action when the corresponding button is
                              /// pressed. In this case, when the button labeled "Charts" is pressed,
                              /// the function navigates to the `ChartsPage` by pushing a new route onto
                              /// the navigator's stack using `Navigator.push`. This allows the user to
                              /// move from the current page (AnalyticsPage) to the ChartsPage for
                              /// viewing charts related to the data analysis.
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChartsPage()));
                              },
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
        ));
  }
}
