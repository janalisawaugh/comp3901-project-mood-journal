/// This Dart code defines a Flutter application with a LoginPage widget that allows users to
/// create an account or sign in.
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mood_journal/core/presentation/account_setup_info.dart';
import 'package:mood_journal/core/presentation/sign_in_page.dart';
import 'package:mood_journal/core/ui_features/colour_palette.dart';
import 'package:mood_journal/core/ui_features/images.dart';

/// This function initializes a Flutter application with a MaterialApp widget displaying a
/// LoginPage as the home screen without showing the debug banner.
void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

/// The `LoginPage` class in Dart represents a page with options to create an account or sign in, styled
/// with buttons and images.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  /// This function is the build method in a Flutter widget, used to build the UI based on the current
  /// state of the widget.
  ///
  /// @param context The `BuildContext` parameter in the `build` method represents the location of the
  /// widget in the widget tree. It provides access to the theme, media query information, and other
  /// useful data related to the widget's location in the hierarchy. This parameter is essential for
  /// building widgets that are aware of their context. Used for all pages.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColourPalette.indigo,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColourPalette.indigo,
        ),
        body: Center(
            child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Image.asset(Images.loginLogo),
                      ),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: TextButton(
                            /// The `onPressed` function is a callbackfunction that is
                            /// triggered when the "Create Account" button is pressed
                            /// on the LoginPage widget.
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AccountSetupInfoPage()));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: ColourPalette.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                  color: ColourPalette.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: TextButton(
                            /// The `onPressed` function in the code snippet you provided is a callback
                            /// function that is triggered when the corresponding button is pressed. In
                            /// this case, when the "Sign In" button is pressed on the LoginPage widget,
                            /// the function navigates to the SignInPage using the
                            /// `Navigator.of(context).push` method with a new MaterialPageRoute.
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}
