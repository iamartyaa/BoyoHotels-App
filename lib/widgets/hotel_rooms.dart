import 'package:demo/data.dart';
import 'package:demo/models/room.dart';
import 'package:demo/widgets/room_item.dart';
import 'package:flutter/material.dart';

class HotelRooms extends StatefulWidget {
  final String hotelId;
  final String cityName;
  final String hotelName;
  final Function addNewBooking;
  HotelRooms({required this.hotelId, required this.cityName, required this.hotelName,required this.addNewBooking});

  late List<Room> hotelRooms = DUMMY_ROOMS.where((element) {
    return element.hotelId == hotelId;
  }).toList();

  @override
  State<HotelRooms> createState() => _HotelRoomsState();
}

class _HotelRoomsState extends State<HotelRooms> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(22),
      children: [
        ...widget.hotelRooms.map((room) {
          return RoomItem(
            id: room.id,
            cityName: widget.cityName,
            hotelName: widget.hotelName,
            addNewBooking: widget.addNewBooking,
          );
        }).toList(),
      ],
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 600,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
