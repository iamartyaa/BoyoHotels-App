import 'package:demo/data.dart';
import 'package:demo/models/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

class NewBooking extends StatefulWidget {
  final Function addNewBooking;
  final String roomId;
  late String roomName = room.title;
  late int roomPrice = room.price;
  final String hotelName;
  final String cityName;
  late Room room = DUMMY_ROOMS.firstWhere((element) {
    return element.id == roomId;
  });
  NewBooking(this.roomId, this.cityName, this.hotelName, this.addNewBooking);

  @override
  State<NewBooking> createState() => _NewBookingState();
}

class _NewBookingState extends State<NewBooking> {
  final nameController = TextEditingController();
  late DateTime dateFrom;
  late DateTime dateTo;
  final ageController = TextEditingController();
  final personsController = TextEditingController();
  int d1 = 0, d2 = 0;

  void submitData() {
    final enteredName = nameController.text;
    final enteredPersons = personsController.text ;
    final String bId= DateTime.now().toString();
    // if (enteredPersons as int <= 0 ||
    //     enteredName.isEmpty ||
    //     enteredPersons as int >= 3) {
    //   return;
    // }
    if (dateFrom == null || dateTo == null) {
      return;
    }
    widget.addNewBooking(
      bId,
      widget.hotelName,
      widget.roomId,
      (dateTo.day - dateFrom.day) * widget.roomPrice,
      dateFrom,
      dateTo,
      enteredName,
      widget.cityName,
      enteredPersons,
    );
    Navigator.of(context).pushReplacementNamed('/');

  }

  void _presentDatePicker1() {
    showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
      borderRadius: 16,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        d1 = 1;
        dateFrom = value;
      });
    });
  }

  void _presentDatePicker2() {
    showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
      borderRadius: 16,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        d2 = 1;
        dateTo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  'Now Booking',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Divider(),
              const Text(
                'Booking Details',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.hotelName}',
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Room: ${widget.roomName}',
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Price/Night : \u{20B9} ${widget.roomPrice}',
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        "https://images.oyoroomscdn.com/uploads/hotel_image/16399/large/0e327869e1ba8d94.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              const Text(
                'Guest Details',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                //onChanged: (val) {
                //  titleInput=val;
                //},
                controller: nameController,
                onSubmitted: (val) {submitData();},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Number of Guests'),
                //onChanged: (val) {
                //  titleInput=val;
                //},
                controller: personsController,
                keyboardType: TextInputType.number,
                onSubmitted: (val) {submitData();},
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        d1 == 0
                            ? 'Choose Date From : '
                            : 'Date From : ${DateFormat.yMMMd().format(dateFrom)}',
                        style: const TextStyle(
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    OutlinedButton(
                      //textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        _presentDatePicker1();
                      },
                      child: const Text(
                        'Chose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'RobotoCondensed'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        d2 == 0
                            ? 'Choose Date To :'
                            : 'Date To : ${DateFormat.yMMMd().format(dateTo)}',
                        style: const TextStyle(
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    OutlinedButton(
                      //textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        _presentDatePicker2();
                      },
                      child: const Text(
                        'Chose Date',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'RobotoCondensed'),
                      ),
                    ),
                  ],
                ),
              ),
              // Divider(),
              // Text(
              //   dateTo==null && dateFrom==null ? 'Total : ' : 'Total : \u{20B9} ${(dateTo.day - dateFrom.day) * widget.roomPrice}'),
              ElevatedButton(
                onPressed: () {
                  submitData();
                },
                child: const Text(
                  'Pay  & Book Now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
