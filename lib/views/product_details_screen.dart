import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_task/viewmodels/product_details_view_model.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailsViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Consumer<ProductDetailsViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.productDetails == null) {
              viewModel.fetchProductDetails(productId); // Fetch details on first load
              return Center(
                child: SpinKitDoubleBounce(
                  color: Colors.blue,
                  size: 50.0,
                ),
              );
            } else {
              final product = viewModel.productDetails!;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          width: 220,
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover, // or use BoxFit.contain based on your needs
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        product.title,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Price: ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '\$${product.price.toStringAsFixed(2)}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Category: ${product.category}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rating:',
                                style: TextStyle(fontSize: 18),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  RatingBar.builder(
                                    initialRating: product.rating['rate'].toDouble(),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${product.rating['rate']} (${product.rating['count']} ratings)',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),

                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Description: ${product.description}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
