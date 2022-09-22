import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_online_shopping_ui/const/get_appbar.dart';
import 'package:shoes_online_shopping_ui/const/product_data.dart';
import 'package:shoes_online_shopping_ui/pages/product_detail.dart';

import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shoes',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Row(
                children: const [
                  Text(
                    'Sort by',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 22,
                  )
                ],
              )
            ],
          ),
        ),
        Column(
          children: List.generate(products.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductDetail(
                      productName: products[index]['name'],
                      productImage: products[index]['img'],
                      productId: products[index]['id'].toString(),
                      productPrice: products[index]['price'],
                      productSize: products[index]['sizes'],
                      multiImage: products[index]['mul_img'],

                    )));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 180,
                              width: 280,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/${products[index]['img']}'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            products[index]['name'],
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '\$${products[index]['price']}',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/images/heart_icon.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
