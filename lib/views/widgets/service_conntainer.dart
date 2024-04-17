import 'package:finance_app/data/models/service.dart';
import 'package:finance_app/views/pages/service_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceContainer extends StatefulWidget {
  final int index;
   Service service;
   ServiceContainer({ super.key, required this.index, 
  required this.service });

  @override
  _ServiceContainerState createState() => _ServiceContainerState();
}

class _ServiceContainerState extends State<ServiceContainer> with TickerProviderStateMixin{

    Animation<Offset>? postionAnimation;
    Animation<Color>? backgroundAnimation;

AnimationController? animationController;
AnimationController? backgroundAnimationContoller;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
animationController= AnimationController(vsync: this,
duration:  Duration(milliseconds: widget.index*200)
);
animationController= AnimationController(vsync: this,
duration:  Duration(milliseconds: widget.index*200)
);
backgroundAnimationContoller= AnimationController(vsync: this,
duration:  Duration(milliseconds: widget.index*200)
);
postionAnimation= Tween<Offset>(begin: 
const Offset(0, 1)
, end:const Offset(0, 0))
.animate(animationController!);
Future.delayed(Duration.zero,(){
  
  backgroundAnimation= Tween<Color>(begin: 
Theme.of(context).highlightColor.withOpacity(.2)
, end:Theme.of(context).highlightColor.withOpacity(.2)

)
.animate(backgroundAnimationContoller!);
});

animationController!.forward();
backgroundAnimationContoller!.forward();


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
    return 
        
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=>
              
              ServiceDetails(
title: widget.service.title,
logo: widget.service.logo,
              )
              )
            
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            
            width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/4,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
Theme.of(context).highlightColor.withOpacity(.2)                    
                    //  Theme.of(context).highlightColor.withOpacity(.2)
                  ),
          child: Column(
            children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Text(widget.service.title!, 
          style: const TextStyle(
            fontSize: 15 , fontWeight: FontWeight.bold
          ),
          
          )
          , 
          
          
          Text(widget.service.category!, 
          style:  TextStyle(
            fontSize: 15 , color: Theme.of(context).highlightColor
          ),
          
          )
          
          ],),
           Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).highlightColor
            ),
            child: Center(child: Hero(
              tag: widget.service.title!,
              child: Image.asset(widget.service.logo!, 
              height: 30,width: 30,
              ),
            ),),
            ),
            ],
          )
          ,
          const Spacer(), 
          
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
          Text(
            widget.service.price!,
            style: const TextStyle(
          color: Colors.white, fontSize: 30
            ),
          ),
          
          
          Text(
            widget.service.per!,
            style:  TextStyle(
          color: Theme.of(context).highlightColor, fontSize: 15
            ),
          ),
          
          
            ],
          )
          ,
          ValueListenableBuilder(
            valueListenable: widget.service.isActice!,
            builder: (BuildContext context, dynamic value, Widget? child) {
          return  CupertinoSwitch(value: value, onChanged: (value){
          // do something
          widget.service.isActice!.value=value;
          });
            },
          ),
            ])
            ],
          ),
          ),
        );
     
  }
}