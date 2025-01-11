import 'dart:convert';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:rest_api_tutorial/Model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API call"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            //final color = user.gender =='male' ? Colors.blue : Colors.green;
            return ListTile(
              title: Text(user.name.first),
              subtitle: Text(user.phone),
              //tileColor: color,
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
  }

  void fetchUsers() async {
    print("FetchUsers called");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
        title: e['name']['title'], 
        first: e['name']['first'], 
        last: e['name']['last'],
      );
      return User(
        name: name,
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
      );
    }).toList();
    setState(() {
      users = transformed;
    });
    print("fetchUsers completed");
  }
}
