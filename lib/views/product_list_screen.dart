import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_task/views/product_details_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_task/api/response_model_class/product_list.dart';

import '../viewmodels/productlist_view_model.dart';

class ProductListScreen extends StatefulWidget {


  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch products when screen initializes
    Provider.of<ProductListViewModel>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    late AnimationController controller;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Consumer<ProductListViewModel>(
        builder: (context, model, child) {
          if (model.products.isEmpty) {
            return Center(
                child:
                SpinKitDoubleBounce(
                color: Colors.blue,
                size: 50.0,
            ),);
          } else {
            return
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                itemCount: model.products.length,
                itemBuilder: (context, index) {
                  ProductList product = model.products[index];
                  return Card(
                    color: Colors.white,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(product.title),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                      leading: Image.network(product.image),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(productId: product.id),
                          ),
                        );
                      },
                    ),
                  );
                },
            ),
              );
          }
        },
      ),
    );
  }
}
