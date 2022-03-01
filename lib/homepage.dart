// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _foundUsers = [];

  void runfilter(String enteredText) {
    List<Map<String, dynamic>> results = [];
    if (enteredText.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers.where((user) {
        return user['name'].toLowerCase().contains(enteredText.toLowerCase());
      }).toList();
      //first we convert the entered text to lowercase and then we check if the name of the user contains the entered text
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  void initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => runfilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: _foundUsers.isNotEmpty
                    ? ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(_foundUsers[index]["id"]),
                          color: Colors.teal,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Text(
                              _foundUsers[index]["id"].toString(),
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                            title: Text(_foundUsers[index]['name'],
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white)),
                            subtitle: Text(
                              '${_foundUsers[index]["age"].toString()} years old',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
