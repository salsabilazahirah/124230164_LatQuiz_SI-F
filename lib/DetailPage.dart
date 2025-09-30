import 'package:flutter/material.dart';
import 'package:flutter_application_1/stores/vehicleStore.dart';

class DetailPage extends StatelessWidget {
  final Vehicle vehicle;
  const DetailPage({super.key, required this.vehicle});

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
        title: Text(vehicle.name),
        backgroundColor: color4,
        foregroundColor: color1,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Main image
            Container(
              color: color2,
              child: Image.network(
                vehicle.imageUrls.isNotEmpty ? vehicle.imageUrls[0] : '',
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: color2,
                  child: Icon(Icons.directions_car, size: 80, color: color3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                color: color2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vehicle.name,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: color4,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        vehicle.type,
                        style: TextStyle(
                          fontSize: 16,
                          color: color3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 14),
                      Text(
                        vehicle.description,
                        style: TextStyle(fontSize: 15, color: color4),
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: [
                          Icon(Icons.settings, color: color3),
                          SizedBox(width: 8),
                          Text(
                            "Engine: ${vehicle.engine}",
                            style: TextStyle(color: color4),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.local_gas_station, color: color3),
                          SizedBox(width: 8),
                          Text(
                            "Fuel: ${vehicle.fuelType}",
                            style: TextStyle(color: color4),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.attach_money, color: color3),
                          SizedBox(width: 8),
                          Text(
                            "Price: ${vehicle.price}",
                            style: TextStyle(
                              color: color4,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Text(
                        "Gallery:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: color3,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: vehicle.imageUrls.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                              top: 8,
                              bottom: 8,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                vehicle.imageUrls[index],
                                width: 120,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      width: 120,
                                      height: 100,
                                      color: color1,
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 40,
                                        color: color3,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
