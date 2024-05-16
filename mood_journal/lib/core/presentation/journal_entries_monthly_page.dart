import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/journal_entries_page.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The `JournalEntriesMonthlyPage` class is a StatefulWidget in Dart that represents a page displaying
/// journal entries for a specific month.
class JournalEntriesMonthlyPage extends StatefulWidget {
  JournalEntriesMonthlyPage({required this.month});
  String? month;
  @override
  State<JournalEntriesMonthlyPage> createState() =>
      _JournalEntriesMonthlyPage();
}

class _JournalEntriesMonthlyPage extends State<JournalEntriesMonthlyPage> {
  // For receiving the selected month from calendar on Journal Entries Page
  String? _receivedMonth = '';
  String stringMonth = '';

  String journalEntryDate = 'DAY MARCH 2024';
  String entryTitle = 'TITLE OF JOURNAL ENTRY';
  String weatherImage = Images.sunny;

  /// The `initState` function in Dart initializes the state of a widget by assigning the value of the
  /// `month` property from the widget to a variable and converting it to a string.
  @override
  void initState() {
    super.initState();
    _receivedMonth = widget.month;
    stringMonth = _receivedMonth.toString();
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontFamily: 'Inter',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontFamily: 'Inter',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontFamily: 'Inter',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          fontFamily: 'Inter',
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
                          /// Setting an `onPressed` event handler
                          /// for a button or similar interactive element. When the button is
                          /// pressed, it uses the `Navigator.push` method to navigate to the
                          /// `JournalEntriesPage` page. This is a common way to handle navigation
                          /// between different screens or pages in a Flutter application.
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        JournalEntriesPage()));
                          },
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
                    ]),
              ),
            ),
          ),
        ));
  }
}
