import 'package:finance_app/data/models/subscription.dart';
import 'package:finance_app/data/models/subscription_type.dart';
import 'package:flutter/material.dart';

import 'data/models/service.dart';

List payments = [

  {
    "name":"Spotify",
    "total":"\$3.99",
    "per":"Week",
    "category":"music"
  }, 

  {
    "name":"Grocery",
    "total":"\$50.99",
    "per":"Month",
    "category":"store"
  }, 

];
class Payment {
   String? name;
   String? total;
   String? per;
   String? category;

  Payment({required this.name, required this.total, required this.per, required this.category});

Payment.fromJosn(Map<String, dynamic> json){
  name= json['name'];
  total= json['total'];
  per= json['per'];
  category= json['category'];

}



}


List<Payment> paymentData = payments.map((e) => Payment.fromJosn(e)).toList();



List<Subscription>
subs =[

  Subscription(

    logo: 'assets/appl_tv.png',
    serviceTitle: 'Apple Tv',
    amount: '-\$4.99',
    lastPaymentDate: 'Sep 25th',
    subsType: 'Advanced'
  ),

  Subscription(

    logo: 'assets/dropbox_white.png',
    serviceTitle: 'DrobBox',
    amount: '-\$20.19',
    lastPaymentDate: 'Oct 11th',
    subsType: 'Premium'
  ),
    Subscription(

    logo: 'assets/prime_white.png',
    serviceTitle: 'Amazon prime',
    amount: '-\$10.99',
    lastPaymentDate: 'Mar 25th',
    subsType: 'Advanced'
  ),


];





List<Service>
services =[

  Service(

    logo: 'assets/appl_tv.png',
    title: 'Apple Tv',
    price: '4.99',
    category: 'Professional',
    per: '\$ / Month',
    isActice: ValueNotifier(true)
  ),
Service(

    logo: 'assets/dropbox_white.png',
    title: 'Dropbox',
    price: '10.99',
    category: 'Business Plus',
    per: '\$ / Month',
    isActice: ValueNotifier(false)
  ),
  
];

List<SubscriptionType> subTypes =[
SubscriptionType(per: '\$ / m', title: 'Basic' , price: '4,99'),
SubscriptionType(per: '\$ / m', title: 'Standard' , price: '7,49'),
SubscriptionType(per: '\$ / m', title: 'Premium' , price: '9,99'),


];


