// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:PinkCity/screens/dessertScreen.dart';
import 'package:PinkCity/screens/individualItem.dart';
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../const/colors.dart';
class HomeScreen extends StatefulWidget {
  late final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();
  List<String> list1 = ['Rajni Paan', 'Chikmi Dollar Supari', 'Chocolate Mix', 'Chocolate Pan', 'Dilkhus'];
  List<String> list2 = ['assets/images/real/Dhaniya Dal.JPG', 'assets/images/real/Chikni Assam Dollar Supari.JPG', 'assets/images/real/Chocolate Mix.JPG', 'assets/images/real/Chocolate Pan Mix.JPG', 'assets/images/real/Dilkhus Mix.JPG'];

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom:60.0),
        child: HawkFabMenu(
          icon: AnimatedIcons.add_event,
          fabColor: AppColor.darkPink,
          iconColor: Colors.white,

          hawkFabMenuController: hawkFabMenuController,
          items: [
            HawkFabMenuItem(
              label: 'Custom Order',
              ontap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("We'll be taking orders soon")),
                );
              },
              icon: const Icon(Icons.question_answer_sharp),
              color: Color.fromARGB(255, 0, 0, 0),
              labelBackgroundColor: Colors.white,
              buttonBorder: BorderSide(width: 2,color: Colors.black),
              labelColor: Colors.black,
            ),
            HawkFabMenuItem(

              label: 'Chat With Us',
              labelColor: Colors.white,
              labelBackgroundColor: Colors.green,
              color: Colors.green,
              buttonBorder: BorderSide(color: Colors.white,width: 2),
              ontap: () {
                  _launchURL();},
              icon: const Icon(Icons.wechat_outlined,color: Colors.white,),
            ),
          ],


          body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 45,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:14.0,vertical: 2),
                child: Text("Hello, Pink City ",textAlign: TextAlign.left,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800,color: Colors.black),),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:14.0,vertical: 2),
                child: Text("Current Location",textAlign: TextAlign.left,style: TextStyle(fontSize: 20,)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:12.0,vertical: 8),
              child: SearchBar(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade300),hintText: "Search Product",elevation: MaterialStatePropertyAll(2),leading: Icon(Icons.search),constraints: BoxConstraints(maxHeight: 70),)
            ),
                  Align(
                    alignment: Alignment.centerLeft,
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:14.0,vertical: 2),
                      child: Text("Most Popular",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                  ),
            SizedBox(height: 270,width: double.infinity,
            child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:8),
              child: Container(
                
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(92, 99, 98, 98),
                offset: Offset(2.0, 2.0),
                blurRadius: 1.0,
              ),
            ],
                    borderRadius: BorderRadius.circular(23),
                color: Colors.grey.shade200,
                  ),
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: MorePopular(name: list1[index], image: list2[index])
                ),
              ),
            );
          },
        ),),
            Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:14.0,vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("More Products",style: TextStyle(color: Colors.black,fontSize: 18),),
                          TextButton(onPressed: (){Get.to(DessertScreen());}, child: Text("View all",style: TextStyle(color: Color.fromARGB(255, 255, 60, 229),fontSize: 14),),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 10),
                    child:  InkWell(onTap: () {
                      Get.to(IndividualItem());
                    },child: MostPopularCard(name: "Dry Pan Gold",image: 'assets/images/real/Dry Pan Gold.JPG')),
                  ),
                 
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 10),
                    child:  MostPopularCard(name: "Dhaniya Dal",image: 'assets/images/real/Dhaniya Dal.JPG'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 10),
                    child:  MostPopularCard(name: "Garden Mix",image: 'assets/images/real/Garden Mix.JPG'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 10),
                    child:  MostPopularCard(name: "Gulab Sugar candy",image: 'assets/images/real/Gulab Sugar Candy.JPG'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 10),
                    child:  MostPopularCard(name: "Gulkan Mukhwas",image: 'assets/images/real/Gulkand Mukhwas.JPG'),
                  ),
                 
                ],
              ),
                  Align(
                    alignment: Alignment.centerLeft,
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:14.0,vertical: 2),
                      child: Text("Previous Buys",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 5),
                    child:  RecentItemCard(name: "Jhilmil Mix",image:Image.asset ('assets/images/real/Jhilmil Mix.JPG',fit: BoxFit.cover,)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 5),
                    child:  RecentItemCard(name: "kashmiri Mix",image:Image.asset ('assets/images/real/Kashmiri Mix.JPG',fit: BoxFit.cover,)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 5),
                    child:  RecentItemCard(name: "kesar Laccha",image:Image.asset ('assets/images/real/Kesar Laccha Supari.JPG',fit: BoxFit.cover,)),
                  ),
                 
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 5),
                    child:  RecentItemCard(name: "Khus Candy",image:Image.asset( 'assets/images/real/Khus Sugar Candy.JPG',fit: BoxFit.cover,)),
                  ),
             SizedBox(height: 5,)
      
            ],  
          ),
        ),
        ),
      ),
    );
     
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      
      // //Init Floating Action Bubble 
      // floatingActionButton: FloatingActionBubble(
      //   // Menu items
      //   items: <Bubble>[

      //     Bubble(
      //       title:"Custom Query?",
      //       iconColor :Colors.white,
      //       bubbleColor : AppColor.orange,
      //       icon:Icons.question_answer_sharp,
      //       titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
      //       onPress: () {
      //         _animationController.reverse();
      //       },
      //     ),
      //     Bubble(
      //       title:"Chat with us",
      //       iconColor :Colors.white,
      //       bubbleColor : Color.fromARGB(255, 28, 177, 28),
      //       icon:Icons.chat_rounded,
      //       titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
      //       onPress: () {
      //           _launchURL;
      //         _animationController.reverse();
      //       },
      //     ),
      //     //Floating action menu item
      //   ],

      //   // animation controller
      //   animation: _animation,

      //   // On pressed change animation state
      //   onPress: () => _animationController.isCompleted
      //         ? _animationController.reverse()
      //         : _animationController.forward(),
        
      //   // Floating Action button Icon color
      //   iconColor: AppColor.darkPink,

      //   // Flaoting Action button Icon 
      //   iconData: Icons.build_sharp, 
      //   backGroundColor: Colors.white,
      //   )

  }
}
class MorePopular extends StatelessWidget {
  const MorePopular({
    Key? key,
    required String name,
    required String image,
  }) : _name=name,
  _image=image,
  super(key: key);
  final String _name;
  final String _image;

  @override
  Widget build(BuildContext context) {
    return 
             Padding(
               padding: const EdgeInsets.only(top:12.0,left: 5,),
               child: Center(
                 child: Column(
                  children: [
                         ShaderMask(
                       shaderCallback: (Rect bounds) {
                         return RadialGradient(
                         center: Alignment.center,
                         radius: 1.1,
                         colors: const [Colors.transparent, Color.fromARGB(255, 0, 0, 0)],
                         stops: const [.5, 1.0],
                         ).createShader(bounds);
                       },
                       
                       blendMode: BlendMode.dstOut,
                       child: Image.asset(
                         '$_image', 
                         width: 100,
                         height: 120,
                         fit: BoxFit.cover,
                            
                       ),
                     // ),
                       ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:4.0),
                          child: Text(  
                               _name,
                               style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 14,fontWeight: FontWeight.bold,shadows: const [
                             ],)
                             ),
                        ),
                      ),
                        Text("This is one of most popular paan ever made"),
                       
                       Padding(padding:EdgeInsets.only(top: 6),
                       child: TextButton(onPressed: (){}, child: Container(
                         height: 40,
                         width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                         color: AppColor.darkPink,
                          ),
                         child: Center(
                           child: Text("Shop Now",style: TextStyle(color: Colors.white),),
                         ),
                       )),
                       ),
                            
                            
                  ],
                   ),
               ),
             );
  }
}

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({
    Key? key,
    required String name,
    required String image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final String _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity,
              height: 150,
            child: Stack(
              children: [
          ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
          center: Alignment.center,
          radius: 1.6,
          colors: const [Color.fromARGB(76, 0, 0, 0), Color.fromARGB(255, 0, 0, 0)],
          stops: const [0.5, 1.0],
          ).createShader(bounds);
        },
        
        blendMode: BlendMode.darken,
        child: Image.asset(
          '$_image', 
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,

        ),
      // ),
        ),
        Positioned(
          bottom: 25,
          left: 10,
          child: Text(  
            _name,
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 14,fontWeight: FontWeight.bold,shadows: const [
            Shadow(
              color: Colors.black,
              offset: Offset(5.0, 5.0),
              blurRadius: 7.0,
            ),
          ],)
          ),
        ),
        Positioned(
          left: 10,
          bottom: 5,
          child: Row(
            children: [
              Text("Pink City",style: TextStyle(color: Colors.white,fontSize: 11,shadows: const [
            Shadow(
              color: Color.fromARGB(255, 253, 253, 253),
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
            ),
          ], ),),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  ".",
                  style: TextStyle(
                    color: AppColor.orange,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text("Pan mixes",style: TextStyle(color: Colors.white,fontSize: 11,shadows: const [
            Shadow(
              color: Color.fromARGB(255, 255, 255, 255),
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
            ),
          ], ),),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/virtual/star_filled.png',
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "4.9",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )
            ],
          ),
        )


              ],
            )
            ,
    );
  }
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    Key? key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image,
        super(key: key);

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(17),
      color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 160,
                height: 100,
                child: _image,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text(
                      _name,
                      style: TextStyle(fontSize: 22,color: Colors.black)
                    ),
                    Row(
                      children: const [
                        Text("Pink city originals"),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            ".",
                            style: TextStyle(
                              color: AppColor.orange,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Pan"),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/virtual/star_filled.png',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.9",
                          style: TextStyle(
                            color: AppColor.orange,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('(124) Ratings')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
  
  
  
void _launchURL() async {
    const String url = 'https://wa.me/+917568877701/?text=Hello';

    // Convert the String URL into a Uri object using Uri.parse()
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }