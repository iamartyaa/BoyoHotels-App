import 'package:demo/models/hotels.dart';
import 'package:demo/models/room.dart';
import 'package:flutter/material.dart';

import '../models/cities.dart';

List<Cities> DUMMY_CITIES = const [
  Cities(
    id: 'c1',
    title: 'Delhi',
    imageUrl: 'assets/images/delhi.jpg',
  ),
  Cities(
    id: 'c2',
    title: 'Mumbai',
    imageUrl: 'assets/images/mumbai.jpg',
  ),
  Cities(
    id: 'c3',
    title: 'Bangalore',
    imageUrl: 'assets/images/bangalore.jpg',
  ),
  Cities(
    id: 'c4',
    title: 'Chennai',
    imageUrl: 'assets/images/chennai.jpeg',
  ),
  Cities(
    id: 'c5',
    title: 'Agra',
    imageUrl: 'assets/images/agra.jpg',
  ),
  Cities(
    id: 'c6',
    title: 'Jaipur',
    imageUrl: 'assets/images/jaipur.jpg',
  ),
];

List<Hotel> DUMMY_HOTEL = const [
  Hotel(
      id: 'h1',
      cityId: 'c1',
      name: 'Aakash Residency',
      address: 'Near Saint Mary School, Paryavaran Complex,Delhi',
      rating: 3.4,
      amenities: ['AC', 'Free Wifi'],
      rooms: 2,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/38100/large/5fb416b646cb41ce.jpg',
      ),
  Hotel(
      id: 'h2',
      cityId: 'c6',
      name: 'Hotel Classico Inn',
      address: 'Near Ekta Nagar Road, Dhawas,Jaipur',
      rating: 5.0,
      amenities: ['AC', 'Free Wifi'],
      rooms: 1,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/92183/large/f7b8b7daa72aa5f5.jpg',
      ),
  Hotel(
      id: 'h3',
      cityId: 'c5',
      name: 'Taj Classic',
      address: 'Taj Classic, Dhandhupur, Agra',
      rating: 4.6,
      amenities: ['AC', 'Free Wifi','TV'],
      rooms: 2,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/84393/large/1c7a50b6e5d8c668.jpg',
      ),
    Hotel(
      id: 'h4',
      cityId: 'c5',
      name: 'Hotel Riviera',
      address: 'Fatehabad Road, Near Pacific Mall, Agra',
      rating: 4.4,
      amenities: ['AC', 'Free Wifi','TV','Restaurant','Parking'],
      rooms: 3,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/16399/large/0e327869e1ba8d94.jpg',
      ),
];

List<Room> DUMMY_ROOMS = [
  Room(hotelId: 'h4',id: 'r1', title: 'CLASSIC (2X)', area: 104, price: 800, img: "https://images.oyoroomscdn.com/uploads/hotel_image/16399/medium/147439ed52595f9e.jpg",),
  Room(hotelId: 'h4',id: 'r2', title: 'DELUXE (3X)', area: 104, price: 1200, img: "https://images.oyoroomscdn.com/uploads/hotel_image/16399/medium/b0003717dad52494.jpg",),
  Room(hotelId: 'h4',id: 'r3', title: 'SUITE (4X)', area: 270, price: 1500, img: "https://images.oyoroomscdn.com/uploads/hotel_image/16399/medium/94fee63252f49986.jpg",),

];