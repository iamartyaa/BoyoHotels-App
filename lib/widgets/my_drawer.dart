import 'package:demo/models/hotels.dart';
import 'package:demo/screens/favourites.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final List<Hotel> favHotels;
  const MyDrawer(this.favHotels);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 400,
            //flex: 2,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Boyo Hotels',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: const Icon(
                  Icons.person_rounded,
                  color: Colors.indigo,
                ),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                title: const Text("Favourites"),
                onTap: () {
                  Navigator.pushNamed(context, MyFavourites.routeName,
                      arguments: favHotels);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.amber,
                ),
                title: Text("About"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                title: Text("Settings"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
