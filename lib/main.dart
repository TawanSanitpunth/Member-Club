import 'package:club_member/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        // scaffoldBackgroundColor: const Color(0xFF3F4DB0),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF3F4DB0),
            ),
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.white,
        //       displayColor: Colors.white,
        //     ),
      ),
      home: const MyHomePage(),
    );
  }
}
