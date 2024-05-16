import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:mood_journal/core/presentation/account_setup_consent.dart';
import 'package:mood_journal/core/presentation/journal_entries_monthly_page.dart';
import 'package:mood_journal/core/presentation/journal_entry_daily.dart';
import 'package:mood_journal/core/presentation/login_page.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';

import 'package:mood_journal/core/ui_features/images.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class JournalEntriesPage extends StatefulWidget {
  @override
  State<JournalEntriesPage> createState() => _JournalEntriesPage();
}

class _JournalEntriesPage extends State<JournalEntriesPage> {
  // For passing the date to the monthly journal entries screen
  String? todaydDateString =
      DateFormat('yMMMd').format(DateTime.now()).toString();
  String? _selectedDateString =
      DateFormat('MMMM yyyy').format(DateTime.now()).toString();
  DateTime _selectedDate = DateTime.now();
  String journalEntryDate = 'DAY ';
  String entryTitle = 'TITLE OF JOURNAL ENTRY';

  /// The `initState` function in a Flutter widget sets the initial selected date string to the current
  /// month and year.
  ///
  /// @param context The `context` parameter in the `build` method of a Flutter widget represents the
  /// location of the widget within the widget tree. It provides access to various services and
  /// information, such as the theme, media query data, and navigation. The `BuildContext` class also
  /// allows widgets to find and interact with
  @override
  Widget build(BuildContext context) {
    void initState() {
      _selectedDateString =
          DateFormat('MMMM yyyy').format(DateTime.now()).toString();
      super.initState();
    }

    /// The `viewChanged` function updates the selected date string and date based on the visible dates
    /// in a calendar view and triggers a UI update.
    ///
    /// @param viewChangedDetails The `viewChangedDetails` parameter in the `viewChanged` method likely
    /// contains information about the changes in the view, such as the visible dates after a view
    /// change event. It is used to update the `_selectedDateString` and
    /// `_selectedDate` variables based on the date selected in the calendar.
    void viewChanged(ViewChangedDetails viewChangedDetails) {
      _selectedDateString = DateFormat('MMMM yyyy')
          .format(viewChangedDetails.visibleDates[0])
          .toString();
      _selectedDate = viewChangedDetails.visibleDates[0];

      SchedulerBinding.instance!.addPostFrameCallback((duration) {
        setState(() {});
      });
    }

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
                          SizedBox(
                            //calendar
                            height: 250,
                            width: 321,
                            child: SfCalendar(
                              view: CalendarView.month,
                              onViewChanged: viewChanged,
                              cellBorderColor: ColourPalette.white,
                              headerStyle: CalendarHeaderStyle(
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Inter',
                                      color: ColourPalette.darkPurple,
                                      fontWeight: FontWeight.w400)),
                              monthViewSettings: MonthViewSettings(
                                  navigationDirection:
                                      MonthNavigationDirection.horizontal,
                                  showTrailingAndLeadingDates: false,
                                  dayFormat: 'EEE',
                                  monthCellStyle: MonthCellStyle(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          color: ColourPalette.black,
                                          fontWeight: FontWeight.w400))),
                              showNavigationArrow: true,
                              showDatePickerButton: true,
                              showTodayButton: true,
                            ),
                          ),
                          SizedBox(height: 50),
                          SizedBox(
                            height: 40,
                            width: 350,
                            child: TextButton(
                              /// Defining an `onPressed` event handler
                              /// for a button press. When the button is pressed, it will navigate to a
                              /// new screen using the `Navigator.push` method in Flutter. The new
                              /// screen being navigated to is `JournalEntriesMonthlyPage`, and it is
                              /// passing a parameter `month` with the value of `_selectedDateString` to
                              /// that screen.
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            JournalEntriesMonthlyPage(
                                                month: _selectedDateString)));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: ColourPalette.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "All Journal Entries for ",
                                        style: TextStyle(
                                            color: ColourPalette.black,
                                            fontFamily: 'Inter',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                      text: "$_selectedDateString",
                                      style: TextStyle(
                                          color: ColourPalette.black,
                                          fontFamily: 'Inter',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ])),
                            ),
                          ),
                          SizedBox(
                              height: 80,
                              width: 323,
                              child: Material(
                                  elevation: 8,
                                  color: ColourPalette.brightPurple,
                                  shadowColor: ColourPalette.gray,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          journalEntryDate +
                                              _selectedDateString
                                                  .toString()
                                                  .toUpperCase(),
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
                              height: 80,
                              width: 323,
                              child: Material(
                                  elevation: 8,
                                  color: ColourPalette.brightPurple,
                                  shadowColor: ColourPalette.gray,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          journalEntryDate +
                                              _selectedDateString
                                                  .toString()
                                                  .toUpperCase(),
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
                            height: 30,
                            width: 150,
                            child: ElevatedButton.icon(
                              /// Defining an `onPressed` event handler
                              /// for a button or similar widget. When the button is pressed, it uses the
                              /// `Navigator.push` method to navigate to a new screen represented by the
                              /// `JournalEntryDailyPage` widget. It passes a parameter `dateToday` with
                              /// the value of `todaydDateString` to the `JournalEntryDailyPage` widget.
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            JournalEntryDailyPage(
                                                dateToday: todaydDateString)));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: ColourPalette.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side:
                                        BorderSide(color: ColourPalette.black)),
                              ),
                              label: Text(
                                "Add Entry",
                                style: TextStyle(
                                    color: ColourPalette.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                              icon: ImageIcon(
                                  AssetImage(Images.writeButtonIcon),
                                  color: ColourPalette.black),
                            ),
                          ),
                          SizedBox(height: 50),
                        ]))),
          ),
        ));
  }
}
