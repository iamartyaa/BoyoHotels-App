import 'package:demo/data.dart';
import 'package:demo/models/cities.dart';
import 'package:demo/models/hotels.dart';
import 'package:demo/widgets/hotel_item.dart';
import 'package:flutter/material.dart';

class MyFavourites extends StatelessWidget {
  static const routeName = '/fav-hotels';
  final List<Hotel> _favHotels;
  const MyFavourites(this._favHotels);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: _favHotels.length == 0
          ? const Center(
              child: Text(
                'No Favourites Added!',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final Cities cityName = DUMMY_CITIES.firstWhere(
                  (element) {
                    return element.id == _favHotels[index].cityId;
                  },
                );
                return HotelItem(
                  hId: _favHotels[index].id,
                  name: _favHotels[index].name,
                  ratings: _favHotels[index].rating,
                  amenities: _favHotels[index].amenities,
                  himg: _favHotels[index].img,
                  cityName: cityName.title,
                );
              },
              itemCount: _favHotels.length,
            ),
    );
  }
}
