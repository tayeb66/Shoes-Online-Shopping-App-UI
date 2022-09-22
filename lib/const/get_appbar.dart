import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';

AppBar getAppbar(){
  return AppBar(
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
              onPressed: () {},
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