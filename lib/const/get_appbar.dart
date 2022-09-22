import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_online_shopping_ui/pages/cart_page.dart';
import 'package:shoes_online_shopping_ui/pages/product_detail.dart';

import '../theme/colors.dart';

AppBar getAppbar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: white,
    elevation: 0.0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/burger_icon.svg')),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/filter_icon.svg')),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Container(
                decoration:
                const BoxDecoration(shape: BoxShape.circle, color: black),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}