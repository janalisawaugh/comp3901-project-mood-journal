import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/journal_entry_page.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The class `JournalEntryDailyPage` is a StatefulWidget in Dart that represents a daily journal entry
/// page with a date parameter.
class JournalEntryDailyPage extends StatefulWidget {
  JournalEntryDailyPage({required this.dateToday});
  String? dateToday;
  @override
  State<JournalEntryDailyPage> createState() => _JournalEntryDailyPage();
}

class _JournalEntryDailyPage extends State<JournalEntryDailyPage> {
  // For receiving the current date from Journal Entries page
  String? _receivedDate = DateTime.now().toString();
  String stringDate = '';

  String hobby1 = 'Painting';
  String hobby2 = 'Swimming';
  String hobby3 = 'Reading';

  // To determine if the weather, diet rating and hobby buttons have been selected
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

  bool hobby1Selected = false;
  bool hobby2Selected = false;
  bool hobby3Selected = false;

  /// The initState function in Dart sets the _receivedDate variable to the date passed in through the
  /// widget and converts it to a string.
  @override
  void initState() {
    super.initState();
    _receivedDate = widget.dateToday;
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
                          SizedBox(height: 20),
                          Text(
                            stringDate.toUpperCase(),
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
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "What's the weather like today?",
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
                          Column(
                            //for weather buttons
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 61,
                                      width: 69,
                                      child: IconButton.filled(
                                        color: sunnyfilledSelected
                                            ? ColourPalette.white
                                            : ColourPalette.purple,
                                        icon: ImageIcon(
                                          AssetImage(Images.sunny),
                                          color: ColourPalette.black,
                                        ),
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: ColourPalette.black)),
                                        ),
                                        isSelected: sunnyfilledSelected,
                                        selectedIcon: ImageIcon(
                                            AssetImage(Images.sunny),
                                            color: ColourPalette.white),

                                        /// Defining an `onPressed` event
                                        /// handler function that toggles the state of several boolean
                                        /// variables when a button is pressed. Specifically, it sets
                                        /// the `sunnyfilledSelected` variable to the opposite of its
                                        /// current value, and sets all other related variables
                                        /// (`partcloudfilledSelected`, `cloudyfilledSelected`,
                                        /// `rainyfilledSelected`, `thunderfilledSelected`,
                                        /// `windyfilledSelected`) to `false`. This code is used
                                        /// to handle the selection of different weather icons or states
                                        /// in user interface. Same function format is used for all selection buttons on this page.
                                        onPressed: () {
                                          setState(() {
                                            sunnyfilledSelected =
                                                !sunnyfilledSelected;
                                            partcloudfilledSelected = false;
                                            cloudyfilledSelected = false;
                                            rainyfilledSelected = false;
                                            thunderfilledSelected = false;
                                            windyfilledSelected = false;
                                          });
                                        },
                                      )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      height: 61,
                                      width: 69,
                                      child: IconButton.filled(
                                        color: partcloudfilledSelected
                                            ? ColourPalette.white
                                            : ColourPalette.purple,
                                        icon: ImageIcon(
                                          AssetImage(Images.partlycloudy),
                                          color: ColourPalette.black,
                                        ),
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: ColourPalette.black)),
                                        ),
                                        isSelected: partcloudfilledSelected,
                                        selectedIcon: ImageIcon(
                                            AssetImage(Images.partlycloudy),
                                            color: ColourPalette.white),
                                        onPressed: () {
                                          setState(() {
                                            partcloudfilledSelected =
                                                !partcloudfilledSelected;
                                            sunnyfilledSelected = false;
                                            cloudyfilledSelected = false;
                                            rainyfilledSelected = false;
                                            thunderfilledSelected = false;
                                            windyfilledSelected = false;
                                          });
                                        },
                                      )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      height: 61,
                                      width: 69,
                                      child: IconButton.filled(
                                        color: cloudyfilledSelected
                                            ? ColourPalette.white
                                            : ColourPalette.purple,
                                        icon: ImageIcon(
                                          AssetImage(Images.cloudy),
                                          color: ColourPalette.black,
                                        ),
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: ColourPalette.black)),
                                        ),
                                        isSelected: cloudyfilledSelected,
                                        selectedIcon: ImageIcon(
                                            AssetImage(Images.cloudy),
                                            color: ColourPalette.white),
                                        onPressed: () {
                                          setState(() {
                                            cloudyfilledSelected =
                                                !cloudyfilledSelected;
                                            partcloudfilledSelected = false;
                                            sunnyfilledSelected = false;
                                            rainyfilledSelected = false;
                                            thunderfilledSelected = false;
                                            windyfilledSelected = false;
                                          });
                                        },
                                      )),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 61,
                                      width: 69,
                                      child: IconButton.filled(
                                        color: rainyfilledSelected
                                            ? ColourPalette.white
                                            : ColourPalette.purple,
                                        icon: ImageIcon(
                                          AssetImage(Images.rainy),
                                          color: ColourPalette.black,
                                        ),
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: ColourPalette.black)),
                                        ),
                                        isSelected: rainyfilledSelected,
                                        selectedIcon: ImageIcon(
                                            AssetImage(Images.rainy),
                                            color: ColourPalette.white),
                                        onPressed: () {
                                          setState(() {
                                            rainyfilledSelected =
                                                !rainyfilledSelected;
                                            partcloudfilledSelected = false;
                                            cloudyfilledSelected = false;
                                            sunnyfilledSelected = false;
                                            thunderfilledSelected = false;
                                            windyfilledSelected = false;
                                          });
                                        },
                                      )),
                                  SizedBox(width: 5),
                                  SizedBox(
                                      height: 61,
                                      width: 69,
                                      child: IconButton.filled(
                                        color: thunderfilledSelected
                                            ? ColourPalette.white
                                            : ColourPalette.purple,
                                        icon: ImageIcon(
                                          AssetImage(Images.thunderstorm),
                                          color: ColourPalette.black,
                                        ),
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: ColourPalette.black)),
                                        ),
                                        isSelected: thunderfilledSelected,
                                        selectedIcon: ImageIcon(
                                            AssetImage(Images.thunderstorm),
                                            color: ColourPalette.white),
                                        onPressed: () {
                                          setState(() {
                                            thunderfilledSelected =
                                                !thunderfilledSelected;
                                            sunnyfilledSelected = false;
                                            cloudyfilledSelected = false;
                                            rainyfilledSelected = false;
                                            partcloudfilledSelected = false;
                                            windyfilledSelected = false;
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
                                            : ColourPalette.purple,
                                        icon: ImageIcon(
                                          AssetImage(Images.windy),
                                          color: ColourPalette.black,
                                        ),
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color: ColourPalette.black)),
                                        ),
                                        isSelected: windyfilledSelected,
                                        selectedIcon: ImageIcon(
                                            AssetImage(Images.windy),
                                            color: ColourPalette.white),
                                        onPressed: () {
                                          setState(() {
                                            windyfilledSelected =
                                                !windyfilledSelected;
                                            partcloudfilledSelected = false;
                                            sunnyfilledSelected = false;
                                            rainyfilledSelected = false;
                                            thunderfilledSelected = false;
                                            cloudyfilledSelected = false;
                                          });
                                        },
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Text(
                            "What has your diet been like today?",
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
                            //buttons for diet rating
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
                                      "V E R Y  U N H E A L T H Y",
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
                                      "H E A L T H Y",
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
                                          oneSelected = !oneSelected;
                                          twoSelected = false;
                                          threeSelected = false;
                                          fourSelected = false;
                                          fiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: oneSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: oneSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          twoSelected = !twoSelected;
                                          oneSelected = false;
                                          threeSelected = false;
                                          fourSelected = false;
                                          fiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: twoSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: twoSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          threeSelected = !threeSelected;
                                          oneSelected = false;
                                          twoSelected = false;
                                          fourSelected = false;
                                          fiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: threeSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: threeSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          fourSelected = !fourSelected;
                                          oneSelected = false;
                                          threeSelected = false;
                                          twoSelected = false;
                                          fiveSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: fourSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            color: fourSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          fiveSelected = !fiveSelected;
                                          oneSelected = false;
                                          threeSelected = false;
                                          fourSelected = false;
                                          twoSelected = false;
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: fiveSelected
                                            ? ColourPalette.purple
                                            : ColourPalette.white,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: ColourPalette.black)),
                                      ),
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            color: fiveSelected
                                                ? ColourPalette.white
                                                : ColourPalette.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                          SizedBox(height: 50),
                          Text(
                            "Did you do any hobbies today?",
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      hobby1Selected = !hobby1Selected;
                                      hobby2Selected = false;
                                      hobby3Selected = false;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: hobby1Selected
                                        ? ColourPalette.purple
                                        : ColourPalette.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: ColourPalette.black)),
                                  ),
                                  child: Text(
                                    hobby1,
                                    style: TextStyle(
                                        color: hobby1Selected
                                            ? ColourPalette.white
                                            : ColourPalette.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      hobby2Selected = !hobby2Selected;
                                      hobby1Selected = false;
                                      hobby3Selected = false;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: hobby2Selected
                                        ? ColourPalette.purple
                                        : ColourPalette.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: ColourPalette.black)),
                                  ),
                                  child: Text(
                                    hobby2,
                                    style: TextStyle(
                                        color: hobby2Selected
                                            ? ColourPalette.white
                                            : ColourPalette.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      hobby3Selected = !hobby3Selected;
                                      hobby2Selected = false;
                                      hobby1Selected = false;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: hobby3Selected
                                        ? ColourPalette.purple
                                        : ColourPalette.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            color: ColourPalette.black)),
                                  ),
                                  child: Text(
                                    hobby3,
                                    style: TextStyle(
                                        color: hobby3Selected
                                            ? ColourPalette.white
                                            : ColourPalette.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ]),
                          SizedBox(height: 50),
                          SizedBox(
                            width: 200,
                            child: TextButton(
                              /// Defining an `onPressed` event handler for a button
                              /// press in Dart. When the button is pressed, it will navigate to a new
                              /// page using the `Navigator.push` method. The new page being navigated
                              /// to is `JournalEntryPage`, and it is being passed a parameter
                              /// `displayDate` with the value `_receivedDate`.
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => JournalEntryPage(
                                            displayDate: _receivedDate)));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: ColourPalette.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Next",
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
