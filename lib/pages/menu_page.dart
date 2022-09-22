import 'package:flutter/material.dart';
import 'package:shoes_online_shopping_ui/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: black,
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    final List menuItems = ['Home', 'New In', 'Sale', 'Profile', 'log out'];
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(menuItems.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 30, right: 30),
              child: Text(
                menuItems[index],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            );
          }),
        )
      ],
    );
  }
}
