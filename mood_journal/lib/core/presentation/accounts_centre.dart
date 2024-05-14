import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/feedback_page.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
// import 'package:provider/provider.dart';
//import 'dart:ui' show lerpDouble;

import 'package:mood_journal/core/ui_features/images.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class AccountCentrePage extends StatefulWidget {
  @override
  State<AccountCentrePage> createState() => _AccountCentrePage();
}

class _AccountCentrePage extends State<AccountCentrePage> {
  String fullName = "F U L L  N A M E";
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
                            "A C C O U N T S  C E N T R E",
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
                      SizedBox(
                          //name box
                          height: 93,
                          width: 323,
                          child: Material(
                              elevation: 8,
                              color: ColourPalette.grayBox,
                              shadowColor: ColourPalette.gray,
                              borderRadius: BorderRadius.circular(5),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 53,
                                      width: 54,
                                      child: Image.asset(Images.profilePicture,
                                          fit: BoxFit.cover),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      fullName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ColourPalette.black,
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ))),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 35, 10),
                        child: Text(
                          "A C C O U N T  S E T T I N G S",
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
                      Container(
                        height: 32,
                        width: 334,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                        ]),
                        child: Material(
                            color: ColourPalette.grayBox,
                            elevation: 8,
                            shadowColor: ColourPalette.gray,
                            borderRadius: BorderRadius.circular(5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                Images.recommendationIcon,
                                //fit: BoxFit.cover,
                                color: ColourPalette.black,
                              ),
                              label: Text(
                                "Change Password",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 32,
                        width: 334,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                        ]),
                        child: Material(
                            color: ColourPalette.grayBox,
                            elevation: 8,
                            shadowColor: ColourPalette.gray,
                            borderRadius: BorderRadius.circular(5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                Images.recommendationIcon,
                                //fit: BoxFit.cover,
                                color: ColourPalette.black,
                              ),
                              label: Text(
                                "Personal Details",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 32,
                        width: 334,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                        ]),
                        child: Material(
                            color: ColourPalette.grayBox,
                            elevation: 8,
                            shadowColor: ColourPalette.gray,
                            borderRadius: BorderRadius.circular(5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                Images.recommendationIcon,
                                //fit: BoxFit.cover,
                                color: ColourPalette.black,
                              ),
                              label: Text(
                                "Journal Entries",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 32,
                        width: 334,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                        ]),
                        child: Material(
                            color: ColourPalette.grayBox,
                            elevation: 8,
                            shadowColor: ColourPalette.gray,
                            borderRadius: BorderRadius.circular(5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                Images.recommendationIcon,
                                //fit: BoxFit.cover,
                                color: ColourPalette.black,
                              ),
                              label: Text(
                                "Resources",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 32,
                        width: 334,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                        ]),
                        child: Material(
                            color: ColourPalette.grayBox,
                            elevation: 8,
                            shadowColor: ColourPalette.gray,
                            borderRadius: BorderRadius.circular(5),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FeedbackPage()));
                              },
                              icon: Image.asset(
                                Images.recommendationIcon,
                                //fit: BoxFit.cover,
                                color: ColourPalette.black,
                              ),
                              label: Text(
                                "Feedback",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                          height: 32,
                          width: 334,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                          ]),
                          child: Material(
                              color: ColourPalette.grayBox,
                              elevation: 8,
                              shadowColor: ColourPalette.gray,
                              borderRadius: BorderRadius.circular(5),
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  Images.recommendationIcon,
                                  //fit: BoxFit.cover,
                                  color: ColourPalette.black,
                                ),
                                label: Text(
                                  "Notifications",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ))),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 35, 10),
                        child: Text(
                          "L O G I N",
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
                      Container(
                        height: 32,
                        width: 334,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                        ]),
                        child: Material(
                            color: ColourPalette.grayBox,
                            elevation: 8,
                            shadowColor: ColourPalette.gray,
                            borderRadius: BorderRadius.circular(5),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                              },
                              icon: Image.asset(
                                Images.recommendationIcon,
                                color: ColourPalette.black,
                              ),
                              label: Text(
                                "Log out",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 32,
                        width: 334,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(color: ColourPalette.gray, blurRadius: 4)
                        ]),
                        child: Material(
                            color: ColourPalette.grayBox,
                            elevation: 8,
                            shadowColor: ColourPalette.gray,
                            borderRadius: BorderRadius.circular(5),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                Images.recommendationIcon,
                                //fit: BoxFit.cover,
                                color: ColourPalette.black,
                              ),
                              label: Text(
                                "Delete profile",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                      ),
                      SizedBox(height: 50),
                    ]),
              ),
            ),
          ),
        ));
  }
}
