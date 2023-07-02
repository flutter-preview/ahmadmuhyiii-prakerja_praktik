import 'package:flutter/material.dart';
import 'package:prakerja_app_muhyi/widgets/home_beverages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildProfile(context),
          buildIklan(context),
          buildMinuman(context),
        ],
      ),
    );
  }
}

Widget buildProfile(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Good Morning,',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Ahmad Muhyi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Center(
                child: Icon(
                  Icons.mail_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildIklan(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 180,
    margin: const EdgeInsets.only(
      top: 20,
    ),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          'assets/double.jpg',
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 40),
            backgroundColor: const Color.fromARGB(255, 108, 54, 9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'find out more',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildMinuman(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Beverages',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          spacing: 5,
          runSpacing: 10,
          children: const [
            HomeBeverages(
              iconUrl: 'assets/ic_product_food.png',
              title: 'Signatured',
            ),
            HomeBeverages(
              iconUrl: 'assets/ic_product_food.png',
              title: 'Iced Coffee',
            ),
            HomeBeverages(
              iconUrl: 'assets/ic_product_food.png',
              title: 'Hot Coffee',
            ),
            HomeBeverages(
              iconUrl: 'assets/ic_product_food.png',
              title: 'Chocolate',
            ),
          ],
        ),
      ],
    ),
  );
}
