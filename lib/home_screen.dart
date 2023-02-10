import 'dart:convert';
import 'package:api_calling/model/Todas_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<TodasModel> getApi() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/todos'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return TodasModel.fromJson(data);
  } else {
    return TodasModel.fromJson(data);
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<TodasModel>(
                future: getApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data?.todos?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    snapshot.data!.todos![index].id.toString()),
                                Text(snapshot.data!.todos![index].todo
                                    .toString()),
                                Text(snapshot.data!.todos![index].completed
                                    .toString()),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(snapshot.data!.todos![index].userId
                                      .toString()),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
