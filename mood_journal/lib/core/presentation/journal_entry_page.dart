import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/journal_entries_page.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class JournalEntryPage extends StatefulWidget {
  JournalEntryPage({required displayDate});
  String? displayDate;
  @override
  State<JournalEntryPage> createState() => _JournalEntryPage();
}

class _JournalEntryPage extends State<JournalEntryPage> {
  String? _receivedDate = '';
  String stringDate = DateTime.now().toString();
  @override
  void initState() {
    super.initState();
    _receivedDate = widget.displayDate;
    stringDate = _receivedDate.toString();
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
                                "J O U R N A L  E N T R Y",
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
                            //text field for entry title
                            height: 28,
                            width: 308,
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: ColourPalette.white,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "Give this entry a title..",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        color: ColourPalette.lightgrayText),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black)),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                            child: Row(
                              //for date and add and delete buttons
                              children: [
                                Text(
                                  // TODO Fix the passing of the date to variable stringDate,
                                  "MAY 13, 2024",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: ColourPalette.darkPurple),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            //text field for journal entry
                            height: 443,
                            width: 317,
                            child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: ColourPalette.white,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    labelText: "I feel like...",
                                    labelStyle: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        color: ColourPalette.lightgrayText),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: ColourPalette.black)),
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
                                            JournalEntriesPage()));
                              }, //TODO add navigation
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
        ));
  }
}
