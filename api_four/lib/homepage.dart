import 'dart:convert';

import 'package:api_four/Models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Product>(
                future: getuser(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(index.toString()),
                        ],
                      );

                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<Product> getuser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Product.fromJson(data);
    } else {
      return Product.fromJson(data);
    }
  }
}
