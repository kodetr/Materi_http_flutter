import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDelete extends StatefulWidget {
  const HttpDelete({super.key});

  @override
  State<HttpDelete> createState() => _HttpDeleteState();
}

class _HttpDeleteState extends State<HttpDelete> {
String data = "belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP DELETE"),
        actions: [
          IconButton(
            onPressed: () async {
              var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
              Map<String, dynamic> mybody = json.decode(response.body);
              print(mybody);
              setState(() {
                data = "Akun : ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
              });
            },
            icon: const Icon(Icons.get_app),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(data),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () async {
              var response = await http.delete(Uri.parse("https://reqres.in/api/users/2"));
              if (response.statusCode == 204) {
                setState(() {
                  data = "Berhasil menghapus data";
                });
              }
            },
            child: const Text("DELETE"),
          ),
        ],
      ),
    );
  }
}