import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:triathlon/booking_form.dart';
import 'package:device_preview/device_preview.dart';
import 'package:triathlon/shuttle.dart';

void main() {
  runApp(
    DevicePreview(
        enabled: true,
        builder: (context) {
          return MyApp();
        }
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triathlon',
      theme: ThemeData(
        hoverColor: Colors.indigo[900],
        primarySwatch: Colors.indigo,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.blue,
          contentTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      home: BookingForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}



