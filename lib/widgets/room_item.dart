import 'package:demo/data.dart';
import 'package:demo/models/room.dart';
import 'package:demo/screens/hotel_detail.dart';
import 'package:demo/widgets/booking.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatefulWidget {
  final String id;
  final String cityName;
  final String hotelName;
  final Function addNewBooking;
  final String hotelId;
  RoomItem({ required this.id,required this.cityName,required this.hotelName, required this.addNewBooking,required this.hotelId});

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  late Room room = DUMMY_ROOMS.firstWhere((element) {
    return element.id == widget.id && element.hotelId==widget.hotelId;
  });

  void bookHotel(BuildContext ctx,String id) {
    
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          child:NewBooking(id,widget.cityName,widget.hotelName,widget.addNewBooking),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

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
              padding: const EdgeInsets.all(15),
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
                padding: const EdgeInsets.all(5),
                child: Text(
                  room.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                '${room.title} :  ${room.area} sqft',
                style: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
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
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      '\u{20B9} ${room.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoCondensed',
                      ),
                    ),
                  ),
                  Container(
                    width: 220,
                    child: OutlinedButton(
                      onPressed: () {
                        bookHotel(context,room.id);
                      },
                      child: Text('SELECT'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5);
                            }
                            return null; // Use the component's default.
                          },
                        ),
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
