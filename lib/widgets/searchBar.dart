import 'package:flutter/material.dart';
// import 'package:monkey_app_demo/const/colors.dart';
// import 'package:monkey_app_demo/utils/helper.dart';

import '../const/colors.dart';

class SearchBbar extends StatelessWidget {
  final String title;
  const SearchBbar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColor.placeholderBg,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Image.asset(
              'assets/images/virtual/search_filled.png',
            ),
            hintText: title,
            hintStyle: const TextStyle(
              color: AppColor.placeholder,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.only(
              top: 10,
            ),
          ),
        ),
      ),
    );
  }
}
