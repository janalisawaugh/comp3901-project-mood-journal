import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_journal/core/presentation/account_setup_about.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
import 'package:mood_journal/core/ui_features/images.dart';

/// The `AccountSetupInfoPage` class is a StatefulWidget in Dart that returns an instance of
/// `_AccountInfoPage` as its state.
class AccountSetupInfoPage extends StatefulWidget {
  @override
  State<AccountSetupInfoPage> createState() => _AccountInfoPage();
}

class _AccountInfoPage extends State<AccountSetupInfoPage> {
  //For getting text from text fields, add controllers to respective fields
  //then use setState to assign controller values to string variables
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String collectedName = "";
  String collectedUsername = "";
  String collectedEmail = "";
  String collectedPassword = "";
  String collectedPhone = "";

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed to avoid memory leaks
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
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
                /// The above Dart code is using the `Navigator` class to pop the current route off the
                /// navigation stack, effectively closing the current screen and returning to the
                /// previous screen in the navigation stack. Used in all pages after this
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
                            Text("Step 1: Account Information",
                                style: TextStyle(
                                    color: ColourPalette.black,
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 15),
                            Image.asset(Images.step1),
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
                                            child: TextFormField(
                                                controller: nameController,
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        ColourPalette.white,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
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
                                                controller: userNameController,
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
                                        SizedBox(
                                          height: 40,
                                          width: 283,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                controller: emailController,
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        ColourPalette.white,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
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
                                        SizedBox(
                                          height: 40,
                                          width: 283,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                obscureText: true,
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        ColourPalette.white,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
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
                                        SizedBox(
                                          height: 40,
                                          width: 283,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                controller: passwordController,
                                                obscureText: true,
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        ColourPalette.white,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    labelText:
                                                        "Retype password",
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
                                        SizedBox(
                                          height: 40,
                                          width: 283,
                                          child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: TextFormField(
                                                controller: phoneController,
                                                decoration: const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        ColourPalette.white,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .never,
                                                    labelText:
                                                        "Enter phone number",
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
                              ],
                            ),
                            SizedBox(height: 50),
                            SizedBox(
                              width: 200,
                              child: TextButton(
                                onPressed: () {
                                  /// Using the Navigator class to push a new
                                  /// route onto the navigation stack. It is navigating to the
                                  /// AccountSetupAboutPage using a MaterialPageRoute.
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AccountSetupAboutPage()));

                                  /// Using the `setState` method to update the
                                  /// state variables `collectedName`, `collectedUsername`,
                                  /// `collectedEmail`, `collectedPassword`, and `collectedPhone` with
                                  /// the values retrieved from the respective text controllers
                                  /// `nameController`, `userNameController`, `emailController`,
                                  /// `passwordController`, and `phoneController`. These values would be
                                  /// stored in the User database.This is typically
                                  /// used in Flutter applications to update the UI when the state of
                                  /// the application changes.
                                  setState(
                                    () {
                                      collectedName = nameController.text;
                                      collectedUsername =
                                          userNameController.text;
                                      collectedEmail = emailController.text;
                                      collectedPassword =
                                          passwordController.text;
                                      collectedPhone = phoneController.text;
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
