//!تغير اللغه في الجهاز بالكامل بشكل يدوي من الكود
// import 'package:flutter/material.dart';
// import 'generated/l10n.dart';

// class home extends StatefulWidget {
//   const home({super.key});

//   @override
//   State<home> createState() => _homeState();
// }

// class _homeState extends State<home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context)!.title),
//         backgroundColor: Colors.amber,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text(S.of(context)!.test),
//             Text(S.of(context)!.ff),
//           ],
//         ),
//       ),
//     );
//   }
// }
//!لتغير اللغه في الجهاز بالكامل دون حفضها
// import 'package:flutter/material.dart';
// import 'generated/l10n.dart';

// class Home extends StatefulWidget {
//   final Function(Locale) setLocale;
//   const Home({Key? key, required this.setLocale}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context)!.title),
//         backgroundColor: Colors.amber,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 widget.setLocale(Locale('en'));
//               },
//               child: Text('Change to English'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 widget.setLocale(Locale('ar'));
//               },
//               child: Text('تغيير إلى العربية'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//!لتغير اللغه في الجهاز بالكامل وحفضها
import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class Home extends StatefulWidget {
  //
  final Function(Locale) setLocale;
  //
  const Home({Key? key, required this.setLocale}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.title),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.setLocale(Locale('en'));
              },
              child: Text('Change to English'),
            ),
            ElevatedButton(
              onPressed: () {
                widget.setLocale(Locale('ar'));
              },
              child: Text('تغيير إلى العربية'),
            ),
          ],
        ),
      ),
    );
  }
}
