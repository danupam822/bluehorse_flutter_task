import 'package:flutter/material.dart';
import 'package:flutter_task/model/user_details.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/productlist_view_model.dart';
import '../product_list_screen.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserDetails userDetails;

  UserDetailsWidget({required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: EdgeInsets.zero, // Remove default margin
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Optional: add rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjust padding here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userDetails.name,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Email:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userDetails.email,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Address:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userDetails.address,
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => ProductListViewModel(),
                      child: ProductListScreen(),
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                margin: EdgeInsets.zero, // Adjust margin here
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Optional: add rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Products',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.blue),
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
