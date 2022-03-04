import 'package:demo/screens/city_hotels.dart';
import 'package:flutter/material.dart';

class City extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  City({required this.id, required this.title, required this.imageUrl});

  void selectCity(BuildContext context) {
    Navigator.of(context).pushNamed(CityHotels.routeName,arguments:[id,title]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {selectCity(context);},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.asset(
                    imageUrl,
                    // height: 100,
                    // width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
