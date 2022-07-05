import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:worktopuser/view/home/home.dart';
import 'package:worktopuser/view/home/navbar.dart';
import 'package:worktopuser/controller/facilitiescontroller.dart';
import 'package:worktopuser/api/api.dart';
import 'package:worktopuser/model/facilitiesmodel.dart';
import 'package:worktopuser/model/locationmodel.dart';
import 'package:worktopuser/api/secure_storage.dart';
import 'package:worktopuser/model/ordermodel.dart';

class Home2 extends StatefulWidget {
  List<FacilitiesModel> sfacilities = [];
  List<Locationmodel> slocation = [];
  String FacilityId;
  Home2(this.sfacilities, this.slocation, this.FacilityId, {Key? key})
      : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int currentindex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            child: const Icon(
              Icons.table_bar,
              size: 50.0,
              color: Color(0xffF5591F),
            ),
          ),
          const Text(
            'Table Ready',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 18,
              color: Color(0xff0a0a0a),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView(
              shrinkWrap: true,
              // scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: 100,
                  // color: Colors.purple[600],
                  child: const Center(
                      child: Text(
                    // _token.text,
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
                Container(
                  height: 100,
                  // color: Colors.purple[500],
                  child: const Center(
                      child: Text(
                    'Item 2',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
                Container(
                  height: 100,
                  // color: Colors.purple[400],
                  child: const Center(
                      child: Text(
                    'Item 3',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
                Container(
                  height: 100,
                  // color: Colors.purple[300],
                  child: const Center(
                      child: Text(
                    'Item 4',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
      // 'ADVERTISEMENTS',
      // style: optionStyle,
    ),
    Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 100,
            width: 100,
            child: const Icon(
              Icons.pending,
              size: 50.0,
              color: Color(0xffF5591F),
            ),
          ),
          const Text(
            'Pending',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 18,
              color: Color(0xff0a0a0a),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          FutureBuilder(
              future: getOrders(),
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
        ],
      ),
    ),
    Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            child: const Icon(
              Icons.run_circle,
              size: 50.0,
              color: Color(0xffF5591F),
            ),
          ),
          const Text(
            'Bar Ready',
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontSize: 18,
              color: Color(0xff0a0a0a),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: 100,
                  // color: Colors.purple[600],
                  child: const Center(
                      child: Text(
                    // _token.text,
                    'Item 1',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
                Container(
                  height: 100,
                  // color: Colors.purple[500],
                  child: const Center(
                      child: Text(
                    'Item 2',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
                Container(
                  height: 100,
                  // color: Colors.purple[400],
                  child: const Center(
                      child: Text(
                    'Item 3',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
                Container(
                  height: 100,
                  // color: Colors.purple[300],
                  child: const Center(
                      child: Text(
                    'Item 4',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          toolbarHeight: 150,
          flexibleSpace: Container(
            color: Color.fromARGB(255, 49, 52, 90),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ApiCon.baseurl +
                          widget.sfacilities[0].coverImagePath),
                      fit: BoxFit.cover,
                    ),
                    //border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        widget.sfacilities[0].name,
                        textScaleFactor: 1.2,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        widget.sfacilities[0].address,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Expanded(
                flex: 3,
                child: FutureBuilder(
                    future: getOrders(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Map<String, dynamic>> data =
                            snapshot.data as List<Map<String, dynamic>>;
                        return Container(
                          color: Colors.white,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    (data[index] as Map<String, dynamic>)
                                        .keys
                                        .single
                                        .toString()),
                                subtitle: Text(
                                    (data[index] as Map<String, dynamic>)
                                        .values
                                        .single
                                        .toString()),
                                leading: CircleAvatar(
                                    child: Text(
                                        (data[index] as Map<String, dynamic>)
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.table_bar),
              label: 'Table Ready',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pending),
              label: 'Pending',
              backgroundColor: Color.fromARGB(255, 49, 52, 90),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.run_circle),
              label: 'Bar Ready',
              backgroundColor: Color.fromARGB(255, 49, 52, 90),
            ),
          ],
          currentIndex: currentindex,
          onTap: (int index) {
            setState(() {
              currentindex = index;
            });
          },
          backgroundColor: const Color.fromARGB(255, 49, 52, 90),
        ),
      );

  Widget buildName() => buildTitle(
      title: 'Name',
      child: Container(
        // drawer: const NavDrawer(),
        // appBar: AppBar(
        //   backgroundColor: const Color.fromARGB(255, 49, 52, 90),
        //   elevation: 0.0,
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90)),
                  color: Color.fromARGB(255, 49, 52, 90),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(ApiCon.baseurl +
                                widget.sfacilities[0].coverImagePath),
                            fit: BoxFit.cover,
                          ),
                          //border: Border.all(width: 1.0, color: const Color(0xff707070)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              widget.sfacilities[0].name,
                              textScaleFactor: 1.2,
                              softWrap: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              widget.sfacilities[0].address,
                              softWrap: true,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ));

  Widget buildButton() =>
      buildTitle(title: '', child: _widgetOptions.elementAt(currentindex));

  Widget buildTitle({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}

Future<List<Map<String, dynamic>>> getOrders() async {
  var token = await UserSecureStorage.gettoken();
  final response = await http.get(
    Uri.parse(ApiCon.baseurl + '/places/' + '1' + '/Orders/  '),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + token.toString()
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> responseJson = json.decode(response.body);
    // print(responseJson.runtimeType);
    List<Map<String, dynamic>> list = [];
    var cd = responseJson.forEach((key, value) {
      Map<String, dynamic> value2 = Map.of({key: value});
      list.add(value2);
    });
    print(list);
    return list;
  } else {
    throw Exception('Unexpected Error Occured!');
  }
}
