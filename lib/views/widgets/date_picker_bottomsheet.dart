import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerBottomsheet extends StatefulWidget {

  final Function(String?)? onSelectDate;
  const DatePickerBottomsheet({ super.key, this.onSelectDate });

  @override
  _DatePickerBottomsheetState createState() => _DatePickerBottomsheetState();
}

class _DatePickerBottomsheetState extends State<DatePickerBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.65,
      decoration: const BoxDecoration(
        // color: Theme.of(context).highlightColor
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

SfDateRangePicker(


  backgroundColor: Colors.transparent,
    // view: DateRangePickerView.year,
  )
, 
const Spacer(),

 Row(
  children: [
Expanded(child: GestureDetector(
  onTap: (){
    Navigator.pop(context);
  },
  child: Container(
  height: 40,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      50
    ),
    border: Border.all(
      width: .5,
      color: Colors.white
    )
  ),
  child: const Center(
    child: Text(
      'Cancel',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    ),
  ),
  
  ),
)),

    const SizedBox(width: 5,),

Expanded(child:  GestureDetector(
  onTap: (){
    Navigator.pop(context);
  },
  child: Container(
  height: 40,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(
      50
    ),
    border: Border.all(
      width: .5,
      color: Colors.white
    )
  ),
  child: const Center(
    child: Text(
      'Save',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
    ),
  ),
  
  ),
)),



  ],
),
const SizedBox(height: 8,), 




        ],
      ),
    );
  }
}