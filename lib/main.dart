import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/bindings/auth_bindings.dart';
import 'package:yotes/utils/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(YotesApp());
}

class YotesApp extends StatelessWidget {
  const YotesApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Yotes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          onSecondary: Colors.white,
          onPrimary: Colors.white,
          primary: Colors.grey[700]!,
          secondary: Colors.grey[900]!,
          secondaryVariant: Colors.grey,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade100)),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          focusColor: Colors.white,
        ),
      ),
      initialBinding: AuthBinding(),
      home: Root(),
      defaultTransition: Transition.rightToLeftWithFade,
    );
  }
}
