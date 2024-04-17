import 'package:finance_app/home.dart';
import 'package:finance_app/perofile.dart';
import 'package:finance_app/views/pages/add_subsription.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ super.key });

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin{
 
   Animation<Offset>? postionAnimation;
 


AnimationController? animationController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  Widget build(BuildContext context) {

    List<Widget> pages= [
      const HomePage() ,
   
      const Profile()
    ];
    return  Scaffold(
      body: SizedBox.expand(
        child: PageView.builder(itemBuilder: (context, index){

          return pages[_currentIndex];
        })

      )

        ,
      bottomNavigationBar:
    SlideTransition(
          position: postionAnimation!,child: _bottomNav(context))
      
      
    );
  }
  Widget _bottomNav(BuildContext context){
    return Container(
      height: 70,
      padding:  const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        // color:     Theme.of(context).colorScheme.onPrimary.withOpacity(.20)
      ),
child: Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment:CrossAxisAlignment.center ,
    children: [



IconButton(onPressed: (){
_currentIndex=0;
setState(() {
  
});
}, icon: Icon(Icons.home
,size: 28,
color: _currentIndex==0?
 Theme.of(context).colorScheme.onBackground: 
         Theme.of(context).highlightColor,
),  ), 

 Hero(
   tag: 'main_btn',
   child: GestureDetector(
     onTap: (){
       Navigator.of(context).push(
         
         MaterialPageRoute(builder: (_)=>
         
         const AddSubScription()
         )
       );
     },
     child: Container(
      height: 50,width: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
     
     
     
     
      ),
      child:  const Icon(
        Icons.add, color: Colors.black,
      ),
     ),
   ),
 ), 




IconButton(onPressed: (){
_currentIndex=1;
setState(() {
  
});
}, icon: Icon(Icons.person_outline,
size: 28
,
color: _currentIndex==1?
 Theme.of(context).colorScheme.onBackground: 
         Theme.of(context).highlightColor,
),  ),


    ],
  ),
),
    );
  }
 int _currentIndex=0;
  _onItemTapped(int index){

  }

}