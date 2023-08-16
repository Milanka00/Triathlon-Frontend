import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triathlon/appbar.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Booking Form',

      ),
      body: SingleChildScrollView(

      ),
    );
  }
}
