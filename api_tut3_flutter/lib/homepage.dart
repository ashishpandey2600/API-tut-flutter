import 'dart:convert';

import 'package:api_tut3_flutter/Models/postmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostModel> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API nested")),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: getUserApi(),
            builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                         ReusableRow(title: 'Name', value: snapshot.data![index].name.toString() ),
                              ReusableRow(title: 'userName', value: snapshot.data![index].username.toString()),
                              ReusableRow(title: 'email', value: snapshot.data![index].email.toString()),
                              ReusableRow(
                              title: 'city', value: snapshot.data![index].address!.city.toString() 
                              + snapshot.data![index].address!.geo!.lat.toString() ),


                          
                        ]),
                      ),
                    );
                  });
            },
          ),
        ),
      ]),
    );
  }

  Future<List<PostModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(PostModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
