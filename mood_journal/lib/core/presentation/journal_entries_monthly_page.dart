import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class JournalEntriesMonthlyPage extends StatefulWidget {
  JournalEntriesMonthlyPage({required this.month});
  String? month;
  @override
  State<JournalEntriesMonthlyPage> createState() =>
      _JournalEntriesMonthlyPage();
}

class _JournalEntriesMonthlyPage extends State<JournalEntriesMonthlyPage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    SignInPage(),
    LoginPage(),
    AccountSetupConsentPage(),
  ];
  String? _receivedMonth = '';
  String stringMonth = '';
  String journalEntryDate = '22ND MARCH 2024';
  String entryTitle = 'TITLE OF JOURNAL ENTRY';
  String weatherImage = Images.sunny;
  @override
  void initState() {
    super.initState();
    _receivedMonth = widget.month;
    stringMonth = _receivedMonth.toString();
  }

  //String? thisMonth;
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
                                "J O U R N A L  E N T R I E S",
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
                          SizedBox(height: 40),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                            child: Text(
                              stringMonth.toUpperCase(),
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: ColourPalette.darkPurple),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              height: 93,
                              width: 323,
                              child: Material(
                                  elevation: 8,
                                  color: ColourPalette.brightPurple,
                                  shadowColor: ColourPalette.gray,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          journalEntryDate,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          entryTitle,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'white',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ))),
                          SizedBox(height: 20),
                          SizedBox(
                              height: 93,
                              width: 323,
                              child: Material(
                                  elevation: 8,
                                  color: ColourPalette.purple,
                                  shadowColor: ColourPalette.gray,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          journalEntryDate,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          entryTitle,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'white',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ))),
                          SizedBox(height: 20),
                          SizedBox(
                              height: 93,
                              width: 323,
                              child: Material(
                                  elevation: 8,
                                  color: ColourPalette.darkPurple,
                                  shadowColor: ColourPalette.gray,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          journalEntryDate,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          entryTitle,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'white',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ))),
                          SizedBox(height: 20),
                          SizedBox(
                              height: 93,
                              width: 323,
                              child: Material(
                                  elevation: 8,
                                  color: ColourPalette.indigo,
                                  shadowColor: ColourPalette.gray,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          journalEntryDate,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          entryTitle,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'white',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ))),
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
                                "Finished",
                                style: TextStyle(
                                    color: ColourPalette.white,
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
