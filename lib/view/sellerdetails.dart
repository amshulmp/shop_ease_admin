import 'package:flutter/material.dart';
import 'package:shop_ease_admin/config/configuration.dart';

class Sellerdetails extends StatelessWidget {
  const Sellerdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final details =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final email = details['email'] ?? '';
    final phone = details['phone'] ?? '';
    final address = details['adress'] ?? '';
    final companyName = details['companyname'] ?? '';
    final description = details['description'] ?? '';
    final url = details['url'] ?? '';

    return Scaffold(
      appBar:
      AppBar(title: Text(
          'Seller Information',
          style: TextStyle(
            fontSize: MyConstants.screenHeight(context) * 0.033,
            fontWeight: FontWeight.bold,
          ),
                ),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                
                
                Information(title: 'Email', value: email),
                Information(title: 'Phone', value: phone),
                Information(title: 'Address', value: address),
                Information(title: 'Company', value: companyName),
                Information(title: 'Business Description', value: description),
                Information(title: 'Business URL', value: url),
              ]),
        ));
  }
}

class Information extends StatelessWidget {
  final String title;
  final String value;
  const Information({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: MyConstants.screenHeight(context) * 0.02,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MyConstants.screenHeight(context) * 0.0057),
        Text(
          value,
          style: TextStyle(
            fontSize: MyConstants.screenHeight(context) * 0.018,
          ),
        ),
        SizedBox(height: MyConstants.screenHeight(context) * 0.02),
      ],
    );
  }
}
