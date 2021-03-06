import 'package:demo/data.dart';
import 'package:demo/models/category.dart';
import 'package:demo/models/room.dart';
import 'package:demo/widgets/categories.dart';
import 'package:demo/widgets/city.dart';
import 'package:demo/widgets/collection.dart';
import 'package:demo/widgets/room_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  late List<Room> hotelRooms = DUMMY_ROOMS.where((element) {
    return element.hotelId == "h2";
  }).toList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
            child: const Text(
              'Boyo Top Cities',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(2),
              children: [
                ...DUMMY_CITIES.map((catData) {
                  return Container(
                    height: 100,
                    width: 100,
                    child: City(
                      id: catData.id,
                      title: catData.title,
                      imageUrl: catData.imageUrl,
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
            child: const Text(
              'Explore your wanderlust',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            width: double.infinity,
            child: GridView(
              padding: const EdgeInsets.all(10),
              children: [
                ...DUMMY_CATEGORIES.map((catData) {
                  return CategoryItem(
                    id: catData.id,
                    title: catData.title,
                    img: catData.img,
                  );
                }).toList(),
              ],
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
          const Divider(
            height: 20,
          ),
          Container(
            height: 40,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
            child: const Text(
              'Our Top Collection',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 320,
            child: GridView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                ...hotelRooms.map((room) {
                  return Collections(
                    id: room.id,
                    cityName: "Jaipur",
                    hotelName: "Metropolitan",
                    //addNewBooking: widget.addNewBooking,
                    //hotelId: widget.hotelId,
                  );
                }).toList(),
              ],
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
