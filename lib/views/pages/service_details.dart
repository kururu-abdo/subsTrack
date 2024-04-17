import 'package:finance_app/views/widgets/date_picker_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data.dart';

class ServiceDetails extends StatefulWidget {
  final String? title;
  final String? logo;
  const ServiceDetails({ super.key, this.title, this.logo });

  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails>  with TickerProviderStateMixin{

    Animation<Offset>? postionAnimation;
    Animation<Color>? backgroundAnimation;

AnimationController? animationController;
AnimationController? backgroundAnimationContoller;
int selectedIndex=0;
String dateText='Today';
String paymentMethod='Paypal';
List<String>  cycles =['Week' ,'Month','Year'];
int selecteCycle=0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
animationController= AnimationController(vsync: this,
duration:  const Duration(milliseconds: 500)
);

postionAnimation= Tween<Offset>(begin: 
const Offset(0, 1)
, end:const Offset(0, 0))
.animate(animationController!);


animationController!.forward();



  }
route(BuildContext context){
   backgroundAnimationContoller!.stop();
  backgroundAnimation= Tween<Color>(begin: 
Theme.of(context).highlightColor.withOpacity(.2)
, end:Theme.of(context).highlightColor.withOpacity(.5)

)
.animate(backgroundAnimationContoller!);
  backgroundAnimationContoller!.forward();
  Future.delayed(const Duration(milliseconds: 200));
backgroundAnimationContoller!.reverse();}
@override
  void dispose() {

animationController!.dispose() ;
backgroundAnimationContoller!.dispose();
   super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(widget.title!,style: const TextStyle(
          color: Colors.white
        ),
      
        ),
      actions:  [

Padding(padding: const EdgeInsets.symmetric(horizontal: 8), 

child: TextButton(onPressed: ()async{
Future.delayed(const Duration(seconds: 2));

ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(
  'Subscription Added'
)));

Navigator.of(context).pop();



}, child: const Text('save' , style: TextStyle(
  color: Colors.white
),)),
)

      ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(

            horizontal: 20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          const SizedBox(height: 15,),
          
          Hero(
            tag: widget.title!,
            child: Image.asset(widget.logo!, height: 100,))
          ,
          const SizedBox(height: 15,),
          
         SizedBox(height: 80,
           child: ListView.builder(
             shrinkWrap: true,
            scrollDirection: Axis.horizontal,
             itemCount: subTypes.length,
             itemBuilder: (BuildContext context, int index) {
               var type = subTypes[index];
               return  GestureDetector(
                 onTap: (){
                   selectedIndex=index;
                   setState(() {
                     
                   });
                 },
                 child: AnimatedContainer(
                   duration: const Duration(milliseconds: 400),
                   width: 90,height: 80,
                   margin: const EdgeInsets.symmetric(
                     horizontal: 10
                   ),
                            decoration: BoxDecoration(
                              color: selectedIndex==index?
                              Colors.white:Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                 width: .8 ,
                 color: Theme.of(context).colorScheme.onBackground,
                 
                              )
                            ),
                 
                 
                 padding: const EdgeInsets.all(10),
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                 
                 Text(type.title!, 
                 
                 style: TextStyle(
                   color: selectedIndex==index?
                              Colors.black:Theme.of(context).highlightColor,
                              fontSize: 12, 
                 ),
                 
                  )
                 ,
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(type.price!, 
                     
                     style: TextStyle(
                       color: selectedIndex==index?
                   Colors.black:Colors.white,
                   fontSize: 15,
                   fontWeight: FontWeight.bold 
                     ),
                 
                     
                      ),
                      const SizedBox(width: 3,),
                 Text(type.per!, 
                     
                     style: TextStyle(
                       color: selectedIndex==index?
                   Theme.of(context).colorScheme.onPrimary
                   :Theme.of(context).highlightColor,
                   fontSize: 10,
                     ),
                 
                     
                      ),
                 
                 
                 
                   ],
                 )
                 
                     ],
                   ),
                 ),
                 
                 
                 
                 ),
               );
             },
           ),













         ),
          const SizedBox(height: 15,),
          const Align(alignment: AlignmentDirectional.centerStart,
          
          child: 
          Text("Billing" ,  style: TextStyle(
            color: Colors.white ,fontSize: 28, fontWeight: FontWeight.bold
          ),)
          )
          ,
          const SizedBox(height: 15,),

GestureDetector(
  onTap: (){
    showModalBottomSheet(
  showDragHandle: true,  
       isScrollControlled: true,
      //  backgroundColor: Colors.transparent,
      context: context, builder: (_)=>const DatePickerBottomsheet());
  },
  child: Container(
    width: MediaQuery.of(context).size.width,
    height:MediaQuery.of(context).size.height*.10 ,
  
    decoration: BoxDecoration(
      color: Theme.of(context).highlightColor.withOpacity(.20),
      borderRadius: BorderRadius.circular(10)
    ),
  
    padding: const EdgeInsets.symmetric(
      horizontal: 15, vertical: 10
    ),
    child:  Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text('First Payment', style: TextStyle(
      color: Colors.white,fontWeight: FontWeight.bold
      ),), 
      
      Text('Select another date', style: TextStyle(
      color: Theme.of(context).highlightColor,
      fontSize: 15
      // fontWeight: FontWeight.bold
      ),), 
      
      
      
      ],
      ), 
       Text(dateText, style: const TextStyle(
      color: Colors.white,fontWeight: FontWeight.bold
      ),), 
      
        ],
      ),
    ),
  ),
)
,
const SizedBox(height: 8,), 

Container(
  width: MediaQuery.of(context).size.width,
  height:MediaQuery.of(context).size.height*.20 ,

  decoration: BoxDecoration(
    color: Theme.of(context).highlightColor.withOpacity(.20),
    borderRadius: BorderRadius.circular(10)
  ),

  padding: const EdgeInsets.symmetric(
    horizontal: 15, vertical: 10
  ),

child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text('Repeat', style: TextStyle(
    color: Colors.white,fontWeight: FontWeight.bold
    ),), 
    
    Text('Set a cycle for your plan', style: TextStyle(
    color: Theme.of(context).highlightColor,
    fontSize: 15
    // fontWeight: FontWeight.bold
    ),), 
    
    
    
    ],
    ), 
     CupertinoSwitch(value: true, onChanged: (value){

     }, 
     
     ) 
    
      ],
    ),
  


Row(
  children: cycles.asMap().map((index, value) =>  MapEntry(index, 


  GestureDetector(
    onTap: (){
      selecteCycle=index;
      setState(() {
        
      });
    },
    child: AnimatedContainer(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    width: MediaQuery.of(context).size.width*.20,
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(
        vertical: 8, horizontal: 8    ),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    border: Border.all(
      width: selecteCycle==index? 1:.5,
      color: selecteCycle==index?Colors.white:Theme.of(context).highlightColor
    )
    ),
    child: Center(
    child: Text(
    cycles[index],
    
    
    style: TextStyle(
    
        color: selecteCycle==index?Colors.white:Theme.of(context).highlightColor
    
    ),
    ),
    ),
    ),
  )

)


)

.values.toList()
)


  ],
),

)
,
const SizedBox(height: 8,), 

Container(
  width: MediaQuery.of(context).size.width,
  height:MediaQuery.of(context).size.height*.10 ,

  decoration: BoxDecoration(
    color: Theme.of(context).highlightColor.withOpacity(.20),
    borderRadius: BorderRadius.circular(10)
  ),

  padding: const EdgeInsets.symmetric(
    horizontal: 15, vertical: 10
  ),
  child:  Center(
    child: 
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text('Payment Method', style: TextStyle(
    color: Colors.white,fontWeight: FontWeight.bold
    ),), 
    
    Text('Select another method', style: TextStyle(
    color: Theme.of(context).highlightColor,
    fontSize: 15
    // fontWeight: FontWeight.bold
    ),), 
    
    
    
    ],
    ), 
     Text(paymentMethod, style: const TextStyle(
    color: Colors.white,fontWeight: FontWeight.bold
    ),), 
    
      ],
    ),
  
  ),
)
,



            ],
          ),
        ),
      ),
    );
  }
}