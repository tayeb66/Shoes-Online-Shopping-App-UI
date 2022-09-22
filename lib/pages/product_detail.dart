import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_online_shopping_ui/const/product_data.dart';
import 'package:shoes_online_shopping_ui/theme/colors.dart';
import 'package:shoes_online_shopping_ui/widget/product_slider.dart';

class ProductDetail extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final String? productId;
  final String? productPrice;
  final List<String>? multiImage;
  final List? productSize;

  const ProductDetail(
      {Key? key,
      this.productName,
      this.productImage,
      this.productId,
      this.productPrice,
      this.multiImage,
      this.productSize})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var activeSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: black.withOpacity(.2),
                    blurRadius: 2,
                    spreadRadius: 1)
              ]),
          child: Stack(
            children: [
              ProductSlider(
                items: widget.multiImage,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          'assets/images/nike_logo.png',
          fit: BoxFit.cover,
          width: 80,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            widget.productName ?? '',
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 35, height: 1.5),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text(
            '\$${widget.productPrice ?? ''}',
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 25, height: 1.5),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Sizes',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              ),
              Text(
                'Size guide',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.productSize!.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      activeSize = index;
                      print('click');
                    });
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: activeSize == index ? black : grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(.2),
                                spreadRadius: 1,
                                blurRadius: 2)
                          ]),
                      child: Center(
                        child: Text(
                          widget.productSize![index],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: activeSize == index ? white : black),
                        ),
                      )),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: black.withOpacity(.2),
                          spreadRadius: 1,
                          blurRadius: 2)
                    ]),
                child: Center(
                  child: SvgPicture.asset('assets/images/heart_icon.svg'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: black,
                    shape: const StadiumBorder(),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 120, 45)),
                onPressed: () {},
                child: Text('Add to Card'.toUpperCase()),
              ),
              /// Other Way
              // Flexible(
              //   child: GestureDetector(
              //     onTap: (){},
              //     child: Container(
              //       height: 45,
              //       decoration: BoxDecoration(
              //         color: black,
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       child: Center(
              //         child: Text(
              //           'Add to card'.toUpperCase(),
              //           style: const TextStyle(
              //               color: white,
              //               fontWeight: FontWeight.w700,
              //               fontSize: 16),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        )
      ],
    );
  }
}
