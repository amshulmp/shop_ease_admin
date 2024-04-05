// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease_admin/config/configuration.dart';
import 'package:shop_ease_admin/config/routes.dart';
import 'package:shop_ease_admin/firebase_options.dart';
import 'package:shop_ease_admin/view/allsellers.dart';
import 'package:shop_ease_admin/view/home.dart';
import 'package:shop_ease_admin/view/login.dart';
import 'package:shop_ease_admin/view/orders.dart';
import 'package:shop_ease_admin/view/ordersdetails.dart';
import 'package:shop_ease_admin/view/requests.dart';
import 'package:shop_ease_admin/view/sellerdetails.dart';
import 'package:shop_ease_admin/view/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,
 theme: lightmode,
 initialRoute: Routes.splash,
 routes: {
  Routes.splash:(context) => const SplashScreen(),
  Routes.home:(context) => const HomeScreen(),
  Routes.login:(context) => const LoginScreen(),
    Routes.allsellers:(context) => const Allsellers(),
  Routes.requests:(context) => const Requests(),
  Routes.orders:(context) => const Orders(),
      Routes.sellersdetails:(context) => const Sellerdetails(),
        Routes.orderdetails:(context) => const Ordersdetals(),
 },
    );
  }
}
