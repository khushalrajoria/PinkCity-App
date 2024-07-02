// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavigation.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = "/myOrderScreen";

  const MyOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "My Order",
                        style: Helper.getTheme(context).headlineSmall,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              'assets/images/real/Kashmiri Mix.JPG',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Gulab Sugar Candy",
                              style: Helper.getTheme(context).displaySmall,
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
                                Text(" (124 ratings)"),
                              ],
                            ),
                            const Row(
                              children: [
                                Text("Pink City"),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    ".",
                                    style: TextStyle(
                                      color: AppColor.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text("Pink City offical"),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  child: Image.asset(
                                    'assets/images/virtual/loc.png',
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("No 03, VDN jaipur, Rajasthan")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Column(
                      children: [
                        BurgerCard(
                          price: "16",
                          name: "Kashmiri",
                        ),
                        BurgerCard(
                          price: "14",
                          name: "Paan mix",
                        ),
                        BurgerCard(
                          price: "17",
                          name: "Gulkand sugar candy",
                        ),
                        BurgerCard(
                          price: "15",
                          name: "Chicken Legs Basket",
                        ),
                        BurgerCard(
                          price: "6",
                          name: "Dhaniya Daal",
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.placeholder.withOpacity(0.25),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Delivery Instruction",
                                style: Helper.getTheme(context).displaySmall,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
            context: context,
             shape: RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical( 
            top: Radius.circular(25.0),
          ),),
            builder: (BuildContext context) {
              return Container(  
                height: 600,
                // width: double.maxFinite,
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30,),
                        Align(alignment: Alignment.centerLeft,child: Text('Add your notes here',style: TextStyle(color: AppColor.darkPink,fontWeight: FontWeight.bold),)),
                        SizedBox(height: 20),
                        TextField(
                          maxLines: 6,
                                decoration: InputDecoration(
                                // constraints: BoxConstraints(minHeight: 250),
                                border: OutlineInputBorder( gapPadding: 2),
                                hintText: 'Please write short and crisp',
                              ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){}, child: Text("Add to notes")),
                      ],
                    ),
                  ),
                ),
              );
            }              
                                  );              
                                },
                                child:const  Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: AppColor.orange,
                                    ),
                                    Text(
                                      "Add Notes",
                                      style: TextStyle(
                                        color: AppColor.orange,
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Sub Total",
                              style: Helper.getTheme(context).displaySmall,
                            ),
                          ),
                          Text(
                            "Rs 68",
                            style: Helper.getTheme(context).displaySmall?.copyWith(
                                  color: AppColor.orange,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Delivery Cost",
                              style: Helper.getTheme(context).displaySmall,
                            ),
                          ),
                          Text(
                            "Rs 2",
                            style: Helper.getTheme(context).displaySmall?.copyWith(
                                  color: AppColor.orange,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: Helper.getTheme(context).displaySmall,
                            ),
                          ),
                          Text(
                            "Rs 69",
                            style: Helper.getTheme(context).displaySmall?.copyWith(
                                  color: AppColor.orange,
                                  fontSize: 22,
                                ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.of(context)
                            //     .pushNamed(CheckoutScreen.routeName);
                            Get.to(CheckoutScreen());
                          },
                          child: Text("Checkout"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: CustomBottomBar(),
          // ),
        ],
      ),
    );
  }
}

class CheckoutScreen {
}

class BurgerCard extends StatelessWidget {
  const BurgerCard({
     Key? key,
    required String name,
    required String price,
    bool isLast = false,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
        super(key: key);

  final String _name;
  final String _price;
  final bool _isLast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast
              ? BorderSide.none
              : BorderSide(
                  color: AppColor.placeholder.withOpacity(0.25),
                ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$_name x1",
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "Rs $_price",
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
