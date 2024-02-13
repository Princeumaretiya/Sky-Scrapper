import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/SplashScreen.dart';

import 'controller/api.dart';
import 'controller/themeProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => APICallProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ModelTheme(),
      )
    ],
    child: Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          home: splashScreen(),
          theme: themeNotifier.isDark
              ? ThemeData(useMaterial3: true, brightness: Brightness.dark)
              : ThemeData(useMaterial3: true, brightness: Brightness.light),
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  ));
}
