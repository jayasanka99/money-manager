import 'package:flutter/material.dart';
import 'package:money_app/screens/onboarding_screen.dart';
import 'package:money_app/screens/user_service.dart';
import 'package:money_app/screens/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserServices.checkUserEmail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          bool hasEmail = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(isLogin: hasEmail),
          );
        }
      },
    );
  }
}
