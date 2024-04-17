import 'package:flutter/material.dart';

class Service {
  final String? title;

  final String? category;
  final String? per;
  final String? price;
    final String? logo;
   ValueNotifier<bool>? isActice;

  Service({required this.title, required this.category, 
  required this.per, required this.price, required this.logo, 
  required
   this.isActice});


}