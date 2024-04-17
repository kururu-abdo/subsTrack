import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

Text("Recurring Payments", 
style: TextStyle(
  color: Theme.of(context).colorScheme.onBackground,
  fontWeight: FontWeight.bold , fontSize: 20
),
), 

IconButton(onPressed: (){

}, icon: Icon(Icons.arrow_forward,
  color: Theme.of(context).colorScheme.onBackground,

))

      ],
    );
  }
}