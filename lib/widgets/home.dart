import 'package:demo/data.dart';
import 'package:demo/models/category.dart';
import 'package:demo/models/room.dart';
import 'package:demo/widgets/categories.dart';
import 'package:demo/widgets/city.dart';
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
          Container(
            height: 200,
            width: double.infinity,
            child: GridView(
              padding: const EdgeInsets.all(22),
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
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            ),
          ),
          const Divider(
            height: 20,
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
            child: const Text(
              'Our Collection',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
            child: const Center(
              child: Text(
                'Section Coming Soon',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
