import 'package:demo/data.dart';
import 'package:demo/models/hotels.dart';
import 'package:demo/widgets/hotel_item.dart';
import 'package:flutter/material.dart';

class CityHotels extends StatelessWidget {
  static const routeName = '/city-hotels';
  late String cityId;
  late String cityName;

  late List<Hotel> availableHotels;

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as List;
    cityId = routeArgs[0];
    cityName = routeArgs[1];

    availableHotels = DUMMY_HOTEL.where(
      (hotel) {
        return hotel.cityId == cityId;
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return HotelItem(
            hId: availableHotels[index].id,
            name: availableHotels[index].name,
            ratings: availableHotels[index].rating,
            amenities: availableHotels[index].amenities,
            himg: availableHotels[index].img,
            cityName: cityName,
          );
        },
        itemCount: availableHotels.length,
      ),
    );
  }
}
