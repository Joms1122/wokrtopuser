// To parse this JSON data, do
//
//     final bricklink = bricklinkFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Scanner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int myvalue = 0;

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {}

  Future<int> functions() async {
    // do something here
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Map<String, dynamic>> data =
                  snapshot.data as List<Map<String, dynamic>>;
              return Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text((data[index] as Map<String, dynamic>)
                          .keys
                          .single
                          .toString()),
                      subtitle: Text((data[index] as Map<String, dynamic>)
                          .values
                          .single
                          .toString()),
                      leading: CircleAvatar(
                          child: Text((data[index] as Map<String, dynamic>)
                              .keys
                              .single[0]
                              .toString())),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}

class Page1 extends StatelessWidget {
  var _controller = TextEditingController();

  Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 55,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {},
                child: Text(
                  "Choose the Date",
                  style: TextStyle(fontSize: 25),
                )),
          ),
        ),
        Center(
          child: Text(
            "No date Choosen",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Center(
          child: Wrap(
            // direction: Axis.vertical,
            children: [
              RadioListTile(
                  title: Text("home"),
                  value: "Home",
                  groupValue: "Home",
                  onChanged: (v) {}),
              RadioListTile(
                  title: Text("Company"),
                  value: "Company",
                  groupValue: "Home",
                  onChanged: (v) {}),
              RadioListTile(
                  title: Text("Other"),
                  value: "Other",
                  groupValue: "Home",
                  onChanged: (v) {}),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter the number of bottels",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Container(
          // height: 75,
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 55,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () {},
                      child: Text(
                        "Start",
                        style: TextStyle(fontSize: 25),
                      )),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Future<List<Map<String, dynamic>>> fetchData() async {
  final response =
      await get(Uri.parse("https://api.wazirx.com/api/v2/tickers"));

  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    // print(responseJson.runtimeType);
    List<Map<String, dynamic>> list = [];
    var cd = responseJson.forEach((key, value) {
      Map<String, dynamic> value2 = Map.of({key: value});
      list.add(value2);
    });

    return list;
  } else {
    throw Exception('Unexpected Error Occured!');
  }
}
