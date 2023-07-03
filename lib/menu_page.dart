import 'package:flutter/material.dart';

import 'widgets/home_beverages.dart';
import 'widgets/menu_list.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 108, 54, 9),
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 108, 54, 9),
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          unselectedLabelStyle: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white),
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Image.asset(
                  'assets/ic_home.png',
                  width: 20,
                  color: Colors.white,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/menu');
                },
                child: Image.asset(
                  'assets/ic_menu.png',
                  width: 20,
                  color: Colors.yellow,
                ),
              ),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/deskripsi');
                },
                child: Image.asset(
                  'assets/ic_love.png',
                  width: 20,
                  color: Colors.white,
                ),
              ),
              label: 'Like',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {},
                child: Image.asset(
                  'assets/ic_profile.png',
                  width: 20,
                  color: Colors.white,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 166, 115, 73),
        child: Image.asset(
          'assets/ic_cart.png',
          color: Colors.white,
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildAppbar(context),
          buildPilihan(context),
          buildMenuMinuman(context),
          buildMenuList(context),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

Widget buildAppbar(BuildContext context) {
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
        const Expanded(
          child: Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildPilihan(BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          width: 160,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 166, 115, 73),
          ),
          child: Row(
            children: [
              const Text(
                'Foods',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 108, 54, 9),
                ),
                child: const Center(
                  child: Text(
                    'Beverages',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildMenuMinuman(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 20,
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              HomeBeverages(
                iconUrl: 'assets/ic_signature.png',
                title: 'Signatured',
              ),
              SizedBox(width: 10),
              HomeBeverages(
                iconUrl: 'assets/ic_iced_cofe.png',
                title: 'Iced Coffee',
              ),
              SizedBox(width: 10),
              HomeBeverages(
                iconUrl: 'assets/ic_product_food.png',
                title: 'Hot Coffee',
              ),
              SizedBox(width: 10),
              HomeBeverages(
                iconUrl: 'assets/ic_cokolat.png',
                title: 'Chocolate',
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildMenuList(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(
      top: 20,
      left: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Menu',
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
          spacing: 15,
          runSpacing: 15,
          children: [
            MenuList(
              imageUrl: 'assets/capucinohot.jpg',
              title: 'Capucino Hot',
              harga: 'Rp.18000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
            MenuList(
              imageUrl: 'assets/americano.jpg',
              title: 'Americano',
              harga: 'Rp.21000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
            MenuList(
              imageUrl: 'assets/capucino.jpg',
              title: 'Capucino',
              harga: 'Rp.23000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
            MenuList(
              imageUrl: 'assets/gula aren.jpg',
              title: 'Gula Aren',
              harga: 'Rp.25000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
            MenuList(
              imageUrl: 'assets/americano.jpg',
              title: 'Americano',
              harga: 'Rp.21000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
            MenuList(
              imageUrl: 'assets/capucino.jpg',
              title: 'Capucino',
              harga: 'Rp.23000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
            MenuList(
              imageUrl: 'assets/capucinohot.jpg',
              title: 'Capucino Hot',
              harga: 'Rp.18000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
            MenuList(
              imageUrl: 'assets/gula aren.jpg',
              title: 'Gula Aren',
              harga: 'Rp.25000',
              jenis: 'coffee',
              onTap: () {
                Navigator.pushNamed(context, '/deskripsi');
              },
            ),
          ],
        ),
      ],
    ),
  );
}
