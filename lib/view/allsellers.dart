import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease_admin/config/configuration.dart';
import 'package:shop_ease_admin/config/routes.dart';

class Allsellers extends StatefulWidget {
  const Allsellers({super.key});

  @override
  State<Allsellers> createState() => _AllsellersState();
}

class _AllsellersState extends State<Allsellers> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          "S E L L E R S",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
       body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("seller").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data;
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: MyConstants.screenHeight(context) * 0.01),
            child: ListView.builder(
              itemCount: data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final userData = data.docs[index];
                // final userId = userData.id;
                Map<String, dynamic> sellermap =
                    userData.data() as Map<String, dynamic>;
                return Padding(
                  padding:
                      EdgeInsets.all(MyConstants.screenHeight(context) * 0.01),
                  child: ListTile(
                  
                                onTap: () => Navigator.pushNamed(context, Routes.sellersdetails,arguments: sellermap),

                    
                    tileColor: Theme.of(context).colorScheme.secondary,
                    
                    title: Text("${sellermap["companyname"]}"),
                    subtitle: Text(sellermap["email"]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}