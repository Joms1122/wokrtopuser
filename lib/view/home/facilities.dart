import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:worktopuser/view/home/location.dart';
import 'package:worktopuser/view/home/navbar.dart';
import 'package:worktopuser/controller/facilitiescontroller.dart';
import 'package:worktopuser/api/api.dart';
import 'package:worktopuser/model/facilitiesmodel.dart';

class facilities extends StatefulWidget {
  String userName;
  String ids;
  facilities(this.userName, this.ids, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<facilities> {
  int currentindex = 0;
  late Future facilities;
  List<FacilitiesController> myList = [];
  List<FacilitiesModel> facilitiesList = [];
  String sName = '';
  String sAddress = '';
  String sDescription = '';
  String sArea = '';
  String sCity = '';
  String sCoverImagePath = '';

  // final Future<String> loadData = Future<String>.delayed(
  //   const Duration(seconds: 0),
  //   () => 'Data Loaded',
  // );

  @override
  void initState() {
    myList = [];
    facilities = getFacility();
    super.initState();
  }

  Future<List<FacilitiesController>> getFacility() async {
    final response =
        await http.get(Uri.parse(ApiCon.baseurl + '/places/' + widget.ids));
    final jsondata = json.decode(response.body);

    String name = '',
        address = '',
        description = '',
        area = '',
        city = '',
        coverImagePath = '';

    name = jsondata['name'].toString();
    address = jsondata['address'].toString();
    description = jsondata['description'].toString();
    area = jsondata['area'].toString();
    city = jsondata['city'].toString();
    coverImagePath = jsondata['coverImagePath'].toString();
    FacilitiesController nd = FacilitiesController(
        name, address, description, area, city, coverImagePath);

    myList.add(nd);

    // Map<String, dynamic> map = json.decode(jsondata);
    // List<dynamic> data = map[jsondata];
    //   var stringList = jsonEncode(map);

    // Map<String, dynamic> data =  Map<String, dynamic>.from(jsondata);

    // for (var u in jsondata) {
    //   String name = '',
    //       address = '',
    //       description = '',
    //       area = '',
    //       city = '',
    //       coverImagePath = '';

    //   if (u['name'].toString() != null) {
    //     name = u['name'];
    //   } else {
    //     name = '';
    //   }
    //   if (u['address'] != null) {
    //     address = u['address'];
    //   } else {
    //     address = '';
    //   }
    //   if (u['description'] != null) {
    //     description = u['description'];
    //   } else {
    //     description = '';
    //   }
    //   if (u['area'] != null) {
    //     area = u['area'];
    //   } else {
    //     area = '';
    //   }
    //   if (u['city'] != null) {
    //     city = u['city'];
    //   } else {
    //     city = '';
    //   }
    //   if (u['coverImagePath'] != null) {
    //     try {
    //       coverImagePath = u['coverImagePath'];
    //     } catch (e) {
    //       coverImagePath = 'assets/images/icon_a.png';
    //     }
    //   } else {
    //     coverImagePath = 'assets/images/icon_a.png';
    //   }

    //   try {
    //     FacilitiesController nd = FacilitiesController(
    //         name, address, description, area, city, coverImagePath);

    //     myList.add(nd);
    //   } catch (e) {
    //     print("api error");
    //   }
    // }
    return myList;
  }

  Future<List<FacilitiesController>> getUser() async {
    final response =
        await http.get(Uri.parse(ApiCon.baseurl + '/auth/worktop/token'));
    var jsondata = json.decode(response.body);
    for (var u in jsondata) {
      String name = '',
          address = '',
          description = '',
          area = '',
          city = '',
          coverImagePath = '';

      if (u['name'] != null) {
        name = u['name'];
      } else {
        name = '';
      }
      if (u['address'] != null) {
        address = u['address'];
      } else {
        address = '';
      }
      if (u['description'] != null) {
        description = u['description'];
      } else {
        description = '';
      }
      if (u['area'] != null) {
        area = u['area'];
      } else {
        area = '';
      }
      if (u['city'] != null) {
        city = u['city'];
      } else {
        city = '';
      }
      if (u['coverImagePath'] != null) {
        try {
          coverImagePath = u['coverImagePath'];
        } catch (e) {
          coverImagePath = 'assets/images/icon_a.png';
        }
      } else {
        coverImagePath = 'assets/images/icon_a.png';
      }

      try {
        FacilitiesController nd = FacilitiesController(
            name, address, description, area, city, coverImagePath);

        myList.add(nd);
      } catch (e) {
        print("api error");
      }
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return WillPopScope(
      onWillPop: () async {
        /* Do something here if you want */
        return false;
      },
      child: Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 49, 52, 90),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
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
                      margin: const EdgeInsets.only(top: 1),
                      child: Image.asset(
                        "assets/images/icon_a.png",
                        height: 90,
                        width: 90,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: const Text(
                        'DrinkLink - WorkTop',
                        textScaleFactor: 1.2,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text(
                        'Welcome ' + widget.userName + '!',
                        // textScaleFactor: .5,
                        softWrap: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   // padding: const EdgeInsets.only(top: 50),
                    //   child: const Text(
                    //     'Joemar @ Test Pickup',
                    //     // textScaleFactor: 1.2,
                    //     softWrap: true,
                    //     style: TextStyle(fontSize: 12, color: Colors.white),
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "Facilities",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xffF5591F)),
                      ),
                    ),
                  ],
                )),
              ),
              bodywidget(),
              Container(
                // padding: const EdgeInsets.only(top: 10),
                // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: const Text(
                  '@LEEPE Outsourcing Corporation.',
                  // textScaleFactor: 1.2,
                  softWrap: true,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Color(0xffF5591F),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bodywidget() {
    final GlobalKey<State> _LocationDialog = new GlobalKey<State>();

    return Container(
      height: 400,
      child: FutureBuilder(
        future: facilities,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  if (snapshot.data != null) {
                    return GestureDetector(
                      onTap: () {
                        // setState(() {
                        sName = snapshot.data[index].name;
                        sAddress = snapshot.data[index].address;
                        sArea = snapshot.data[index].area;
                        sCoverImagePath = snapshot.data[index].coverImagePath;

                        //   // List<String> list = [
                        //   //   sName,
                        //   //   sAddress,
                        //   //   sArea,
                        //   //   sCoverImagePath
                        //   // ];
                        facilitiesList.clear();
                        FacilitiesModel nd = FacilitiesModel(
                            sName, sAddress, sArea, sCoverImagePath);

                        facilitiesList.add(nd);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Location(facilitiesList, widget.ids.toString()),
                            ));
                        //   // sName = snapshot.data[index].name;
                        //   // sAddress = snapshot.data[index].address;
                        //   // sDescription = snapshot.data[index].description;
                        //   // sArea = snapshot.data[index].area;
                        //   // sCity = snapshot.data[index].city;
                        //   // sCoverImagePath =
                        //   //     snapshot.data[index].coverImagePath;
                        // });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              padding:
                                  const EdgeInsets.fromLTRB(0, 100, 0, 100),
                              child: Container(
                                height: 340,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 30, 20, 0),
                                decoration: BoxDecoration(
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 15.0,
                                        offset: Offset(0.0, 0.75))
                                  ],
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: const Color(0xffffffff),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // dropdwon(),
                                    Container(
                                      height: 70,
                                      width: 70,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(ApiCon.baseurl +
                                                snapshot.data[index]
                                                    .coverImagePath),
                                            fit: BoxFit.cover,
                                          ),
                                          //border: Border.all(width: 1.0, color: const Color(0xff707070)),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data[index].name,
                                      style: const TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 18,
                                        color: Color(0xff0a0a0a),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      snapshot.data[index].address,
                                      style: const TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 16,
                                        color: Color(0xff050505),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      snapshot.data[index].area,
                                      style: const TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 14,
                                        color: Color(0xff050505),
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),

                                    // Text(
                                    //   snapshot.data[index].city,
                                    //   style: const TextStyle(
                                    //     fontFamily: 'Helvetica Neue',
                                    //     fontSize: 14,
                                    //     color: Color(0xff050505),
                                    //     fontWeight: FontWeight.w300,
                                    //   ),
                                    //   textAlign: TextAlign.left,
                                    // )
                                  ],
                                ),
                              ),
                            ),

                            // Container(
                            //   child: Container(
                            //     height: 300,
                            //     width:
                            //         MediaQuery.of(context).size.width / 1.4,
                            //     decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(15.0),
                            //       image: DecorationImage(
                            //         image: NetworkImage(
                            //             snapshot.data[index].coverImagePath),
                            //         fit: BoxFit.cover,
                            //       ),
                            //       //border: Border.all(width: 1.0, color: const Color(0xff707070)),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      child: const Center(
                        child: Text('loading...'),
                      ),
                    );
                  }
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
