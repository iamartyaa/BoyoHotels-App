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
      name: 'Hotel Silver Star',
      address: 'Near Medanta Hospital, Medicity, Gurgaon',
      rating: 4.3,
      amenities: ['AC','Kitchen', 'Free Wifi'],
      rooms: 1,
      img: 'https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/246465809.jpg?k=d2b4177f5aa8fe46759d264c1dc1dd339022bdd69b8438cc7c554761b88123a1&o=&hp=1',
      ),
  Hotel(
      id: 'h2',
      cityId: 'c6',
      name: 'METROPOLITAN',
      address: '22 Godam Cir, Durgadas Colony, C Scheme, Ashok Nagar, Jaipur',
      rating: 5.0,
      amenities: ['AC', 'Free Wifi','Swimming Pool','Parking','Restaurant'],
      rooms: 4,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/79251/medium/98da66489ed5fd5a.jpg',
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
    Hotel(
      id: 'h5',
      cityId: 'c2',
      name: 'Daryavardi Beach Resort',
      address: 'Near Rajodi Beach , Rajodi, Mumbai',
      rating: 3.5,
      amenities: ['AC', 'Free Wifi','TV','Seating Area','Restaurant','Parking'],
      rooms: 1 ,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/83285/medium/65e017104bd79eae.jpg',
      ),
    Hotel(
      id: 'h6',
      cityId: 'c3',
      name: 'Withinn Hotel',
      address: 'Near NIAS, Mathikere Extension, Bangalore',
      rating: 4.7,
      amenities: ['AC','Power Backup','Kitchen','Free Wifi','TV','Restaurant','Parking'],
      rooms: 1,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/56157/medium/8b8caf778601e819.jpg',
      ),
    Hotel(
      id: 'h7',
      cityId: 'c4',
      name: ' Senthamizh Residency',
      address: '3, 301,Madhakovil St,Vivekananda Nagar, Thoraipakkam , Chennai',
      rating: 4.6,
      amenities: ['Doctor on-Call','AC', 'Free Wifi','TV','Restaurant','Parking'],
      rooms: 1,
      img: 'https://images.oyoroomscdn.com/uploads/hotel_image/115463/large/499464113e93c830.jpg',
      ),
];

List<Room> DUMMY_ROOMS = const [
  Room(hotelId: 'h1',id: 'r1', title: 'CLASSIC (2X)', area: 130, price: 999, img: "https://images.oyoroomscdn.com/uploads/hotel_image/74/medium/98b07c8f8136b8d1.jpg",),

  Room(hotelId: 'h2',id: 'r1', title: 'DELUXE', area: 300, price: 6399, img: "https://images.oyoroomscdn.com/uploads/hotel_image/79251/medium/de2a3d75492b9ae2.jpg",),
  Room(hotelId: 'h2',id: 'r2', title: 'CLUB', area: 350, price: 8499, img: "https://images.oyoroomscdn.com/uploads/hotel_image/79251/medium/b5668f79e109ff52.jpg",),
  Room(hotelId: 'h2',id: 'r3', title: 'SUPERIOR', area: 460, price: 10999, img: "https://images.oyoroomscdn.com/uploads/hotel_image/79251/medium/47cbebd74e6072e7.jpg",),
  Room(hotelId: 'h2',id: 'r4', title: 'SUITE', area: 800, price: 13999, img: "https://images.oyoroomscdn.com/uploads/hotel_image/79251/medium/23744f9bc28f6e61.jpg",),

  Room(hotelId: 'h4',id: 'r1', title: 'CLASSIC (2X)', area: 104, price: 799, img: "https://images.oyoroomscdn.com/uploads/hotel_image/16399/medium/147439ed52595f9e.jpg",),
  Room(hotelId: 'h4',id: 'r2', title: 'DELUXE (3X)', area: 104, price: 1199, img: "https://images.oyoroomscdn.com/uploads/hotel_image/16399/medium/b0003717dad52494.jpg",),
  Room(hotelId: 'h4',id: 'r3', title: 'SUITE (4X)', area: 270, price: 1499, img: "https://images.oyoroomscdn.com/uploads/hotel_image/16399/medium/94fee63252f49986.jpg",),

  Room(hotelId: 'h5',id: 'r1', title: 'CLASSIC (2X)', area: 180, price: 8227, img: "https://images.oyoroomscdn.com/uploads/hotel_image/83285/medium/77a832263397d8d5.jpg",),

  Room(hotelId: 'h6',id: 'r1', title: 'CLASSIC (2X)', area: 115, price: 1499, img: "https://images.oyoroomscdn.com/uploads/hotel_image/56157/medium/3c1115b350f3b904.jpg",),

  Room(hotelId: 'h7',id: 'r1', title: 'CLASSIC (2X)', area: 130, price: 1231, img: "https://images.oyoroomscdn.com/uploads/hotel_image/115463/medium/9ac4d266c3e37117.jpg",),
  
];