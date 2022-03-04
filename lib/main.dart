// main.dart
import 'package:demo/data.dart';
import 'package:demo/models/transaction.dart';
import 'package:demo/models/hotels.dart';
import 'package:demo/screens/city_hotels.dart';
import 'package:demo/screens/favourites.dart';
import 'package:demo/screens/hotel_detail.dart';
import 'package:demo/widgets/bookings.dart';
import 'package:demo/widgets/home.dart';
import 'package:demo/widgets/my_drawer.dart';
import 'package:demo/screens/searchpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Hotel> _favHotels = [];
  final List<Transaction> _userBookings = [];

  void _toggleFavourite(String hotelId) {
    final existingIndex = _favHotels.indexWhere((hotel) {
      return hotel.id == hotelId;
    });

    if (existingIndex >= 0) {
      setState(() {
        _favHotels.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favHotels.add(DUMMY_HOTEL.firstWhere((hotel) {
          return hotel.id == hotelId;
        }));
      });
    }
  }

  bool isHotelFavorite(String id) {
    return _favHotels.any((hotel) {
      return hotel.id == id;
    });
  }

  void addNewBooking(String bookId,String hotelname,String roomId, int price,DateTime dateFrom,DateTime dateTo, String name,String cityName, String persons ) {
    final tx = Transaction(
        bookId: bookId,
        hotelName: hotelname,
        roomId: roomId,
        price: price,
        dateFrom: dateFrom,
        dateTo: dateTo,
        name: name,
        cityname: cityName,
        persons: persons);
    setState(() {
      _userBookings.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Boyo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          headline3: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold),
        ),
      ),
      //home: HomePage(),
      routes: {
        '/': (context) => HomePage(_favHotels,_userBookings),
        CityHotels.routeName: (context) => CityHotels(),
        HotelDetail.routeName: (context) => HotelDetail(_toggleFavourite, isHotelFavorite,addNewBooking),
        MyFavourites.routeName: (context) => MyFavourites(_favHotels),
        Bookings.routeName:(context) => Bookings(_userBookings),
      },
    );
  }
}

// Home Page
class HomePage extends StatefulWidget {
  final List<Hotel> favHotels;
  final List<Transaction> bookings;

  HomePage(this.favHotels,this.bookings);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.grey);
  var options;

  @override
  void initState() {
    
    options = [
    Home(),
    Bookings(widget.bookings),
    const Center(
      child: Text(
        'Coming Soon',
        style: optionStyle,
      ),
    ),
    const Center(
      child: Text(
        'Coming Soon',
        style: optionStyle,
      ),
    ),
  ];
    super.initState();
  }
  
  int _selectedPage = 0;

  // void _selectPage(int index) {
  //   setState(() {
  //     _selectedPage = index;
  //   });
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boyo'),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search))
        ],
      ),
      drawer: MyDrawer(widget.favHotels),
      body: options[_selectedPage] ,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_rounded),
            label: 'Bookings',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
            backgroundColor: Colors.indigo,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
