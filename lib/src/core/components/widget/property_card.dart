// import 'dart:ffi';

// import 'package:flutter/material.dart';

// class PropertyCard extends StatelessWidget {
//   final String imageUrl;
//   final double price;
//   final String location;
//   final String type;
//   final String availability;
//   final bool sold;

//   PropertyCard(
//       {required this.imageUrl,
//       required this.price,
//       required this.location,
//       required this.type,
//       required this.availability,
//       this.sold = false});

//   @override
//   Widget build(BuildContext context) {
//     if (sold) {
//       return const SizedBox.shrink();
//     }
//     return Card(
//       elevation: 4,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           GestureDetector(
//             onTap: () {
//               // Navigate to property details page
//             },
//             child: Stack(
//               children: [
//                 Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                   height: 200,
//                   width: double.infinity,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '\$${price.toString()}',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   location,
//                   style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.home, size: 16, color: Colors.grey[600]),
//                     SizedBox(width: 4),
//                     Text(
//                       type,
//                       style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                     ),
//                     SizedBox(width: 8),
//                     Icon(Icons.info, size: 16, color: Colors.grey[600]),
//                     SizedBox(width: 4),
//                     Text(
//                       availability,
//                       style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class PropertyCard extends StatelessWidget {
//   final String ownerId;
//   final String title;
//   final double price;
//   final String location;
//   final String type;
//   final String availability;
//   final String description;
//   final List<String> images;
//   final String phoneNumber;

//   PropertyCard({
//     required this.ownerId,
//     required this.title,
//     required this.price,
//     required this.location,
//     required this.type,
//     required this.availability,
//     required this.description,
//     required this.images,
//     required this.phoneNumber,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // Navigate to property detail page
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => PropertyDetailPage(property: this)),
//         );
//       },
//       child: Card(
//         margin: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 // Swipable images
//                 SizedBox(
//                   height: 150,
//                   child: PageView.builder(
//                     itemCount: images.length,
//                     itemBuilder: (context, index) {
//                       return Image.network(images[index], fit: BoxFit.cover);
//                     },
//                   ),
//                 ),

//                 // Type and title
//                 Positioned(
//                   top: 10,
//                   left: 10,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.white.withOpacity(0.5),
//                     ),
//                     child: Text(type,
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                   ),
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: Text('\$${price.toStringAsFixed(2)}',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ),
//               ],
//             ),

//             // Location and title
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title,
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 5),
//                   Text(location),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String ownerId;
  final String title;
  final double price;
  final String location;
  final String type;
  final String availability;
  final String description;
  final List<String> images;
  final String phoneNumber;

  PropertyCard({
    required this.ownerId,
    required this.title,
    required this.price,
    required this.location,
    required this.type,
    required this.availability,
    required this.description,
    required this.images,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to property detail page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PropertyDetailPage(property: this)),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Swipable images
            SizedBox(
              height: 150,
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.network(images[index], fit: BoxFit.cover);
                },
              ),
            ),

            SizedBox(height: 10),

            // Type and price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child:
                        // Text(
                        //   type,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(right: 10),
                //   child: Text(
                //     '\$${price.toStringAsFixed(0)}',
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),

            SizedBox(height: 10),

            // Location and title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   title,
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Text(
                    type,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Stack(children: [
                    Text(location),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          '\$${price.toStringAsFixed(0)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class PropertyDetailPage extends StatelessWidget {
  final PropertyCard property;

  PropertyDetailPage({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: property.images.length,
                itemBuilder: (context, index) {
                  return Image.network(property.images[index],
                      fit: BoxFit.cover);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('\$${property.price.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(property.type,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(property.location),
                  SizedBox(height: 10),
                  Text(property.availability),
                  SizedBox(height: 10),
                  Text(property.description),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10),
                      Text(property.phoneNumber),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
