import 'package:flutter/material.dart';
import 'package:flutter_task/model/user_details.dart';
import 'package:flutter_task/viewmodels/user_details_view_model.dart';

import 'package:flutter_task/views/weidgets/user_details_weidget.dart';

import 'package:provider/provider.dart';

class UserDetailsPage extends StatefulWidget {
  final String userEmail;

  UserDetailsPage({required this.userEmail});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {

  Future<bool> _onWillPop() async {
    // Show a dialog or handle the back action as per your requirement
    bool shouldExit = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );
    return shouldExit ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
          backgroundColor: Colors.blue, // Set app bar background color

        ),
        body: ChangeNotifierProvider(
          create: (_) => UserDetailsViewModel(),
          child: Consumer<UserDetailsViewModel>(
            builder: (context, viewModel, child) {
              // Fetch user details when this widget is built
              viewModel.fetchUserDetails(widget.userEmail);

              if (viewModel.user == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return UserDetailsWidget(userDetails: viewModel.user!);
              }
            },
          ),
        ),
    ),
      );
  }
}
