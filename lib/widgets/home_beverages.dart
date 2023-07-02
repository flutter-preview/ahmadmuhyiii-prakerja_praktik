import 'package:flutter/material.dart';

class HomeBeverages extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  const HomeBeverages({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 8.0,
        ),
        width: 120,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 108, 54, 9),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.only(
                    bottom: 0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      iconUrl,
                      width: 15,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
