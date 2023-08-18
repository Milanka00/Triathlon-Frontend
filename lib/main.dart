import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:triathlon/booking_form.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) {
        return MyApp(); // Wrap MyApp with DevicePreview
      },
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
      home: SafeArea(child: BookingForm()), // Use BookingForm as the home
      debugShowCheckedModeBanner: false,
    );
  }
}



