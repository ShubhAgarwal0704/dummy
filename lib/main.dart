import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/home/hostel_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:hotel_app/model/cart.dart';
import 'package:hotel_app/model/favorites.dart';
import 'package:hotel_app/model/propertyFavorites.dart';
import 'package:hotel_app/model/propertyProvider.dart';
import 'package:hotel_app/screens/home_screen.dart';
import 'package:hotel_app/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropertyFavorites()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Favorites()),
        ChangeNotifierProvider(create: (_) => PropertyProvider()),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Hotel App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: AppTheme.textTheme,
        ),
        home: PropertyListScreen(),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
