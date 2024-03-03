import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


class HomePage extends StatefulWidget {
  State<HomePage> createState()=>_HomePageState();
}


class _HomePageState extends State<HomePage>{

   int page=0;
   int currentPage=0;
   late LiquidController liquidController;
   late UpdateType updateType;

   @override
   void initState() {
     super.initState();
     liquidController = LiquidController();
   }

   Widget _buildDot(int index) {
     double selectedness = Curves.easeOut.transform(
       max(
         0.0,
           1.0 - (currentPage - index).abs(),
       ),
     );
     double zoom = 1.0 + (2.0 - 1.0) * selectedness;
     return Container(
       width: 25.0,
       child: Center(
         child:  Material(
           color: Colors.black,
           type: MaterialType.circle,
           child: Container(
             width: 8.0 * zoom,
             height: 8.0 * zoom,
           ),
         ),
       ),
     );
   }




  final pages=
      [
        // The 1st container
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage('assets/images/onboarding1.png'),fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 200,
              ),
              Text(
                "The Life is Going",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: Text(
                  "Stay informed with the fastest and most effective way, wherever you are",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),

        ),
        // The 2nd container
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage('assets/images/onboarding2.png'),fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 200,
              ),
              Text(
                "Beauty of Bangladesh",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: Text(
                  "Bangladesh has a land of enormous beauty, hundreds of serpentine rivers, crystal clear water lakes surrounded by ever green hills, luxuriant tropical rain forests, beautiful cascades of green tea gardens, world's largest mangrove forest preserved as World Heritage, home of the Royal Bengal Tiger ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),

        ),
        // The 3rd container
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage('assets/images/onboarding3.png'),fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 200,
              ),
              Text(
                  "Job Markets",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                   fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10),
                child: Text(
                  "The job market is directly related to the unemployment rate, a measure of the percentage of people who aren't employed but actively seeking work.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),

        ),
      ];


   pageChangeCallback(page){
     setState(() {
       currentPage = page;
     });
   }




  // The main code is start here.....
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
       children: [
         LiquidSwipe(
           pages: pages,// from pages list
           liquidController: liquidController ,
           enableLoop: true,
           waveType: WaveType.liquidReveal,
           ignoreUserGestureWhileAnimating: true,
           onPageChangeCallback: pageChangeCallback,
         ),

         Padding(
           padding: const EdgeInsets.all(30.0),
           child: Column(
             children: [
               Expanded(
                   child: SizedBox()
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:List<Widget>.generate(pages.length,_buildDot),
               )
             ],
           ),
         ),

      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: TextButton(
            onPressed: () {
              liquidController.jumpToPage(
                  page: liquidController.currentPage+1,
              );
            },
            child: Text("Next"),
            style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.01),
                foregroundColor: Colors.black),
          ),
        ),
      ),


         Align(
           alignment: Alignment.bottomLeft,
           child: Padding(
             padding: const EdgeInsets.all(25.0),
             child: TextButton(
               onPressed: () {
                 liquidController.animateToPage(
                     page: pages.length -1,
                     duration: 500
                 );
               },
               child: Text("Skip to End"),
               style: TextButton.styleFrom(
                   backgroundColor: Colors.white.withOpacity(0.01),
                   foregroundColor: Colors.black),
             ),
           ),
         )
       ],
      ),
    );
  }

}

