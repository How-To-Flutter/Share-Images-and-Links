// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_declarations
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Share in Flutter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          height: 400,
                          width: 400,
                          child: Image.network(
                            'https://images.unsplash.com/photo-1523395555535-a43123287dbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Beautiful Subway',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                width: 350,
                height: 500,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 12, color: Colors.grey.shade900)
                    ],
                    color: Color.fromARGB(255, 62, 62, 62),
                    borderRadius: BorderRadius.circular(25)),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                    width: 190,
                    height: 50,
                    child: ElevatedButton(
                      child: Text(
                        'Send',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                      ),
                      onPressed: () async {
                        final urlPreview =
                            'https://images.unsplash.com/photo-1523395555535-a43123287dbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
                        final url = Uri.parse(urlPreview);
                        final response = await http.get(url);
                        final bytes = response.bodyBytes;

                        final temp = await getTemporaryDirectory();
                        final path = '${temp.path}/image.jpg';
                        File(path).writeAsBytesSync(bytes);
                        await Share.shareFiles([path],
                            text: 'Hey, Look, so beautiful');
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
