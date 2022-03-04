import 'package:demo/data.dart';
import 'package:demo/models/cities.dart';
import 'package:demo/widgets/city.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
    int counter = 0;
  @override
  Widget build(BuildContext context) {
    final cityName = TextEditingController();

    Widget displayCity(context) {
      final Cities mycity = DUMMY_CITIES.firstWhere(
        (element) {
          return element.title == cityName;
        },
      );
      print(mycity.title);
      return City(
        id: mycity.id,
        title: mycity.title,
        imageUrl: mycity.imageUrl,
      );
    }


    void incrementCounter() {
      setState(() {
        counter++;
      });
    }

    return Scaffold(
      appBar: AppBar(
        // The search area here
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  hintText: 'Search City...',
                  border: InputBorder.none),
              onSubmitted: (val) {
                incrementCounter();
              },
              controller: cityName,
            ),
          ),
        ),
      ),
      body: counter == 0 ? Text('Hell') : displayCity(context),
    );
  }
}
