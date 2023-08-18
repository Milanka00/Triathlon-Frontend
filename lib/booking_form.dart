import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triathlon/appbar.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final locationController = TextEditingController();
  final contactNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    genderController.dispose();
    locationController.dispose();
    contactNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
    nameController.addListener(() => setState(() {}));
    genderController.addListener(() => setState(() {}));
    locationController.addListener(() => setState(() {}));
    contactNumberController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Form',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildNameField(),
              SizedBox(height: 16.0),
              buildEmailField(),
              SizedBox(height: 16.0),
              buildGenderField(),
              SizedBox(height: 16.0),
              buildLocationField(),
              SizedBox(height: 16.0),
              buildContactNumberField(),
              SizedBox(height: 24.0),
              buildAddPassengerButton(),
              SizedBox(height: 16.0),
              buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() => TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'Email',
          prefixIcon: Icon(Icons.mail),
          suffixIcon: emailController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => emailController.clear(),
                ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          } else if (!isValidEmail(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
      );

  Widget buildNameField() => TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: 'Ravindu T',
          labelText: 'Name',
          prefixIcon: Icon(Icons.person),
          suffixIcon: nameController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => nameController.clear(),
                ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Name is required';
          }
          return null;
        },
      );

  Widget buildGenderField() => TextFormField(
        controller: genderController,
        decoration: InputDecoration(
          hintText: 'Male/Female/Other',
          labelText: 'Gender',
          prefixIcon: Icon(Icons.people),
          suffixIcon: genderController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => genderController.clear(),
                ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Gender is required';
          }
          return null;
        },
      );

  Widget buildLocationField() => TextFormField(
        controller: locationController,
        decoration: InputDecoration(
          hintText: 'C',
          labelText: 'Location',
          prefixIcon: Icon(Icons.location_on),
          suffixIcon: locationController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => locationController.clear(),
                ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Location is required';
          }
          return null;
        },
      );

  Widget buildContactNumberField() => TextFormField(
        controller: contactNumberController,
        decoration: InputDecoration(
          hintText: '077-456-7890',
          labelText: 'Contact Number',
          prefixIcon: Icon(Icons.phone),
          suffixIcon: contactNumberController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => contactNumberController.clear(),
                ),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Contact number is required';
          } else if (!isValidPhoneNumber(value)) {
            return 'Enter a valid contact number';
          }
          return null;
        },
      );

  Widget buildAddPassengerButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Form is valid, add passenger logic here
              // For example, you can clear the fields or save the passenger data.
              emailController.clear();
              nameController.clear();
              genderController.clear();
              locationController.clear();
              contactNumberController.clear();
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF674DEE),
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          child: Text('Add Passenger'),
        ),
      );

  Widget buildContinueButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Continue button press
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF001F3F),
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          child: Text('Continue'),
        ),
      );

bool isValidEmail(String email) {
  // email pattern validation
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegExp.hasMatch(email);
}

bool isValidPhoneNumber(String phoneNumber) {
  // Check if the phone number is exactly 10 digits and starts with 0
  final phoneRegExp = RegExp(r'^0[0-9]{9}$');
  return phoneRegExp.hasMatch(phoneNumber);
}

}


