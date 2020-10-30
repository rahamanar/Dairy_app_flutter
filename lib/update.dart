import 'dart:ui';

import 'package:DairyApp_Flutter/ipconfig.dart';
import 'package:DairyApp_Flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage3(),
    );
  }
}

class MyHomePage3 extends StatefulWidget {
  final String value;

  MyHomePage3({Key key, this.value}) : super(key: key);

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage3> {
  var dateCtl = new TextEditingController();
  var dateCtl2 = new TextEditingController();
  var msgctl = new TextEditingController();

  //DateTime _currentDate = new DateTime.now();

  void updatedata() {
    var url = "$ipaddress:8081/personaldairy/Updatedata.php";
    http.post(url, body: {
      'Date': dateCtl.text,
      'Title': dateCtl2.text,
      'Message': msgctl.text
    });
    print(url);
    //customsnackbar();
  }

  Future getdata() async {
    // final response = await http
    //     .get("http://192.168.0.103:8081/personaldairy/ViewdataListview.php");

    // var url = "http://192.168.0.108:8081/personaldairy/GetdataforUpdate.php";
    // http.post(url, body: {'date': widget.value});

    var response = await http.post(
        "$ipaddress:8081/personaldairy/GetdataforUpdate.php",
        body: {'date': "${widget.value}"});

    var jsondata = json.decode(response.body);

    //print(jsondata['title']);
    // List<User> users = [];
    // for (var u in jsondata) {
    //   User user = User(u["date"], u["title"], u["message"]);
    //   users.add(user);
    // }
    // print(users.length);
    return jsondata;
  }

  @override
  Widget build(BuildContext context) {
    // print(new DateFormat("dd-MM-yyyy").format(_currentDate));
    // String _formatdate = new DateFormat("dd-MM-yyyy").format(_currentDate);
    //dateCtl.text = "${widget.value}";

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Dairy"),
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  // child: Text("Loading...$snapshot.data"),
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              dateCtl.text = snapshot.data['date'];
              dateCtl2.text = snapshot.data['title'];
              msgctl.text = snapshot.data['message'];

              return SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.black45),
                          enabled: false,
                          controller: dateCtl,
                          decoration: InputDecoration(
                              // labelText: "Please Select Date!",
                              // hintText: "Ex. Insert your dob",
                              icon: const Icon(
                            Icons.date_range,
                            color: Colors.blue,
                          )),
                          onTap: () async {
                            dateCtl.clear();
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            String _formatdate =
                                new DateFormat("dd-MM-yyyy").format(date);
                            dateCtl.text = _formatdate;
                            if (date = null) {
                              setState(() {
                                String _formatdate =
                                    new DateFormat("dd-MM-yyyy").format(date);
                                dateCtl.text = _formatdate;
                              });
                            }
                          },
                        ),
                        TextField(
                          controller: dateCtl2,
                          decoration: InputDecoration(
                            //hintText: snapshot.data['title'],
                            icon: const Icon(
                              Icons.mode_edit,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 0),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            controller: msgctl,
                            textAlignVertical: TextAlignVertical.top,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                vertical: 100.0,
                                horizontal: 10,
                              ), //to Add height to textformfield
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87,
                                    width: 0.6,
                                    style: BorderStyle.solid),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87, width: 1.0),
                              ),
                              // icon: const Icon(Icons.mode_edit,color: Colors.blue,),
                              //labelText: snapshot.data['message'],
                              //hintText: 'Type Your Data Here.......',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: new RaisedButton(
                              child: Text(
                                "Update",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                              onPressed: () {
                                updatedata();

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                  (Route<dynamic> route) => false,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}

class User {
  final String date;
  final String title;
  final String message;

  User(this.date, this.title, this.message);
}
