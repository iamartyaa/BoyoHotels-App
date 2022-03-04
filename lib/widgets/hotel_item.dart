import 'package:demo/screens/hotel_detail.dart';
import 'package:flutter/material.dart';

class HotelItem extends StatelessWidget {
  final String hId;
  final String name;
  final double ratings;
  final List<String> amenities;
  final String himg;
  final String cityName;
  HotelItem({
    required this.hId,
    required this.name,
    required this.ratings,
    required this.amenities,
    required this.himg,
    required this.cityName,
  });

  void selectHotel(BuildContext context) {
    Navigator.of(context).pushNamed(
      HotelDetail.routeName,
      arguments: hId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectHotel(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    himg,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.hotel),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Boyo $name',
                        style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Rating : ${ratings}',
                            style: TextStyle(fontFamily: 'RobotoCondensed'),
                          ),
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          Text(
                            '${cityName}',
                            style: TextStyle(fontFamily: 'RobotoCondensed'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
