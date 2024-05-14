import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_journal/core/presentation/account_setup_info.dart';
import 'package:mood_journal/core/presentation/home_page.dart';
import 'package:mood_journal/core/presentation/twofa_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
import 'package:mood_journal/core/ui_features/images.dart';

class TwoFactorSendPage extends StatefulWidget {
  @override
  State<TwoFactorSendPage> createState() => _TwoFactorSendPage();
}

class _TwoFactorSendPage extends State<TwoFactorSendPage> {
  bool emailSelected = false;
  bool smsSelected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: ColourPalette.indigo,
            appBar: AppBar(
              leading: BackButton(),
              elevation: 0,
              backgroundColor: ColourPalette.indigo,
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
                                "T W O  F A C T O R ",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontFamily: 'Inter',
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                        color: ColourPalette.purple),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "AU T H E N T I C A T I O N",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontFamily: 'Inter',
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                        color: ColourPalette.purple),
                              ),
                            ),
                            SizedBox(
                              height: 180,
                              width: 180,
                              child: Image.asset(Images.loginLogo2,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(height: 60),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "You are required to setup and use 2FA for the security of your profile",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.white),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  SizedBox(
                                    height: 94,
                                    width: 322,
                                    child: TextButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          emailSelected = !emailSelected;
                                          smsSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: ColourPalette.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      label: Text(
                                        "Send code to your email",
                                        style: TextStyle(
                                            color: ColourPalette.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                      icon: emailSelected
                                          ? ImageIcon(AssetImage(
                                              Images.radioButtonEmpty))
                                          : ImageIcon(
                                              AssetImage(
                                                  Images.radioButtonEmpty),
                                              color: ColourPalette.grayBox,
                                            ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  SizedBox(
                                    height: 94,
                                    width: 322,
                                    child: TextButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          smsSelected = !smsSelected;
                                          emailSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: ColourPalette.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      label: Text(
                                        "Send code by SMS",
                                        style: TextStyle(
                                            color: ColourPalette.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                      icon: smsSelected
                                          ? ImageIcon(AssetImage(
                                              Images.radioButtonEmpty))
                                          : ImageIcon(
                                              AssetImage(
                                                  Images.radioButtonEmpty),
                                              color: ColourPalette.grayBox,
                                            ),
                                    ),
                                  ),
                                ]),
                            SizedBox(height: 30),
                            SizedBox(height: 100),
                            SizedBox(
                              width: 200,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TwoFactorInputPage()));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: ColourPalette.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "Send",
                                  style: TextStyle(
                                      color: ColourPalette.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ]))),
            )));
  }
}
