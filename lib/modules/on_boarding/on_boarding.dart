import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tripit/modules/login/login_screen.dart';

class OnBoarding extends  StatefulWidget {

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class Onboarding{
  String? title;
  String? txt;
  String? image ;
  Onboarding({
    required this.title,
    required this.txt,
    required this.image,
});
}
class _OnBoardingState extends State<OnBoarding> {
  var controlpage = PageController();
  bool islast = false;
  List<Onboarding> onboardinglist =[
    Onboarding(
        title: 'Plan Your Trip',
        txt: 'Plan your trip, choose your destination        Pick the best place for your holiday ',
        image: 'assets/images/2.png'
    ),
    Onboarding(
        title: 'Select The Date',
        txt: 'Select the day, book your ticket. We giveyou the best price. We guarantied!',
        image: 'assets/images/1.png'
    ),
    Onboarding(
        title: 'Enjoy Your Trip',
        txt: 'Enjoy your holiday! don\'t forget to takea photo and share to the world',
        image: 'assets/images/3.png'
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,backgroundColor: Colors.white),
      body: Column(
        children: [
          Image.asset('assets/images/Logo.png'),
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
               setState((){
                 if (index == onboardinglist.length - 1) {
                   islast = true;
                 } else {
                   islast = false;
                 }
               });
              },
              controller: controlpage,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => itembuild(onboardinglist[index]),
              itemCount: onboardinglist.length,
            ),
          ),

           Padding(
             padding: const EdgeInsets.all(11.0),
             child: islast? TextButton(onPressed: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
             }, child: Text('LET\'S GO')) :Row(
               children: [
                 TextButton(onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                 }, child: Text('SKIP',style: TextStyle(color: Colors.grey),)),
                 Spacer(),
                 SmoothPageIndicator(

                     controller: controlpage,
                     count: 3,
                     effect: const ExpandingDotsEffect(
                       activeDotColor: Colors.indigo,
                       dotHeight: 8,
                       dotWidth: 13,
                       expansionFactor: 3,
                       spacing: 4,
                     ),
                     textDirection: TextDirection.ltr),
                 Spacer(),
                 TextButton(onPressed: (){
                   controlpage.nextPage(duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
                 }, child: Text('NEXT'))
               ],
             ),
           ),

        ],

      ),
    );
  }
  Widget itembuild(Onboarding model) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('${model.image}'),
        const SizedBox(
          height: 25,
        ),
        Text(
          '${model.title}',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
        ),
        SizedBox(height: 20,),
        Container(
          width: 250,
          child: Text(
            '${model.txt}',
            style: const TextStyle(fontSize: 12,color: Colors.grey),textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
