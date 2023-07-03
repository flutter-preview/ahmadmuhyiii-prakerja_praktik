import 'package:flutter/material.dart';

import 'widgets/milk.dart';

class DeskripsiPage extends StatelessWidget {
  const DeskripsiPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildAppBar(context),
          buildDeskMenu(context),
          buildMilk(context),
          buildBtnCart(context),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

Widget buildAppBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 30,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Widget buildDeskMenu(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 0,
    ),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          width: 180,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage(
                  'assets/capucinohot.jpg',
                ),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              height: 10,
            ),
            Text(
              'Capucino Hot',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 108, 54, 9),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Our Capucino is a drink consisting of a mixture of coffee and milk. The milk used for our milk coffee is fresh milk, While the coffee used is the original coffee of choice.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 108, 54, 9),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildMilk(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 70,
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choice of Milk',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Milk(
                    title: 'Soy Milk',
                  ),
                  SizedBox(width: 10),
                  Milk(
                    title: 'Almond Milk',
                  ),
                  SizedBox(width: 10),
                  Milk(
                    title: 'Oat Milk',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildBtnCart(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 50,
      left: 30,
      right: 30,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Rp 20000',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 55),
            backgroundColor: const Color.fromARGB(255, 108, 54, 9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Keranjang +',
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
