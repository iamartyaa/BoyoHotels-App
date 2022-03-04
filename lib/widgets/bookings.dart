import 'package:demo/data.dart';
import 'package:demo/models/hotels.dart';
import 'package:demo/models/transaction.dart';
import 'package:demo/screens/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Bookings extends StatelessWidget {
  static const routeName = '/bookings';
  final List<Transaction> userTransactions;
  const Bookings(this.userTransactions);

  String getHotel(Transaction tx) {
    final Hotel hotel = DUMMY_HOTEL.firstWhere((element) {
      return tx.hotelName == element.name;
    });
    return hotel.img;
  }

  @override
  Widget build(BuildContext context) {
    return  userTransactions.length == 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'No Bookings History!',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                child: Text('Book Now'),
              ),
            ],
          )
        : Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('User Bookings',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              ),
            ),
            Container(
              height: 500,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Image.network(
                              getHotel(userTransactions[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(' ${userTransactions[index].hotelName}: ${userTransactions[index].cityname} ',
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'From: ${DateFormat.yMMMd().format(userTransactions[index].dateFrom)}',
                              ),
                              Text(
                                'To: ${DateFormat.yMMMd().format(userTransactions[index].dateTo)}',
                              ),
                            ],
                          ),
                          trailing: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(userTransactions[index].persons),),
                        ),
                      ),
                    );
                  },
                  itemCount: userTransactions.length,
                ),
            ),
          ],
        );
  }
}
