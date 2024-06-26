import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_journal/core/presentation/analytics_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
import 'package:mood_journal/core/ui_features/images.dart';

/// The `ChartsPage` class is a StatefulWidget in Dart used for displaying charts made from analyzing pattern of user emotions from entries.
/// In this page a sample chart is displayed.
class ChartsPage extends StatefulWidget {
  @override
  State<ChartsPage> createState() => _ChartsPage();
}

class _ChartsPage extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: ColourPalette.white,
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnalyticsPage()));
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
                                "C H A R T S",
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
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 35, 10),
                            child: Text(
                              "T H I S  W E E K ' S  C H A R T",
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
                          SizedBox(
                              height: 300,
                              width: 300,
                              child: Material(
                                  elevation: 8,
                                  shadowColor: ColourPalette.gray,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(Images.sampleChart,
                                          fit: BoxFit.cover)
                                    ],
                                  ))),
                          SizedBox(height: 50),
                        ]))),
          ),
        ));
  }
}
