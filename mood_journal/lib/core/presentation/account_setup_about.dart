import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';

class AccountSetupAboutPage extends StatefulWidget {
  @override
  State<AccountSetupAboutPage> createState() => _AccountAboutPage();
}

class _AccountAboutPage extends State<AccountSetupAboutPage> {
  // variables for icon buttons
  bool sunnyfilledSelected = false;
  bool partcloudfilledSelected = false;
  bool cloudyfilledSelected = false;
  bool rainyfilledSelected = false;
  bool thunderfilledSelected = false;
  bool windyfilledSelected = false;

  bool oneSelected = false;
  bool twoSelected = false;
  bool threeSelected = false;
  bool fourSelected = false;
  bool fiveSelected = false;

  //For getting text from text fields, add controllers to respective fields
  //then use setState to assign controller values to string variables
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController disorderController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  String collectedAge = "";
  String collectedGender = "";
  String collectedDisorder = "";
  String collectedHobby = "";

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed to avoid memory leaks
    ageController = TextEditingController();
    genderController = TextEditingController();
    disorderController = TextEditingController();
    hobbyController = TextEditingController();
    super.dispose();
  }

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
                                      const EdgeInsets.fromLTRB(0, 10, 130, 20),
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
                                            "Age",
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
                                          height: 35,
                                          width: 150,
                                          child: Material(
                                            elevation: 5,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: TextFormField(
                                                controller: ageController,
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        ColourPalette.white,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    labelText: "Enter age",
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 12,
                                                        color: ColourPalette
                                                            .lightgrayText),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        borderSide:
                                                            BorderSide.none)),
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    color:
                                                        ColourPalette.black)),
                                          ),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 130, 20),
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
                                            "Gender",
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
                                          height: 35,
                                          width: 150,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                controller: genderController,
                                                decoration:
                                                    const InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            ColourPalette.white,
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelText:
                                                            "Enter gender (F or M)",
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 10, 40, 20),
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
                                            "Have you been diagnosed with a mental disorder?",
                                            textAlign: TextAlign.left,
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
                                          height: 35,
                                          width: 150,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                controller: disorderController,
                                                decoration:
                                                    const InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            ColourPalette.white,
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelText:
                                                            "Enter diagnosed mental disorder or 'None'",
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 70, 20),
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
                                            "What are your favourite hobbies?",
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
                                          height: 35,
                                          width: 150,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                controller: hobbyController,
                                                decoration:
                                                    const InputDecoration(
                                                        filled: true,
                                                        fillColor:
                                                            ColourPalette.white,
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        labelText:
                                                            "Enter hobbies",
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
                                            "What is your favourite type of weather?",
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
                                        Column(
                                          //for weather buttons
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: 61,
                                                    width: 69,
                                                    child: IconButton.filled(
                                                      color: sunnyfilledSelected
                                                          ? ColourPalette.white
                                                          : ColourPalette
                                                              .purple,
                                                      icon: ImageIcon(
                                                        AssetImage(
                                                            Images.sunny),
                                                        color:
                                                            ColourPalette.black,
                                                      ),
                                                      style:
                                                          IconButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: BorderSide(
                                                                color:
                                                                    ColourPalette
                                                                        .black)),
                                                      ),
                                                      isSelected:
                                                          sunnyfilledSelected,
                                                      selectedIcon: ImageIcon(
                                                          AssetImage(
                                                              Images.sunny),
                                                          color: ColourPalette
                                                              .white),
                                                      onPressed: () {
                                                        setState(() {
                                                          sunnyfilledSelected =
                                                              !sunnyfilledSelected;
                                                          partcloudfilledSelected =
                                                              false;
                                                          cloudyfilledSelected =
                                                              false;
                                                          rainyfilledSelected =
                                                              false;
                                                          thunderfilledSelected =
                                                              false;
                                                          windyfilledSelected =
                                                              false;
                                                        });
                                                      },
                                                    )),
                                                SizedBox(width: 5),
                                                SizedBox(
                                                    height: 61,
                                                    width: 69,
                                                    child: IconButton.filled(
                                                      color:
                                                          partcloudfilledSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .purple,
                                                      icon: ImageIcon(
                                                        AssetImage(Images
                                                            .partlycloudy),
                                                        color:
                                                            ColourPalette.black,
                                                      ),
                                                      style:
                                                          IconButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: BorderSide(
                                                                color:
                                                                    ColourPalette
                                                                        .black)),
                                                      ),
                                                      isSelected:
                                                          partcloudfilledSelected,
                                                      selectedIcon: ImageIcon(
                                                          AssetImage(Images
                                                              .partlycloudy),
                                                          color: ColourPalette
                                                              .white),
                                                      onPressed: () {
                                                        setState(() {
                                                          partcloudfilledSelected =
                                                              !partcloudfilledSelected;
                                                          sunnyfilledSelected =
                                                              false;
                                                          cloudyfilledSelected =
                                                              false;
                                                          rainyfilledSelected =
                                                              false;
                                                          thunderfilledSelected =
                                                              false;
                                                          windyfilledSelected =
                                                              false;
                                                        });
                                                      },
                                                    )),
                                                SizedBox(width: 5),
                                                SizedBox(
                                                    height: 61,
                                                    width: 69,
                                                    child: IconButton.filled(
                                                      color:
                                                          cloudyfilledSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .purple,
                                                      icon: ImageIcon(
                                                        AssetImage(
                                                            Images.cloudy),
                                                        color:
                                                            ColourPalette.black,
                                                      ),
                                                      style:
                                                          IconButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: BorderSide(
                                                                color:
                                                                    ColourPalette
                                                                        .black)),
                                                      ),
                                                      isSelected:
                                                          cloudyfilledSelected,
                                                      selectedIcon: ImageIcon(
                                                          AssetImage(
                                                              Images.cloudy),
                                                          color: ColourPalette
                                                              .white),
                                                      onPressed: () {
                                                        setState(() {
                                                          cloudyfilledSelected =
                                                              !cloudyfilledSelected;
                                                          partcloudfilledSelected =
                                                              false;
                                                          sunnyfilledSelected =
                                                              false;
                                                          rainyfilledSelected =
                                                              false;
                                                          thunderfilledSelected =
                                                              false;
                                                          windyfilledSelected =
                                                              false;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                            SizedBox(height: 25),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: 61,
                                                    width: 69,
                                                    child: IconButton.filled(
                                                      color: rainyfilledSelected
                                                          ? ColourPalette.white
                                                          : ColourPalette
                                                              .purple,
                                                      icon: ImageIcon(
                                                        AssetImage(
                                                            Images.rainy),
                                                        color:
                                                            ColourPalette.black,
                                                      ),
                                                      style:
                                                          IconButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: BorderSide(
                                                                color:
                                                                    ColourPalette
                                                                        .black)),
                                                      ),
                                                      isSelected:
                                                          rainyfilledSelected,
                                                      selectedIcon: ImageIcon(
                                                          AssetImage(
                                                              Images.rainy),
                                                          color: ColourPalette
                                                              .white),
                                                      onPressed: () {
                                                        setState(() {
                                                          rainyfilledSelected =
                                                              !rainyfilledSelected;
                                                          partcloudfilledSelected =
                                                              false;
                                                          cloudyfilledSelected =
                                                              false;
                                                          sunnyfilledSelected =
                                                              false;
                                                          thunderfilledSelected =
                                                              false;
                                                          windyfilledSelected =
                                                              false;
                                                        });
                                                      },
                                                    )),
                                                SizedBox(width: 5),
                                                SizedBox(
                                                    height: 61,
                                                    width: 69,
                                                    child: IconButton.filled(
                                                      color:
                                                          thunderfilledSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .purple,
                                                      icon: ImageIcon(
                                                        AssetImage(Images
                                                            .thunderstorm),
                                                        color:
                                                            ColourPalette.black,
                                                      ),
                                                      style:
                                                          IconButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: BorderSide(
                                                                color:
                                                                    ColourPalette
                                                                        .black)),
                                                      ),
                                                      isSelected:
                                                          thunderfilledSelected,
                                                      selectedIcon: ImageIcon(
                                                          AssetImage(Images
                                                              .thunderstorm),
                                                          color: ColourPalette
                                                              .white),
                                                      onPressed: () {
                                                        setState(() {
                                                          thunderfilledSelected =
                                                              !thunderfilledSelected;
                                                          sunnyfilledSelected =
                                                              false;
                                                          cloudyfilledSelected =
                                                              false;
                                                          rainyfilledSelected =
                                                              false;
                                                          partcloudfilledSelected =
                                                              false;
                                                          windyfilledSelected =
                                                              false;
                                                        });
                                                      },
                                                    )),
                                                SizedBox(width: 5),
                                                SizedBox(
                                                    height: 61,
                                                    width: 69,
                                                    child: IconButton.filled(
                                                      color: windyfilledSelected
                                                          ? ColourPalette.white
                                                          : ColourPalette
                                                              .purple,
                                                      icon: ImageIcon(
                                                        AssetImage(
                                                            Images.windy),
                                                        color:
                                                            ColourPalette.black,
                                                      ),
                                                      style:
                                                          IconButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            side: BorderSide(
                                                                color:
                                                                    ColourPalette
                                                                        .black)),
                                                      ),
                                                      isSelected:
                                                          windyfilledSelected,
                                                      selectedIcon: ImageIcon(
                                                          AssetImage(
                                                              Images.windy),
                                                          color: ColourPalette
                                                              .white),
                                                      onPressed: () {
                                                        setState(() {
                                                          windyfilledSelected =
                                                              !windyfilledSelected;
                                                          partcloudfilledSelected =
                                                              false;
                                                          sunnyfilledSelected =
                                                              false;
                                                          rainyfilledSelected =
                                                              false;
                                                          thunderfilledSelected =
                                                              false;
                                                          cloudyfilledSelected =
                                                              false;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 40, 20),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 5, 0, 10),
                                          child: Text(
                                            "How would you rate your diet?",
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
                                        Column(
                                          //buttons for diet rating
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 5, 15, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "V E R Y  U N H E A L T H Y",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall
                                                        ?.copyWith(
                                                            fontFamily: 'Inter',
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: ColourPalette
                                                                .purple),
                                                  ),
                                                  Text(
                                                    "H E A L T H Y",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall
                                                        ?.copyWith(
                                                            fontFamily: 'Inter',
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: ColourPalette
                                                                .black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        oneSelected =
                                                            !oneSelected;
                                                        twoSelected = false;
                                                        threeSelected = false;
                                                        fourSelected = false;
                                                        fiveSelected = false;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          oneSelected
                                                              ? ColourPalette
                                                                  .purple
                                                              : ColourPalette
                                                                  .white,
                                                      shape: CircleBorder(
                                                          side: BorderSide(
                                                              color:
                                                                  ColourPalette
                                                                      .black)),
                                                    ),
                                                    child: Text(
                                                      "1",
                                                      style: TextStyle(
                                                          color: oneSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .black,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        twoSelected =
                                                            !twoSelected;
                                                        oneSelected = false;
                                                        threeSelected = false;
                                                        fourSelected = false;
                                                        fiveSelected = false;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          twoSelected
                                                              ? ColourPalette
                                                                  .purple
                                                              : ColourPalette
                                                                  .white,
                                                      shape: CircleBorder(
                                                          side: BorderSide(
                                                              color:
                                                                  ColourPalette
                                                                      .black)),
                                                    ),
                                                    child: Text(
                                                      "2",
                                                      style: TextStyle(
                                                          color: twoSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .black,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        threeSelected =
                                                            !threeSelected;
                                                        oneSelected = false;
                                                        twoSelected = false;
                                                        fourSelected = false;
                                                        fiveSelected = false;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          threeSelected
                                                              ? ColourPalette
                                                                  .purple
                                                              : ColourPalette
                                                                  .white,
                                                      shape: CircleBorder(
                                                          side: BorderSide(
                                                              color:
                                                                  ColourPalette
                                                                      .black)),
                                                    ),
                                                    child: Text(
                                                      "3",
                                                      style: TextStyle(
                                                          color: threeSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .black,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        fourSelected =
                                                            !fourSelected;
                                                        oneSelected = false;
                                                        threeSelected = false;
                                                        twoSelected = false;
                                                        fiveSelected = false;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          fourSelected
                                                              ? ColourPalette
                                                                  .purple
                                                              : ColourPalette
                                                                  .white,
                                                      shape: CircleBorder(
                                                          side: BorderSide(
                                                              color:
                                                                  ColourPalette
                                                                      .black)),
                                                    ),
                                                    child: Text(
                                                      "4",
                                                      style: TextStyle(
                                                          color: fourSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .black,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        fiveSelected =
                                                            !fiveSelected;
                                                        oneSelected = false;
                                                        threeSelected = false;
                                                        fourSelected = false;
                                                        twoSelected = false;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          fiveSelected
                                                              ? ColourPalette
                                                                  .purple
                                                              : ColourPalette
                                                                  .white,
                                                      shape: CircleBorder(
                                                          side: BorderSide(
                                                              color:
                                                                  ColourPalette
                                                                      .black)),
                                                    ),
                                                    child: Text(
                                                      "5",
                                                      style: TextStyle(
                                                          color: fiveSelected
                                                              ? ColourPalette
                                                                  .white
                                                              : ColourPalette
                                                                  .black,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ])
                                          ],
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                            SizedBox(
                              width: 200,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AccountSetupConsentPage()));
                                  setState(
                                    () {
                                      collectedAge = ageController.text;
                                      collectedGender = genderController.text;
                                      collectedDisorder =
                                          disorderController.text;
                                      collectedHobby = hobbyController.text;
                                    },
                                  );
                                },
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
