import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/accounts_centre.dart';
import 'package:mood_journal/core/presentation/analytics_page.dart';
import 'package:mood_journal/core/presentation/journal_entries_monthly_page.dart';
import 'package:mood_journal/core/presentation/journal_entries_page.dart';
import 'package:mood_journal/core/presentation/journal_entry_daily.dart';
import 'package:mood_journal/core/presentation/journal_entry_page.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
import 'package:mood_journal/core/ui_features/images.dart';

class HomePageBar extends StatefulWidget {
  @override
  State<HomePageBar> createState() => _HomePageBar();
}

/// The _HomePageBar class manages a bottom navigation bar with multiple screens in a Flutter
/// application.
class _HomePageBar extends State<HomePageBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    JournalEntriesPage(),
    AnalyticsPage(),
    AccountCentrePage(),
  ];

  /// The `_onItemTapped` function updates the `_currentIndex` state variable based on the index
  /// parameter passed to it.
  ///
  /// @param index The `index` parameter in the `_onItemTapped` function represents the index of the
  /// item that was tapped or selected. This index is used to update the `_currentIndex` state variable
  /// to reflect the currently selected item in the user interface.
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Images.homeIcon),
                  color: ColourPalette.purple, size: 20),
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
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  /// The Dart code is formatting the current date and time into a string in the format "yMMMd"
  /// using the DateFormat class from the intl package. The resulting string will be stored in the
  /// variable todayDateString.
  String? todayDateString =
      DateFormat('yMMMd').format(DateTime.now()).toString();
  String entryCount = "0";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //backgroundColor: ColourPalette.white,
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
            child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.backgroundLogo),
                      fit: BoxFit.cover)),
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
                                  "H O M E",
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
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 10, 35, 10),
                                child: RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                      text: "Welcome, ",
                                      style: TextStyle(
                                          color: ColourPalette.black,
                                          fontFamily: 'Inter',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                    // TODO change this back and also use a variable
                                    text: "M A R T I N",
                                    style: TextStyle(
                                        color: ColourPalette.purpleNameText,
                                        fontFamily: 'Inter',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )
                                ]))),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 25, 50, 25),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        height: 97,
                                        width: 107,
                                        child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "S T R E A K S",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          ColourPalette.purple,
                                                      fontFamily: 'Inter',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "0",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: ColourPalette
                                                          .darkPurple,
                                                      fontFamily: 'Inter',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ))),
                                    SizedBox(
                                        height: 97,
                                        width: 107,
                                        child: Material(
                                            elevation: 8,
                                            shadowColor: ColourPalette.gray,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "J O U R N A L  E N T R I E S",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          ColourPalette.purple,
                                                      fontFamily: 'Inter',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  entryCount,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: ColourPalette
                                                          .darkPurple,
                                                      fontFamily: 'Inter',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            )))
                                  ]),
                            ),
                            SizedBox(height: 150),
                            SizedBox(
                              height: 49,
                              width: 298,
                              child: TextButton.icon(
                                /// Defining an `onPressed` event handler
                                /// for a button press. When the button is pressed, it will navigate to
                                /// a new screen using the `Navigator.push` method. The new screen is
                                /// specified by the `MaterialPageRoute` with the `builder` function
                                /// defining the widget to be displayed, in this case, the
                                /// `JournalEntryDailyPage`. The `JournalEntryDailyPage` widget is being
                                /// instantiated with a parameter `dateToday` set to the value of
                                /// `todayDateString`.
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              JournalEntryDailyPage(
                                                  dateToday: todayDateString)));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: ColourPalette.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                label: Text(
                                  "...How are you feeling today? Talk about it",
                                  style: TextStyle(
                                      color: ColourPalette.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                icon: ImageIcon(
                                    AssetImage(Images.writeButtonIcon),
                                    color: ColourPalette.white),
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              height: 49,
                              width: 298,
                              child: TextButton.icon(
                                /// Defining an `onPressed` event handler for a button
                                /// press in Dart. When the button is pressed, it will navigate to the
                                /// `AnalyticsPage` using the `Navigator.push` method with a new
                                /// `MaterialPageRoute`.
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AnalyticsPage()));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: ColourPalette.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                label: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(children: [
                                      TextSpan(
                                          text: "M A R T I N",
                                          style: TextStyle(
                                              color: ColourPalette.white,
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      TextSpan(
                                        text:
                                            ", we have recommendations for you",
                                        style: TextStyle(
                                            color: ColourPalette.white,
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ])),
                                icon: ImageIcon(
                                    AssetImage(Images.recommendationButtonIcon),
                                    color: ColourPalette.white),
                              ),
                            ),
                            SizedBox(height: 50),
                          ]))),
            ),
          ),
        ));
  }
}
