import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/accounts_centre.dart';
import 'package:mood_journal/core/presentation/journal_entry_page.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State<FeedbackPage> createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
  //for the report, chart and recommendation ratings

  bool reportoneSelected = false;
  bool reporttwoSelected = false;
  bool reportthreeSelected = false;
  bool reportfourSelected = false;
  bool reportfiveSelected = false;

  bool chartoneSelected = false;
  bool charttwoSelected = false;
  bool chartthreeSelected = false;
  bool chartfourSelected = false;
  bool chartfiveSelected = false;

  bool reconeSelected = false;
  bool rectwoSelected = false;
  bool recthreeSelected = false;
  bool recfourSelected = false;
  bool recfiveSelected = false;

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
                                "F E E D B A C K",
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
                          SizedBox(height: 30),
                          Text(
                            "How would you rate the accuracy of this week's recommendations, charts and reports?",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: ColourPalette.black),
                          ),
                          SizedBox(height: 20),
                          SizedBox(height: 50),
                          Text(
                            "R E P O R T S",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: ColourPalette.black),
                          ),
                          SizedBox(height: 15),
                          Column(
                            //buttons for report rating
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "I N A C C U R A T E",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.purple),
                                    ),
                                    Text(
                                      "A C C U R A T E",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.indigo),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          reportoneSelected =
                                              !reportoneSelected;
                                          reporttwoSelected = false;
                                          reportthreeSelected = false;
                                          reportfourSelected = false;
                                          reportfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: reportoneSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: reportoneSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          reporttwoSelected =
                                              !reporttwoSelected;
                                          reportoneSelected = false;
                                          reportthreeSelected = false;
                                          reportfourSelected = false;
                                          reportfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: reporttwoSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: reporttwoSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          reportthreeSelected =
                                              !reportthreeSelected;
                                          reportoneSelected = false;
                                          reporttwoSelected = false;
                                          reportfourSelected = false;
                                          reportfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: reportthreeSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: reportthreeSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          reportfourSelected =
                                              !reportfourSelected;
                                          reportoneSelected = false;
                                          reportthreeSelected = false;
                                          reporttwoSelected = false;
                                          reportfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: reportfourSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: reportfourSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          reportfiveSelected =
                                              !reportfiveSelected;
                                          reportoneSelected = false;
                                          reportthreeSelected = false;
                                          reportfourSelected = false;
                                          reporttwoSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: reportfiveSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            color: reportfiveSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                          SizedBox(height: 30),
                          Text(
                            "C H A R T S",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: ColourPalette.black),
                          ),
                          SizedBox(height: 15),
                          Column(
                            //buttons for chart rating
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "I N A C C U R A T E",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.purple),
                                    ),
                                    Text(
                                      "A C C U R A T E",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.indigo),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          chartoneSelected = !chartoneSelected;
                                          charttwoSelected = false;
                                          chartthreeSelected = false;
                                          chartfourSelected = false;
                                          chartfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: chartoneSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: chartoneSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          charttwoSelected = !charttwoSelected;
                                          chartoneSelected = false;
                                          chartthreeSelected = false;
                                          chartfourSelected = false;
                                          chartfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: charttwoSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: charttwoSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          chartthreeSelected =
                                              !chartthreeSelected;
                                          chartoneSelected = false;
                                          charttwoSelected = false;
                                          chartfourSelected = false;
                                          chartfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: chartthreeSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: chartthreeSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          chartfourSelected =
                                              !chartfourSelected;
                                          chartoneSelected = false;
                                          chartthreeSelected = false;
                                          charttwoSelected = false;
                                          chartfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: chartfourSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: chartfourSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          chartfiveSelected =
                                              !chartfiveSelected;
                                          chartoneSelected = false;
                                          chartthreeSelected = false;
                                          chartfourSelected = false;
                                          charttwoSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: chartfiveSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            color: chartfiveSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                          SizedBox(height: 30),
                          Text(
                            "R E C O M M E N D A T I O N S",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: ColourPalette.black),
                          ),
                          SizedBox(height: 15),
                          Column(
                            //buttons for recommendations rating
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "U N H E L P F U L",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.purple),
                                    ),
                                    Text(
                                      "H E L P F U L",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal,
                                              color: ColourPalette.indigo),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          reconeSelected = !reconeSelected;
                                          rectwoSelected = false;
                                          recthreeSelected = false;
                                          recfourSelected = false;
                                          recfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: reconeSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: reconeSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          rectwoSelected = !rectwoSelected;
                                          reconeSelected = false;
                                          recthreeSelected = false;
                                          recfourSelected = false;
                                          recfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: rectwoSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: rectwoSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          recthreeSelected = !recthreeSelected;
                                          reconeSelected = false;
                                          rectwoSelected = false;
                                          recfourSelected = false;
                                          recfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: recthreeSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: recthreeSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          recfourSelected = !recfourSelected;
                                          reconeSelected = false;
                                          recthreeSelected = false;
                                          rectwoSelected = false;
                                          recfiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: recfourSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: recfourSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          recfiveSelected = !recfiveSelected;
                                          reconeSelected = false;
                                          recthreeSelected = false;
                                          recfourSelected = false;
                                          rectwoSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: recfiveSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            color: recfiveSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                          SizedBox(height: 50),
                          SizedBox(height: 50),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AccountCentrePage()));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: ColourPalette.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Save",
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
