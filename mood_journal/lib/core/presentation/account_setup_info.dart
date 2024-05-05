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
  runApp(AccountSetupInfoPage());
}

class AccountSetupInfoPage extends StatefulWidget {
  @override
  State<AccountSetupInfoPage> createState() => _AccountInfoPage();
}

class _AccountInfoPage extends State<AccountSetupInfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: ColourPalette.white,
            appBar: AppBar(
              leading: BackButton(),
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
                            Text("Step 1: Account Information",
                                style: TextStyle(
                                    color: ColourPalette.black,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                            Image.asset(Images.step1),
                            Column(
                              //column for the text fields
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 40),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 10),
                                          child: Text(
                                            "Name",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColourPalette.black),
                                          ),
                                        ),
                                        TextFormField(
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: ColourPalette.white,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "Enter name",
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color: ColourPalette
                                                        .lightgrayText),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8)))),
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText))
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 40),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 10),
                                          child: Text(
                                            "Username",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColourPalette.black),
                                          ),
                                        ),
                                        TextFormField(
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: ColourPalette.white,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "Enter username",
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color: ColourPalette
                                                        .lightgrayText),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8)))),
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText))
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 40),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 10),
                                          child: Text(
                                            "Email Address",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColourPalette.black),
                                          ),
                                        ),
                                        TextFormField(
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: ColourPalette.white,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText:
                                                    "Enter email address",
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color: ColourPalette
                                                        .lightgrayText),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8)))),
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText))
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 40),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 10),
                                          child: Text(
                                            "Password",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColourPalette.black),
                                          ),
                                        ),
                                        TextFormField(
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8)))),
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText))
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 40),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 10),
                                          child: Text(
                                            "Retype Password",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColourPalette.black),
                                          ),
                                        ),
                                        TextFormField(
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: ColourPalette.white,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "Retype password",
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color: ColourPalette
                                                        .lightgrayText),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8)))),
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText))
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 40),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 0, 10),
                                          child: Text(
                                            "Phone",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontFamily: 'Inter',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColourPalette.black),
                                          ),
                                        ),
                                        TextFormField(
                                            decoration: const InputDecoration(
                                                filled: true,
                                                fillColor: ColourPalette.white,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                labelText: "Enter phone number",
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color: ColourPalette
                                                        .lightgrayText),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8)))),
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                                color: ColourPalette
                                                    .lightgrayText))
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            SizedBox(
                              width: 200,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: ColourPalette.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "Continue",
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
