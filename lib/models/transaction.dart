import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  final String bookId;
  final String hotelName;
  final String roomId;
  final int price;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String persons;
  final String name;
  final String cityname;

  const Transaction({
    required this.bookId,
    required this.hotelName,
    required this.roomId,
    required this.price,
    required this.dateFrom,
    required this.dateTo,
    required this.name,
    required this.cityname,
    required this.persons,
  });

}