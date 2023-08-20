import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:triathlon/booking_form.dart';
import 'package:triathlon/utils/custom_colors.dart';

class SeatBookingPage extends StatefulWidget {
  const SeatBookingPage({super.key});

  @override
  State<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends State<SeatBookingPage> {
  Set<SeatNumber> selectedSeats = Set();
  DateTime _selectedDate=DateTime.now();
  String dat=DateTime.now().month.toString();
  bool isloading=false;
  final DateTime date = DateTime.now().add(Duration(days: 365*100));

  void _onDaySelected(DateTime selectedDate, DateTime focusedDates) {
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    String formattedDate = DateFormat('dd MMMM yyyy').format(date);
    String formattedTime=DateFormat('hh:mm a').format(date);
    return Scaffold(
      // appBar: AppBar(
      //
      //   backgroundColor: Colors.purple,
      //   toolbarHeight: 100,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     onPressed:(){} , icon:Icon(Icons.arrow_back_ios,color: Colors.white,),
      //     padding: EdgeInsets.only(top: 50),
      //   ),
      //   title: Text('Select Seats'),
      //   titleTextStyle: GoogleFonts.nunitoSans(
      //       fontWeight: FontWeight.w600,
      //       color: Colors.white,
      //        fontSize: 25),
      //   centerTitle: true,
      //
      //   actions: [
      //     IconButton(onPressed: (){}, icon: Icon(Icons.edit_calendar,color: Colors.white,),padding: EdgeInsets.only(top: 50),)
      //   ],
      // ),

      body:
      SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(left:mediaQuery.width*0.022,right: mediaQuery.width*0.022),
            color: CustomColors.lightAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28,
                ),
                Text("Select Stats",style:
                GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),padding: EdgeInsets.only(left: 5),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_calendar,color: Colors.white,),padding: EdgeInsets.only(right: 5)),
                  ],
                ),
                Text(formattedDate,style:
                GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [

                        Text('Earth',style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 30),),
                        Text('Colombo,Shuttleport',style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                        fontSize: 10),)
                      ],
                    ),
                    Row(
                      children: [
                        Text('-----',style:GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w800,
                            color: Colors.deepOrange,
                            fontSize: 20),),
                        SvgPicture.asset(
                          'assets/plane.svg',
                          width: mediaQuery.width*0.1,
                          height: 50,
                        ),
                        Text('-----',style:GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w800,
                            color: Colors.deepOrange,
                            fontSize: 20),),
                      ],
                    ),


                    Column(
                      children: [
                        Text('Mars',style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 30),),
                        Text('Jkat,Shuttleport',style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        fontSize: 10),)
                      ],
                    ),

                  ],
                ),
                Text(formattedTime,style:
                GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20),),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Container(
                          height: mediaQuery.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.elliptical(1000, 1400),topRight:Radius.elliptical(1000, 1400),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
                            color: Colors.white
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text('Seating Type',style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 20),),

                              Row(
                                children: [
                                  SizedBox(width: mediaQuery.width*0.25,),
                                  Expanded(
                                    child: DropdownButtonFormField(
                                        items: [
                                      DropdownMenuItem<String>(
                                        value: "Economy",
                                        child: Text("Economy",style: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                            fontSize: 20),textAlign: TextAlign.center),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: "Business",
                                        child: Text("Business",style: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                            fontSize: 20),textAlign: TextAlign.center,),
                                      ),
                                      // Add more items as needed
                                    ], onChanged:(value){},
                                      value: 'Economy',
                                     alignment: Alignment.center,
                                        style: GoogleFonts.nunitoSans(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                            fontSize: 20),
                                    dropdownColor: Colors.deepPurpleAccent,
                                     decoration: InputDecoration(fillColor: Colors.purpleAccent,filled: true,border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(12),
                                       borderSide: BorderSide(color: Colors.black12),

                                     ),
                                       suffixIcon: Transform.rotate(
                                         angle: 3.14159*1.5, // This is pi radians, which is equivalent to 180 degrees
                                         child: Icon(
                                           Icons.arrow_back_ios,
                                           color: Colors.white,
                                         ),

                                     ),
                                     )
                                    ),
                                  ),
                                  SizedBox(width: mediaQuery.width*0.25,)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(

                                      children: [
                                        SvgPicture.asset(
                                          'assets/booked.svg.svg',
                                          width: 30,
                                          height: 30,
                                        ),
                                        const Text('Booked')
                                      ],
                                    ),
                                    SizedBox(width: 5,),
                                    Column(

                                      children: [
                                        SvgPicture.asset(
                                          'assets/available.svg.svg',
                                          width: 30,
                                          height: 30,
                                        ),
                                        const Text('Available')
                                      ],
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/selected.svg.svg',
                                          width: 30,
                                          height: 30,
                                        ),
                                        const Text('Selected')
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                  width:250,height: 10,child: Container(
                                decoration: BoxDecoration(border:Border(top:BorderSide(color: Colors.black38) )),
                              )),
                              ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context){
                                          return BookingForm();
                                        }));
                                  },
                                  style: ButtonStyle(

                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: mediaQuery.width * .35,
                                              vertical: mediaQuery.height * .022)),

                                      backgroundColor: MaterialStateProperty.all(
                                          CustomColors.darkAccent)),
                                  child: isloading
                                      ? const CircularProgressIndicator(
                                    strokeWidth: 1,
                                    color: Colors.white,
                                  )
                                      : Text(
                                    "Continue",
                                    style: GoogleFonts.nunitoSans(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: mediaQuery.width * .04),
                                  )),
                              Text(selectedSeats.join(" , ")),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('1',style:GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,fontSize: 15)),
                                  Text('2',style:GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,fontSize: 15)),
                                  Text('3',style:GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,fontSize: 15)),
                                  SizedBox(width: 1,),
                                  Text('4',style:GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,fontSize: 15)),
                                  Text('5',style:GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,fontSize: 15)),
                                  Text('6',style:GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,fontSize: 15)),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 300,
                                      child: Column(
                                        children: [
                                          SeatLayoutWidget(
                                            onSeatStateChanged: (rowI, colI, seatState) {
                                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: seatState == SeatState.selected
                                                      ? Text("Selected Seat[$rowI][$colI]")
                                                      : Text("De-selected Seat[$rowI][$colI]"),
                                                ),
                                              );
                                              if (seatState == SeatState.selected) {
                                                selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                                              } else {
                                                selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                              }
                                            },
                                            stateModel: const SeatLayoutStateModel(
                                              pathDisabledSeat: 'selected.svg.svg',
                                              pathSelectedSeat: 'selected.svg.svg',
                                              pathSoldSeat: 'booked.svg.svg',
                                              pathUnSelectedSeat: 'available.svg.svg',
                                              rows: 5,
                                              cols: 3,
                                              seatSvgSize: 50,
                                              currentSeatsState: [
                                                [
                                                  SeatState.sold,
                                                  SeatState.sold,
                                                  SeatState.sold,
                                                  SeatState.sold,
                                                  SeatState.sold,

                                                ],
                                                [
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,

                                                ],
                                                [
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,

                                                ],
                                                [
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.sold,
                                                  SeatState.sold,
                                                  SeatState.unselected,

                                                ],
                                                [
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,

                                                ],
                                                [
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,
                                                  SeatState.unselected,

                                                ],

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 300,
                                      child: SeatLayoutWidget(
                                        onSeatStateChanged: (rowI, colI, seatState) {
                                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: seatState == SeatState.selected
                                                  ? Text("Selected Seat[$rowI][$colI]")
                                                  : Text("De-selected Seat[$rowI][$colI]"),
                                            ),
                                          );
                                          if (seatState == SeatState.selected) {
                                            selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
                                          } else {
                                            selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                          }
                                        },
                                        stateModel: const SeatLayoutStateModel(
                                          pathDisabledSeat: 'selected.svg.svg',
                                          pathSelectedSeat: 'selected.svg.svg',
                                          pathSoldSeat: 'booked.svg.svg',
                                          pathUnSelectedSeat: 'available.svg.svg',
                                          rows: 5,
                                          cols: 3,
                                          seatSvgSize: 50,
                                          currentSeatsState: [
                                            [
                                              SeatState.sold,
                                              SeatState.sold,
                                              SeatState.sold,
                                              SeatState.sold,
                                              SeatState.sold,

                                            ],
                                            [
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,

                                            ],
                                            [
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,

                                            ],
                                            [
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.sold,
                                              SeatState.sold,
                                              SeatState.unselected,

                                            ],
                                            [
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,

                                            ],
                                            [
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,
                                              SeatState.unselected,

                                            ],

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),



              ],
            ),
          ),
      ),

    );
  }
}
class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == (other as SeatNumber).colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}

class SeatLayout extends StatelessWidget {
  final int rows = 6;
  final int seatsPerRow = 4;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(rows, (rowIndex) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(seatsPerRow, (seatIndex) {
                final seatNumber = rowIndex * seatsPerRow + seatIndex + 1;
                final isAisle = seatIndex == 0 || seatIndex == seatsPerRow - 1;
                final seatColor = isAisle ? Colors.transparent : Colors.green;

                return Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(4),
                  color: seatColor,
                  child: Center(
                    child: isAisle
                        ? SizedBox.shrink()
                        : Text(
                      seatNumber.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
