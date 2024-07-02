import 'package:PinkCity/screens/inboxScreen.dart';
// import 'package:company/screens/myOrderScreen.dart';
import 'package:PinkCity/screens/notificationScreen.dart';
import 'package:PinkCity/screens/paymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavigation.dart';
import 'aboutScreen.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";

  const MoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top:58.0,left: 27),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("More",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: AppColor.darkPink),)),
          ),
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
          const SizedBox(
            height: 80,
          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){Get.to(const PaymentScreen());},
                            child: const MoreCard(name: "Payment details", icon: Icon(Icons.monetization_on,color: Colors.white,size: 30,),)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:12.0),
                          child: InkWell(
                            onTap: (){Get.to(const NotificationScreen());},
                            child: const MoreCard(name: "Notifications", icon: Icon(Icons.ring_volume,color: Colors.white,size: 30,),)),
                        ),
                      ),
                  
                ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){Get.to(const InboxScreen());},
                            child: const MoreCard(name: "Inbox", icon: Icon(Icons.mail_outlined,color: Colors.white,size: 30,),)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:12.0),
                          child: InkWell(
                            onTap: (){Get.to(const AboutScreen());},
                            child: const MoreCard(name: "About us", icon: Icon(Icons.info_sharp,color: Colors.white,size: 30,),)),
                        ),
                      ),
                  
                ]
                  ),
                   const SizedBox(height: 40,),
                          const Center(child: Text("Pink City",style: TextStyle(fontSize: 32,color: AppColor.orange,fontWeight: FontWeight.w900),),),
                          const Center(child: Text("version 1.0.0",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w900),),)
                ]
                ),
              ),
            ),

          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomBottomBar(
            ),
          )
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  const MoreCard({
    Key? key,
    required String name,
    required Icon icon,
    // bool isNoti = false,
    // Function? handler,
  })  : _name = name,
        _icon = icon,
        // _isNoti = isNoti,
        // _handler = handler,
        super(key: key);

  final String _name;
  final Icon _icon;
  // final bool _isNoti;
  // final Function _handler;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(12),
       boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(92, 0, 0, 0),
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
            ),
            ]
      ),
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
                const SizedBox(width: 20,),
                _icon,
                const SizedBox(width: 5,),
                Expanded(child: Text(_name,style: const TextStyle(color:AppColor.darkPink,fontSize: 16,fontWeight: FontWeight.bold),)),
                 const Icon(Icons.arrow_forward_ios,color: Colors.white),
                const SizedBox(width: 10,),

          ],
        )
    );
  }
}
