import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String harga;
  final String jenis;
  final VoidCallback? onTap;
  const MenuList({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.harga,
    required this.jenis,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 200,
        // padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              width: 125,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  harga,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 108, 54, 9),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
