import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavigation.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "/aboutScreen";

  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "About Us",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                      ),
                      // Image.asset(
                      //   // Helper.getAssetName("cart.png", "virtual"),
                      //   "assets/images/virtual/cart.png"
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Column(
                    children: [
                      AboutCard(),
                      SizedBox(
                        height: 20,
                      ),
                      AboutCard(),
                      SizedBox(
                        height: 20,
                      ),
                      AboutCard(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomBottomBar(
            ),
          ),
        ],
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  const AboutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: AppColor.orange,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyle(
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
