import 'dart:math' as math;

import 'package:finance_app/dashboard.dart';
import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({ super.key });

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin{

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
    return  Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
Image.asset("assets/welcome.png"),

 Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
   SlideTransition(
  position: postionAnimation!,
      child: FadeTransition(
        opacity: opacityAnimation!,
        child: const Text("SubsTrack", style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white
        ),),
      ),
    ), 
    SlideTransition(
  position: postionAnimation!,
      child: FadeTransition(
        opacity: opacityAnimation!,
        child: Text("Pay less , Spend smart", style: TextStyle(
          fontSize: 15, color: Theme.of(context).highlightColor
        ),),
      ),
    ), 
  ],
),
const SizedBox(height: 15,),
SlideTransition(
  position: postionAnimation!,
  child: GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_)=> const DashboardPage())
      );
    },
    child: Hero(
   tag: 'main_btn',
      child: Container(
        height: 50, width: 150,
        decoration:  BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(50)
        ),
        child: const Center(
          child: Text("Let's start!" , style: TextStyle(
            color: Colors.black
          ),),
        ),
      ),
    ),
  ),
),

const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}