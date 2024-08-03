//!تغير اللغه في الجهاز بالكامل بشكل يدوي من الكود
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:localization2by_intl/generated/l10n.dart';
// import 'package:localization2by_intl/home.dart';
// //

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: Locale('ar'),
//       localizationsDelegates: const [
//         S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: S.delegate.supportedLocales,
//       home: home(),
//     );
//   }
// }
//!لتغير اللغه في الجهاز بالكامل دون حفضها
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:localization2by_intl/generated/l10n.dart';
// import 'package:localization2by_intl/home.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Locale _locale = Locale('ar');

//   void setLocale(Locale value) {
//     setState(() {
//       _locale = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: _locale,
//       localizationsDelegates: const [
//         S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: S.delegate.supportedLocales,
//       home: Home(setLocale: setLocale),
//     );
//   }
// }
//!لتغير اللغه في الجهاز بالكامل وحفضها
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization2by_intl/generated/l10n.dart';
import 'package:localization2by_intl/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? localeCode = prefs.getString('locale') ?? 'ar';
  runApp(MyApp(initialLocale: Locale(localeCode)));
}

class MyApp extends StatefulWidget {
  final Locale initialLocale;

  const MyApp({Key? key, required this.initialLocale}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  void setLocale(Locale value) async {
    setState(() {
      _locale = value;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', value.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Home(setLocale: setLocale),
    );
  }
}
