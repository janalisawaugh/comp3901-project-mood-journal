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
  runApp(AccountSetupAboutPage());
}

class AccountSetupAboutPage extends StatefulWidget {
  @override
  State<AccountSetupAboutPage> createState() => _AccountAboutPage();
}

class _AccountAboutPage extends State<AccountSetupAboutPage> {
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
                            Text("Step 2: About You",
                                style: TextStyle(
                                    color: ColourPalette.black,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Image.asset(Images.step2),
                            Column(
                              //column for the text fields
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 20),
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
                                        SizedBox(
                                          height: 40,
                                          width: 283,
                                          child: Material(
                                            elevation: 5,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            // child: DropdownButtonFormField<
                                            //     String>(
                                            //   value: selectedValue,
                                            //   hint: Text("Day"),
                                            //   onChanged: (String newValue) {
                                            //     setState(() {
                                            //       selectedValue = newValue;
                                            //     });
                                            //   },
                                            //   onSaved: (String newValue) {

                                            //   },
                                            //   items: optionList.map<DropdownMenuItem
                                            // )
                                            // TextFormField(
                                            //     decoration: const InputDecoration(
                                            //         filled: true,
                                            //         fillColor:
                                            //             ColourPalette.white,
                                            //         floatingLabelBehavior:
                                            //             FloatingLabelBehavior
                                            //                 .never,
                                            //         labelText: "Enter name",
                                            //         labelStyle: TextStyle(
                                            //             fontFamily: 'Inter',
                                            //             fontSize: 12,
                                            //             color: ColourPalette
                                            //                 .lightgrayText),
                                            //         border: OutlineInputBorder(
                                            //             borderRadius:
                                            //                 BorderRadius.all(
                                            //                     Radius.circular(
                                            //                         5)),
                                            //             borderSide:
                                            //                 BorderSide.none)),
                                            //     style: TextStyle(
                                            //         fontFamily: 'Inter',
                                            //         fontSize: 12,
                                            //         color:
                                            //             ColourPalette.black)),
                                          ),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 20),
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
                                        SizedBox(
                                          height: 40,
                                          width: 283,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            ColourPalette.white,
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelText:
                                                            "Enter username",
                                                        labelStyle: TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontSize: 12,
                                                            color: ColourPalette
                                                                .lightgrayText),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide.none,
                                                        )),
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color:
                                                        ColourPalette.black)),
                                          ),
                                        )
                                      ]),
                                ),
                              ],
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
