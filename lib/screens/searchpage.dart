import 'package:demo/data.dart';
import 'package:demo/models/cities.dart';
import 'package:demo/screens/city_hotels.dart';
import 'package:demo/widgets/city.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int counter = 0;
  final cityName = TextEditingController();
  void selectCity(BuildContext context, String id, String title) {
    Navigator.of(context)
        .pushNamed(CityHotels.routeName, arguments: [id, title]);
  }

  @override
  Widget build(BuildContext context) {
    Widget displayCity(context) {
      final enteredCity = cityName.text;
      final List<Cities> mycity = DUMMY_CITIES.where(
        (element) {
          return element.title == enteredCity;
        },
      ).toList();

      if (mycity.length == 0) {
        return const Center(
          child: Text(
            'No City Found :(',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }

      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Search Results :)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                selectCity(context, mycity[0].id, mycity[0].title);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 5,
                margin: const EdgeInsets.all(5),
                child: Container(
                  height: 250,
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
                              mycity[0].imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          mycity[0].title,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
                    icon: const Icon(Icons.clear),
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
      body: counter == 0
          ? Center(
              child: const Text('Search City '),
            )
          : displayCity(context),
    );
  }
}
