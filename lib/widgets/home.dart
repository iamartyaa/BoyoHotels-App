import 'package:demo/data.dart';
import 'package:demo/widgets/city.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
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

        Divider(
          height: 20,
        ),

        Container(
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

      ],
    );
  }
}
