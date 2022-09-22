import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_online_shopping_ui/const/get_appbar.dart';
import 'package:shoes_online_shopping_ui/const/product_data.dart';
import 'package:shoes_online_shopping_ui/theme/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
        child: ElevatedButton(
          style: TextButton.styleFrom(
              backgroundColor: black,
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              shape: const StadiumBorder()),
          onPressed: () {},
          child: Text(
            'checkout'.toUpperCase(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      appBar: getAppbar(context),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text(
            'My Cart',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: List.generate(3, (index) {
            return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                child: FadeInDown(
                  // animation FadeInDown()
                  duration: Duration(milliseconds: 400 * index),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.9,
                        height: 130,
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${products[index]['img']}'),
                              fit: BoxFit.contain,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: black.withOpacity(.2),
                                  spreadRadius: .5,
                                  blurRadius: 2)
                            ]),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index]['name'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${products[index]['price']}',
                                  style: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  'x1',
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          }),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                '\$ 508',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

AppBar getAppbar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: white,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
      color: black,
    ),
    title: const Text(
      'Cart Page',
      style: TextStyle(
          color: black,
          fontSize: 22,
          fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: true,
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // IconButton(
              //     onPressed: () {},
              //     icon: SvgPicture.asset('assets/images/filter_icon.svg')),
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
      )
    ],
  );
}
