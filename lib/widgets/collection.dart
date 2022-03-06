import 'package:demo/data.dart';
import 'package:demo/models/room.dart';
import 'package:demo/screens/hotel_detail.dart';
import 'package:demo/widgets/booking.dart';
import 'package:flutter/material.dart';

class Collections extends StatefulWidget {
  final String id;
  final String cityName;
  final String hotelName;
  Collections({ required this.id,required this.cityName,required this.hotelName});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  late Room room = DUMMY_ROOMS.firstWhere((element) {
    return element.id == widget.id && element.hotelId=="h2";
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(room.img),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
            ),
            Container(
              width: 250,
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  room.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                '${room.title} :  ${room.area} sqft',
                style: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.bed,
                        color: Colors.black45,
                      ),
                      Icon(Icons.ac_unit_rounded,color: Colors.black45),
                      Icon(Icons.wifi,color: Colors.black45),
                      Icon(Icons.restaurant,color: Colors.black45),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      '\u{20B9} ${room.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoCondensed',
                      ),
                    ),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
