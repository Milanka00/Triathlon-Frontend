import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:triathlon/appbar.dart';
import 'package:triathlon/seat-booking.dart';
import '../utils/accessory_widgets.dart';
import '../utils/custom_colors.dart';
import 'home.dart';

class UserDataCollection extends StatefulWidget {
  const UserDataCollection({Key? key}) : super(key: key);

  @override
  State<UserDataCollection> createState() => _UserDataCollectionState();
}

class _UserDataCollectionState extends State<UserDataCollection> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passengerController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  PlatformFile? file;
  bool isLoading = false;
  DateTime? dob;
  int passenger=0;
  String classes="Economy";
  bool round=false;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQuery.height * .025,
              ),

              SizedBox(
                height: mediaQuery.height * .03,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: mediaQuery.width * .02,
                    right: mediaQuery.width * .45),
                child: Text("Shuttle there.!",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mediaQuery.width * .06)),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Let's add a few details before you onboard .!",
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    color: CustomColors.darkAccent),
              ),
              SizedBox(
                height: mediaQuery.height * .04,
              ),

              Form(
                  key: _key,
                  child: Container(

                    decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    margin: EdgeInsets.only(left: 10,right: 10),
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.width * .05
                    ),
                    height: mediaQuery.height * .50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 2) {
                                  return "Invalid Place";
                                } else {
                                  return null;
                                }
                              },
                              style: GoogleFonts.nunitoSans(),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15),
                                  prefixIcon: Icon(
                                    Icons.rocket_launch_outlined,
                                    color: CustomColors.lightAccent,
                                  ),
                                  hintText: "Starting Point",
                                  hintStyle: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38),
                                  fillColor: Colors.black12,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.black12,),)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Ionicons.arrow_up_outline,color: CustomColors.lightAccent),
                                Icon(Ionicons.arrow_down_outline,color: CustomColors.lightAccent),
                              ],
                            ),
                            TextFormField(
                              controller: _lastNameController,
                              maxLines: null,
                              validator: (value) {
                                if (value!.isEmpty ) {
                                  return "Invalid Place";
                                } else {
                                  return null;
                                }
                              },
                              style: GoogleFonts.nunitoSans(),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15),
                                  prefixIcon: Transform.rotate(
                                    angle: 3.14159, // This is pi radians, which is equivalent to 180 degrees
                                    child: Icon(
                                      Icons.rocket_launch_outlined,
                                      color: CustomColors.lightAccent,
                                    ),
                                  ),
                                  hintText: "Destination Point",
                                  hintStyle: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38),
                                  fillColor: Colors.black12,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.black12),)
                              ),
                            ),
                          ],
                        ),

                       TextFormField(
                          validator: (value){
                            if(dob!=null){
                              return null;
                            }
                            else if(DateTime.parse(_dateController.text).isAfter(DateTime.now().subtract(const Duration(days: 18*365)))){
                              return "You must be 18+";
                            }
                            else{
                              return null;
                            }


                          },
                          controller: _dateController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                              prefixIcon: IconButton(onPressed: ()async{
                                dob =  await showDatePicker(context: context, initialDate: DateTime(2005,1,1), firstDate: DateTime(1950,1,1), lastDate: DateTime.now().subtract(Duration(days: 18*365)),);
                                if(dob!=null){
                                  _dateController.text = DateFormat.yMMMd().format(dob!);
                                }

                              }, icon: Icon(Icons.calendar_month_outlined,color: CustomColors.lightAccent,)
                              ),
                              hintText: "Date",

                              hintStyle: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38),
                              fillColor: Colors.black12,
                              suffixText: 'Round-trip?',
                              suffixStyle: TextStyle(color: round==false?Colors.black38:CustomColors.lightAccent,),
                              suffixIcon:IconButton(
                                onPressed: () {
                                  setState(() {
                                    round=!round;
                                  });
                                },
                                icon: round==false?Icon(Icons.toggle_off_rounded,color: Colors.black12,):Icon(Icons.toggle_on_sharp,color: CustomColors.lightAccent,),

                              ) ,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.black12),)
                          ),


                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(

                              child: DropdownButtonFormField<int>(
                                onChanged: (newValue) {
                                  setState(() {
                                    passenger = newValue!;
                                  });
                                },menuMaxHeight: 200,
                                validator: (value){
                                  if(passenger==0){
                                    return "Please Select a value";
                                  }
                                },
                                items:List.generate(12, (index) => index + 1)
                                    .map((count) => DropdownMenuItem(
                                  value: count,
                                  child: Text('$count'),
                                )).toList() ,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                                  prefixIcon: Icon(
                                    Ionicons.people_outline,
                                    color: CustomColors.lightAccent,
                                  ),
                                  hintText: "Passengers",
                                  hintStyle: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black38,
                                  ),
                                  fillColor: Colors.black12,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.black12),)
                                ),
                              ),
                            ),
                            SizedBox(width: 10), // Add some spacing between the fields
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                onChanged: (newValue) {
                                  setState(() {
                                    classes = newValue!;
                                  });
                                },
                                items: [
                                  DropdownMenuItem<String>(
                                    value: "Economy",
                                    child: Text("Economy"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "Business",
                                    child: Text("Business"),
                                  ),
                                  // Add more items as needed
                                ],
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                                  prefixIcon: Icon(
                                    Ionicons.airplane_outline,
                                    color: CustomColors.lightAccent,
                                  ),
                                  hintText: "Class",
                                  hintStyle: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black38,
                                  ),
                                  fillColor: Colors.black12,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: Colors.black12),)
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height:
                        20),
                        ElevatedButton(
                            onPressed: () async {
                              bool isValid = _key.currentState!.validate();
                              if (isValid) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return SeatBookingPage();
                                    }));
                              }
                            },
                            style: ButtonStyle(

                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: mediaQuery.width * .35,
                                        vertical: mediaQuery.height * .022)),

                                backgroundColor: MaterialStateProperty.all(
                                    CustomColors.darkAccent)),
                            child: isLoading
                                ? const CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.white,
                            )
                                : Text(
                              "Search",
                              style: GoogleFonts.nunitoSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: mediaQuery.width * .04),
                            )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void nextPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()));
  }
}