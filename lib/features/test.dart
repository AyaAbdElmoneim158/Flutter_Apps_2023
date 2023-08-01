import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  _getString() async {
    debugPrint("Hit Test");

    var res = await http.get(Uri.parse('http://172.23.240.1:8808/hello'));
    debugPrint(res.body);
    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getString(),
          builder: (context, snapshot) {
            debugPrint(snapshot.hasData.toString());
            if (snapshot.hasData) {
              return Text(snapshot.data.toString(),
                  style: Theme.of(context).textTheme.headlineSmall);
            }
            return Center(
                child: Text("no data",
                    style: Theme.of(context).textTheme.headlineSmall));
          }),
    );
  }
}
