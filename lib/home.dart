
import 'dart:developer';

import 'package:finance_app/data.dart';
import 'package:finance_app/views/widgets/subscription_container.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
 
   Animation<Offset>? postionAnimation;
 


AnimationController? animationController;
String _selectedHistory='';
bool? _opened=false;
List<String> times = [

     
  'This Year',
  'All Time',
];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
       _selectedHistory ='All Time';

animationController= AnimationController(vsync: this,
duration: const Duration(milliseconds: 500)
);



postionAnimation= Tween<Offset>(begin: 
const Offset(0, 1)
, end:const Offset(0, 0))
.animate(animationController!);

animationController!.forward();



  }
@override
  void dispose() {

animationController!.dispose() ;
   super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {var direction =Directionality.of(context);
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:IconButton(onPressed: (){

}, icon: const Icon(Icons.menu , color: Colors.white,))
  ,
  actions: [
    IconButton(onPressed: (){

}, icon: const Icon(Icons.notifications_outlined)), 
  ],
      ),
    body: SizedBox.expand(
      child: Column(
        children: [
           Padding(
padding: const EdgeInsets.symmetric(
         horizontal: 10
       ),             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
             
               children: [
                 const Text("\$256.0" , style: TextStyle(
                   
                   fontSize: 35 , color: Colors.white
                 ),),
             
                  Text("Your spending" , style: TextStyle(
                   
                   fontSize: 12 , color: Theme.of(context).highlightColor
                 ),),
               ],
             )
             
             
             
             
             , 
             
             
             
                   Container(
                  margin: const EdgeInsets.all(8),
             
                     padding: const EdgeInsets.all(5),
                // width: 150,
                     // height: 50,
             
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       border:Border.all(
              width: .5 ,color: Theme.of(context).highlightColor
                       )
                     ),
                     child: Center(
                       child: 
             
                       
                       PopupMenuButton(
                 offset: const Offset(0, 40),
                 elevation: 2,
                 iconSize: 18,
                 onOpened: (){
               _opened=true;
                   setState(() {
                     
                   });
                 },
                 onCanceled: (){
                   _opened=false;
                   setState(() {
                     
                   }); 
                 },
                 onSelected: (str){
                   log(str);
                   _selectedHistory=str;
                   _opened=false;
                   setState(() {
                     
                   });
             
             
                   if (times.indexOf(str)==0) {
                     
                   }else {
                     
                   }
                 },
                 // icon: Icon(
                 //   Icons.keyboard_arrow_down,
                 //   color: Color(0xFF666666),
                 // ),
                  child:
             
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                   _selectedHistory ,
             
                   style: const TextStyle(
                     fontSize: 12,
                     color: Colors.white
                   ),),
             
              Icon(
                     _opened!?         Icons.keyboard_arrow_down:
                     
                     direction==TextDirection.rtl?
                       Icons.keyboard_arrow_left:
                     Icons.keyboard_arrow_right,
                   color: Colors.white, size: 12,
                     )
                    ],
                  ),
                  
                  
                   // TextButton.icon(
                   //           label: Text(
                   //            'Your label' ,
             
                   //            style: TextStyle(
                   //              fontSize: 15,fontWeight: FontWeight.w500,
                   //              color: Color(0xFF666666)
                   //            ),
                   //             ),
                
                   //           icon: Icon(
                   //            Icons.keyboard_arrow_down,
                   // color: Color(0xFF666666),
                   //              ),
                   //           onPressed: null,
                   //           ),
               
               
               
                 itemBuilder: (BuildContext context) => 
                  times.map((e) => PopupMenuItem(
                       value: e,
                       child: Text(e,
                  style:
                   const TextStyle(
             fontSize: 15, color: Colors.white
             
             
                   )))).toList()
                 // [
                 //   PopupMenuItem(
                 //       value: "fgsdfg",
                 //       child: Row(
                 //         children:
                 //         times.map((e) => Text("${e}",
                 //             style: Theme.of(context).textTheme.bodyText2)).toList()
                 //       //    [
                 //       //   Text("English",
                 //       //       style: Theme.of(context).textTheme.bodyText2),
                 //       //   const SizedBox(width: 15),
                 //       //   Icon(
                 //       //     Icons.check_circle,
                 //       //     size: 18,
                 //       //     color: Colors.black.withOpacity(0.60),
                 //       //   )
                 //       // ]
                       
                       
                 //       )),
                 //   // PopupMenuItem(
                 //   //     value: "de",
                 //   //     child: Text("Deutsch",
                 //   //         style: Theme.of(context).textTheme.bodyText2)),
                 // ],
               )
                       
                       ,
                     ),
                   )
                   
             
             
             ],
                       ),
           ),
        const SizedBox(height: 15,),
           SizedBox(
             height: MediaQuery.of(context).size.height/4,
          child: SfCartesianChart(
          
            // Initialize category axis
            primaryXAxis: const CategoryAxis(),

            series: <ColumnSeries<PaymentData, String>>[
              ColumnSeries<PaymentData, String>(
                // Bind data source
                dataSource: 
                _selectedHistory=="All Time"?
                <PaymentData>[
                  PaymentData('2019', 35),
                  PaymentData('2020', 100),
                  PaymentData('2021', 60),
                  PaymentData('2022', 10),
                  PaymentData('2023', 50)
                ]:
                 <PaymentData>[
                  PaymentData('Jan', 35),
                  PaymentData('Feb', 80),
                  PaymentData('Mar', 60),
                  PaymentData('Apr', 32),
                  PaymentData('May', 100)
                ],
                xValueMapper: (PaymentData sales, _) => sales.year,
                yValueMapper: (PaymentData sales, _) => sales.sales,
              color: Colors.greenAccent.withOpacity(.5),
              selectionBehavior: SelectionBehavior(
                selectedColor: Colors.greenAccent.withOpacity(.2),
              ),
              
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(5)
            ),
            
              )
            ]
          )
           )
       ,const SizedBox(height: 20,)
   ,    
     Padding(
       padding: const EdgeInsets.symmetric(
         horizontal: 10
       ),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
        children: [
       
       Text("History", 
       style: TextStyle(
         color: Theme.of(context).colorScheme.onBackground,
         fontWeight: FontWeight.bold , fontSize: 20
       ),
       ), 
       TextButton(onPressed: (){
       
       }, child: Text("see all", style: TextStyle(
         color: Theme.of(context).highlightColor,
         fontSize: 15
       ),))
       
        ],
           ),
     )
       
       , 
       Expanded(child: 
       
        Padding(
padding: const EdgeInsets.symmetric(
         horizontal: 10
       ),
       child: ListView.builder(
         itemCount: subs.length,
         itemBuilder: (BuildContext context, int index) {
           var sub = subs[index];
           return
           SubscriptionContainer(sub: sub , index: index,)
            ;
         },
       ),
        )
       )
       
       
        ],
      ),
    ),
      
    );
  }
 

}

class PaymentData {
  PaymentData(this.year, this.sales);
  final String year;
  final double sales;
}
