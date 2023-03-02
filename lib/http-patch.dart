import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPatch extends StatefulWidget {
  const HttpPatch({super.key});

  @override
  State<HttpPatch> createState() => _HttpPatchState();
}

class _HttpPatchState extends State<HttpPatch> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP PUT / PATCH"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await http.patch(
                Uri.parse("https://reqres.in/api/users/3"),
                body: {"name": nameC.text, "job": jobC.text},
              );

              Map<String, dynamic> data =
                  json.decode(myresponse.body) as Map<String, dynamic>;

              setState(() {
                hasilResponse = "${data['name']} - ${data['job']}";
              });
            },
            child: const Text("SUBMIT"),
          ),
          const SizedBox(height: 50),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Text(hasilResponse),
        ],
      ),
    );
  }
}
