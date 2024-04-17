
import 'package:finance_app/data/models/subscription.dart';
import 'package:flutter/material.dart';

class SubscriptionContainer extends StatefulWidget {
  const SubscriptionContainer({
    super.key,
    required this.sub,
    required this.index,

  });
final int index;
  final Subscription sub;

  @override
  State<SubscriptionContainer> createState() => _SubscriptionContainerState();
}

class _SubscriptionContainerState extends State<SubscriptionContainer> with TickerProviderStateMixin{

    Animation<Offset>? postionAnimation;

AnimationController? animationController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
animationController= AnimationController(vsync: this,
duration:  Duration(milliseconds: widget.index*200)
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
  Widget build(BuildContext context) {
    return SlideTransition(
    position: postionAnimation!,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            color: 
            widget.index==0? 
            Theme.of(context).highlightColor.withOpacity(.20)
      :Colors.transparent
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      
            Row(
              mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
      Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).highlightColor
      ),
      child: Center(child: Image.asset(widget.sub.logo!, 
      height: 30,width: 30,
      ),),
      ),
      const SizedBox(width: 15,),
      
                Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(widget.sub.serviceTitle!
                   , 
                   style: const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                   ),
                   ),
                   Text(widget.sub.subsType!, 
                   style: const TextStyle(
                     color: Colors.white,
                     fontSize: 10,fontWeight: FontWeight.w300
                   ),
                   )
                 ],
               ),
            
             ],
            ), 
      
      
      
                Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(widget.sub.amount!
                   , 
                   style: const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                   ),
                   ),
                   Text(widget.sub.lastPaymentDate!, 
                   style: const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.w300,
                     fontSize: 10
                   ),
                   )
                 ],
               ),
            
          ],
        ),
      ),
    );
  }
}