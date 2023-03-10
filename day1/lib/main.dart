import 'dart:convert';

import 'package:flutter/material.dart';
import "package:simple_icons/simple_icons.dart";
import "user.dart";
import "package:http/http.dart" as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Github User'),
    );
  }
}

Future<User> fetchUser() async {
  final response = await http.get(Uri.https("api.github.com", "users/ikuol"));
  if (response.statusCode == 200) {
    print(response.body);
    return User.fromJSON(json.decode(response.body));
  } else {
    throw Exception("Failed to fetch user!");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<User> currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Icon(SimpleIcons.github),
              SizedBox(width: 10),
              Text(widget.title),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: FutureBuilder<User>(
                future: currentUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data!.avatarUrl),
                              radius: 80,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.name,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    snapshot.data!.username,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.description,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.people, size: 16),
                                      SizedBox(width: 5),
                                      Text(
                                        "${snapshot.data!.followers}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(" followers · "),
                                      Text("${snapshot.data!.following}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(" following"),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ));
  }
}
