import 'package:flutter/material.dart';
import 'package:flutter_application_1/DetailPage.dart';
import 'package:flutter_application_1/loginPage.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/stores/vehicleStore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Color palette
  static const Color color1 = Color(0xFFF9F7F7); // background
  static const Color color2 = Color(0xFFDBE2EF); // card/bg
  static const Color color3 = Color(0xFF3F72AF); // accent
  static const Color color4 = Color(0xFF112D4E); // dark

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? "Halo, ${widget.username}" : "Profile",
        ),
        backgroundColor: color4,
        foregroundColor: color1,
        actions: _currentIndex == 0
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.logout),
                  color: color1,
                ),
              ]
            : null,
        elevation: 0,
      ),
      body: _currentIndex == 0 ? _buildHomePage() : const ProfilePage(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: color4, // dark blue
        activeColor: color1, // white-ish
        color: color2, // light blue for inactive
        initialActiveIndex: _currentIndex,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }

  Widget _buildHomePage() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: vehicleList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          final item = vehicleList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(vehicle: item),
                ),
              );
            },
            child: Card(
              color: color2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.network(
                      item.imageUrls.isNotEmpty ? item.imageUrls[2] : '',
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 110,
                        color: color2,
                        child: Icon(
                          Icons.directions_car,
                          size: 50,
                          color: color3,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: color4,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.type,
                          style: TextStyle(
                            color: color3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item.price,
                          style: TextStyle(
                            color: color4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
