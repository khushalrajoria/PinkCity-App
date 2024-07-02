import 'package:PinkCity/const/colors.dart';
import 'package:PinkCity/screens/checkoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
   List picked = [false, false];

  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 248 * count;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Stack(children: [
            Stack(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
              Container(
                height: 250.0,
                width: double.infinity,
                color: Colors.pink.shade300,
              ),
              Positioned(
                bottom: 450.0,
                right: 100.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: AppColor.darkPink,
                  ),
                ),
              ),
              Positioned(
                bottom: 500.0,
                left: 150.0,
                child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: const Color(0xFFFEE16D).withOpacity(0.5))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: IconButton(
                    alignment: Alignment.topLeft,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {}),
              ),
              const Positioned(
                  top: 75.0,
                  left: 15.0,
                  child: Text(
                    'Shopping Cart',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  )),
              Positioned(
                top: 150.0,
                child: Column(
                  children: <Widget>[
                    itemCard('Kashmiri Paan', 'gray', '248','assets/images/real/Kashmiri Mix.JPG', true, 0),
                    itemCard('Chocolate Khajoor', 'gray', '248','assets/images/real/Garden Mix.JPG', true, 1),
                    itemCard('Gulab sugar candy', 'gray', '248','assets/images/real/Gulab Sugar Candy.JPG', false, 2)
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 600.0, bottom: 15.0),
                  child: Container(
                      height: 50.0,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('Total: \$$totalAmount'),
                          const SizedBox(width: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(0.5),
                              backgroundColor: MaterialStatePropertyAll(Colors.red),
                              foregroundColor: MaterialStatePropertyAll(Colors.white),
                                
                              ),
                              child:  Center(
                                child: TextButton(
                                  onPressed: (){Get.to(const CheckoutScreen());},
                                  child:const Text('Proceed to Checkout',style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              // textColor: Colors.white,
                            ),
                          )
                        ],
                      )))
            ])
          ]),
          const SizedBox(height: 20,)
        ])
      ]),
    );
  }

  Widget itemCard(itemName, color, price, imgPath, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          pickToggle(i);
        }
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
          child: Material(
              borderRadius: BorderRadius.circular(17.0),
              elevation: 3.0,
              child: Container(
                  padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: available
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.pink.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                  child: available
                                      ? Container(
                                          height: 12.0,
                                          width: 12.0,
                                          decoration: BoxDecoration(
                                              color: picked[i]
                                                  ? Colors.yellow
                                                  : Colors.grey
                                                      .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(6.0)),
                                        )
                                      : Container()))
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        height: 150.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)),
                      ),
                      const SizedBox(width: 25.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                itemName,
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              const SizedBox(width: 7.0),
                              available
                                  ? picked[i]
                                      ? const Text(
                                          'x1',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              color: Colors.grey),
                                        )
                                      : Container()
                                  : Container()
                            ],
                          ),
                          const SizedBox(height: 7.0),
                          available
                              ? Text(
                                  'Color: $color',
                                  style: const TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Colors.grey),
                                )
                              : TextButton(
                                  onPressed: () {},
                                  style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Colors.amber)

                                  ),
                                  child: const Center(
                                    child: Text('Find Similar',
                                        style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 12.0,
                                            color: Colors.red)),
                                  ),
                                ),
                          const SizedBox(height: 7.0),
                          available
                              ? Text(
                                  '\Rs $price',
                                  style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Color.fromARGB(255, 253, 220, 74)),
                                )
                              : Container(),
                        ],
                      )
                    ],
                  )
                )
              )
            ),
    );
  }
}