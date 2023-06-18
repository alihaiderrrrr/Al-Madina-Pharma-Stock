import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/service/Fetchh'),
    );

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        print(data);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetch Data from Mongodb ')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]['patientname']),
            subtitle: Text(data[index]['dob']),
          );
        },
      ),
    );
  }
}
