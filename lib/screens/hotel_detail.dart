import 'package:demo/data.dart';
import 'package:demo/models/cities.dart';
import 'package:demo/models/hotels.dart';
import 'package:demo/widgets/hotel_rooms.dart';
import 'package:flutter/material.dart';

class HotelDetail extends StatelessWidget {
  static const routeName = '/hotel-detail-screen';
  final Function toggleFavourite;
  final Function isHotelFavourite;
  final Function addNewBooking;
  HotelDetail(this.toggleFavourite, this.isHotelFavourite,this.addNewBooking);

  @override
  Widget build(BuildContext context) {
    final hotelId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedHotel = DUMMY_HOTEL.firstWhere(
      (hotel) {
        return hotel.id == hotelId;
      },
    );
    final Cities city = DUMMY_CITIES.firstWhere((city) {
      return city.id == selectedHotel.cityId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedHotel.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hotelheader(selectedHotel: selectedHotel, city: city),
            hotelbody(selectedHotel: selectedHotel),
            const Divider(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                'Rooms',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //
            Container(
                height: 420,
                width: 400,
                child: HotelRooms(
                  hotelId: hotelId,
                  cityName: city.title,
                  hotelName: selectedHotel.name,
                  addNewBooking: addNewBooking,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isHotelFavourite(hotelId) == true
              ? Icons.favorite
              : Icons.favorite_border_outlined,
        ),
        onPressed: () {
          toggleFavourite(hotelId);
        },
      ),
    );
  }
}

// hotel body

class hotelbody extends StatelessWidget {
  const hotelbody({
    Key? key,
    required this.selectedHotel,
  }) : super(key: key);

  final Hotel selectedHotel;
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      // margin: const EdgeInsets.symmetric(
      //   vertical: 10,
      // ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child, double h) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //border: Border.all(color: Colors.grey),
        //borderRadius: BorderRadius.circular(15),
      ),
      //margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      height: h,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: buildSectionTitle(context, 'Description'),
            ),
            Divider(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                'Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            buildContainer(
                context,
                Text(
                  selectedHotel.address,
                ),
                35),
            const Divider(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(3),
              child: Text(
                'Amenities',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    //color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        '${index + 1}  :  ${selectedHotel.amenities[index]}',
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedHotel.amenities.length,
              ),
              100,
            ),
          ],
        ),
      ),
    );
  }
}

// Hotel Header

class hotelheader extends StatelessWidget {
  const hotelheader({
    Key? key,
    required this.selectedHotel,
    required this.city,
  }) : super(key: key);

  final Hotel selectedHotel;
  final Cities city;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedHotel.img,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.hotel),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Boyo ${selectedHotel.name}',
                      style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
                Divider(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      child: Card(
                        elevation: 3,
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${selectedHotel.rating}',
                                style: const TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const VerticalDivider(
                                color: Colors.white,
                                width: 5,
                              ),
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          SizedBox(
                            height: 20,
                            width: 30,
                            child: CircleAvatar(
                              child: Text(
                                'B',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Boyo Member',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${city.title}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                            fontSize: 18,
                          ),
                        ),
                        const Icon(
                          Icons.location_on,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
          ),
        ],
      ),
    );
  }
}
