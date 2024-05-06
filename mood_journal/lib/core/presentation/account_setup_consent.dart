import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
// import 'package:provider/provider.dart';
import 'dart:ui' show lerpDouble;

import 'package:mood_journal/core/ui_features/images.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(AccountSetupConsentPage());
}

class AccountSetupConsentPage extends StatefulWidget {
  @override
  State<AccountSetupConsentPage> createState() => _AccountConsentPage();
}

class _AccountConsentPage extends State<AccountSetupConsentPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: ColourPalette.white,
            appBar: AppBar(
              leading: BackButton(),
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
                                  "A C C O U N T  S E T U P",
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
                            SizedBox(
                              height: 180,
                              width: 180,
                              child: Image.asset(Images.accountsetuplogo,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(height: 20),
                            Text("Step 3: Your Consent",
                                style: TextStyle(
                                    color: ColourPalette.black,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Image.asset(Images.step3),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: const Text(
                                "This user consents to the collection, processing and storing of their information from inputs through analyses and algorithms, and to the reception of the outputs of the analyses used as a basis for recommendations of activities, charts and reports. ",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
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
                                  "I Consent",
                                  style: TextStyle(
                                      color: ColourPalette.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ]))),
            )));
  }
}
