import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const Color color1 = Color(0xFFF9F7F7); // background
  static const Color color2 = Color(0xFFDBE2EF); // card/bg
  static const Color color3 = Color(0xFF3F72AF); // accent
  static const Color color4 = Color(0xFF112D4E); // dark

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar profile
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
                border: Border.all(color: color3, width: 3),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/cipe.jpg",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  // errorBuilder: (context, error, stackTrace) {
                  //   return Container(
                  //     width: 150,
                  //     height: 150,
                  //     color: color2,
                  //     child: Icon(
                  //       Icons.person,
                  //       size: 80,
                  //       color: color3,
                  //     ),
                  //   );
                  // },
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Nama
            Text(
              "Zahirah Salsabila",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color4,
              ),
            ),
            const SizedBox(height: 10),
            // NIM
            Text(
              "NIM 124230164",
              style: TextStyle(
                fontSize: 18,
                color: color3,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
