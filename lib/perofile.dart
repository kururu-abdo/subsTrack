import 'dart:math' as math;

import 'package:finance_app/data.dart';
import 'package:finance_app/row_title.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin{

  Animation<double>? archAnimation;
  Animation<double>? imageAnimation;
    Animation<double>? opacityAnimation;

  Animation<Offset>? postionAnimation;

AnimationController? animationController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
animationController= AnimationController(vsync: this,
duration: const Duration(milliseconds: 500)
);


opacityAnimation= Tween<double>(begin: .0, end:1.0)
.animate(animationController!);
postionAnimation= Tween<Offset>(begin: 
const Offset(0, 1)
, end:const Offset(0, 0))
.animate(animationController!);

archAnimation= Tween<double>(begin: 0.0, end: 

4*
math.pi/3)
.animate(animationController!);
imageAnimation= Tween<double>(begin:120.0, end: 0)
.animate(animationController!);
animationController!.forward();



  }
@override
  void dispose() {

animationController!.dispose() ;
   super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20
          ),
          child: 
        
        Column(children: [
const SizedBox(height: 30,),
Builder(
  builder: (context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: archAnimation!,
          builder: (context,child) {
            return CustomPaint(
              
              painter: ArchPainter(
                endAngle: archAnimation!.value
              ),
              child:   const SizedBox(
                height: 150,
                width: 150,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: CircleAvatar(
                      
                    backgroundImage: AssetImage("assets/kururu.png")
                  ),
                ),
              ),
            );
          }
        ),
        const SizedBox(height: 10,), 

        SlideTransition(
          position: postionAnimation!,
          child: FadeTransition(
            opacity: opacityAnimation!,
            child: Text("Kururu" , style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground, 
              fontWeight: FontWeight.bold,fontSize: 30
            ),),
          ),
        ),
        SlideTransition(
                    position: postionAnimation!,

          child: FadeTransition(
            opacity: opacityAnimation!,
            child: Text("Developer" , style: TextStyle(
                    color: 
                    Theme.of(context).highlightColor, 
                
             fontSize: 15
            ),),
          ),
        )
      ],
    );
  }
),
const SizedBox(height: 20,),

 SlideTransition(
          position: postionAnimation!,child: const TitleRow()),
const SizedBox(height: 10,),

 SlideTransition(
          position: postionAnimation!,
  child: SizedBox(
    height: MediaQuery.of(context).size.height/3,
    width:MediaQuery.of(context).size.width ,
    child: ListView(
    scrollDirection: Axis.horizontal,
    shrinkWrap: false,
      children: paymentData.map((e) => 
      Center(
        child: Container(
          width: 200,
          height: 300,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            
          ),
          decoration: BoxDecoration(
            color: 
            Theme.of(context).colorScheme.onPrimary.withOpacity(.20)
    ,borderRadius: BorderRadius.circular(25)
          ),
  padding: const EdgeInsets.all(15),
  child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  
  Container(
    height: 40,width: 40,
    decoration: BoxDecoration(
      color:  Colors.white,
      borderRadius: BorderRadius.circular(10.0)
  
  
  
  
    ),
    child:  Icon(
      e.category=="music"?
      Icons.music_note:
      Icons.shopping_bag, color: Colors.black,
    ),
  ), 
  
  
  const SizedBox(height: 8,),
  Text(e.name!, 
  
  style: TextStyle(
    fontSize: 18,
    color: Theme.of(context).colorScheme.onBackground.withOpacity(.90)
    
  ),
  )
      ],
    )
  
  ,
  PopupMenuButton(
    onSelected: (value) {
      // your logic
    },
    itemBuilder: (BuildContext bc) {
      return const [
        PopupMenuItem(
          value: '/pay',
          child: Text("Pay"),
        ),
        PopupMenuItem(
          value: '/delete',
          child: Text("Delete"),
        ),
       
      ];
    },
  )
  ],
  
  
  ),
      const Spacer(),
  
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  Text(e.total!,
  style: TextStyle(
    fontSize: 30,color: Theme.of(context).colorScheme.
    onBackground
  ),
  
  ), 
  
  Text("/${e.per!}",
  style: TextStyle(
    fontSize: 15,
    color: Theme.of(context).highlightColor
    
  ),
  
  )
  
        ],
      )
    ],
  ),
  
        ),
      )
      
      ).toList(),
    ),
  ),
)


        ],),),
      ),

    );
  }
}



class ArchPainter extends CustomPainter {
final double endAngle;

  ArchPainter({super.repaint, required this.endAngle});
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(center: 
    Offset(size.width/2, size.height/2), width: size.width, height: size.height);
  const startAngle = -math.pi / 2;
  var sweepAngle = endAngle;
  const useCenter = false;
    Paint archPaint = Paint()
    ..color=Colors.blue[500]!
    ..style=PaintingStyle.stroke
    ..strokeWidth=3;

     canvas.drawArc(rect, startAngle, sweepAngle, useCenter, archPaint);
  }

  @override
  bool shouldRepaint(ArchPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ArchPainter oldDelegate) => false;
}