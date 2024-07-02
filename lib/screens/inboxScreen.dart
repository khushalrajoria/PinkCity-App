import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class InboxScreen extends StatelessWidget {
  static const routeName = "/inboxScreen";

  const InboxScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_rounded),
                        ),
                        Expanded(
                          child: Text(
                            "Inbox",
                            style: Helper.getTheme(context).headlineSmall,
                          ),
                        ),
                        Image.asset(
                         'assets/images/virtual/cart.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const MailCard(
                    title: "MealMonkey Promotions",
                    description:
                        "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
                    time: "6th July",
                  ),
                  const MailCard(
                    title: "MealMonkey Promotions",
                    description:
                        "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
                    time: "6th July",
                    color: AppColor.placeholderBg,
                  ),
                  const MailCard(
                    title: "MealMonkey Promotions",
                    description:
                        "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
                    time: "6th July",
                  ),
                  const MailCard(
                    title: "MealMonkey Promotions",
                    description:
                        "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
                    time: "6th July",
                    color: AppColor.placeholderBg,
                  ),
                  const MailCard(
                    title: "MealMonkey Promotions",
                    description:
                        "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
                    time: "6th July",
                  ),
                  const MailCard(
                    title: "MealMonkey Promotions",
                    description:
                        "Lorem Ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor ",
                    time: "6th July",
                  ),
                ],
              ),
            ),
            // const Positioned(
            //   bottom: 0,
            //   left: 0,
            //   child: CustomNavBar(
            //     menu: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MailCard extends StatelessWidget {
  const MailCard({
    Key? key,
    required String time,
    required String title,
    required String description,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _description = description,
        _color = color,
        super(key: key);

  final String _time;
  final String _title;
  final String _description;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: const Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: const TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(_description),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _time,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
              Image.asset('assets/images/virtual/star.png',)
            ],
          ),
        ],
      ),
    );
  }
}
