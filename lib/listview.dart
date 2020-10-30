import 'package:DairyApp_Flutter/ipconfig.dart';
import 'package:DairyApp_Flutter/update.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types
class europeanCountries {
  final String title;
  europeanCountries(this.title);
}

class Listview extends StatefulWidget {
  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  Future<List> getdata() async {
    final response =
        await http.get("$ipaddress:8081/personaldairy/ViewdataListview.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Dairy"),
      ),
      body: FutureBuilder<List>(
          future: getdata(),
          builder: (context, ss) {
            if (ss.hasError) {
              print("error");
              Center(
                child: Text('No data Found!'),
              );
            }
            if (ss.hasData) {
              return Items(list: ss.data);
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    // Text(
                    //   'No data Found!',
                    //   style: TextStyle(fontSize: 16),
                    // )
                  ],
                ),
              );
            }
          }),
    );
  }
}

class Items extends StatefulWidget {
  final List list;
  Items({this.list});

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  Future<List> getdataupdated() async {
    final response =
        await http.get("$ipaddress:8081/personaldairy/ViewdataListview.php");
    return json.decode(response.body);
  }

  // GlobalKey<RefreshIndicatorState> refreshkey;

  // Future<Null> refreshlist() async {
  //   getdataupdated();
  //   await Future.delayed(Duration(seconds: 1));
  // }

  @override
  void initState() {
    super.initState();

    getdataupdated();
    setState(() {});
    //refreshkey = GlobalKey<RefreshIndicatorState>();
  }

  TextEditingController customcontroller = TextEditingController();
  TextEditingController customcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      // child: RefreshIndicator(
      //   key: refreshkey,
      //   onRefresh: () async {
      //     await refreshlist();
      //   },
      child: ListView.builder(
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              ListTile(
                title: Text(widget.list[i]['date']),
                onTap: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new MyHomePage3(value: widget.list[i]['date']),
                  );
                  Navigator.of(context).push(route);
                },
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.delete),
                              Text('Delete'),
                            ],
                          ),
                          content: Text("Do you want to delete!"),
                          actions: <Widget>[
                            MaterialButton(
                                elevation: 5,
                                child: Text('No'),
                                color: Colors.red,
                                onPressed: () {
                                  customsnackbar();
                                  Navigator.of(context)
                                      .pop(customcontroller.text.toString());
                                }),
                            MaterialButton(
                              elevation: 5,
                              onPressed: () {
                                var url =
                                    "$ipaddress:8081/personaldairy/Deletelistview.php";
                                http.post(url,
                                    body: {'date': widget.list[i]['date']});

                                Navigator.pop(context);
                                setState(() {
                                  customsnackbar2();
                                  widget.list.removeAt(i);
                                });

                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (ctx) => Listview()));

                                // customsnackbar2();
                                // Navigator.of(context)
                                //     .pop(customcontroller2.text.toString());
                              },
                              child: Text('Yes'),
                              color: Colors.green,
                            )
                          ],
                        );
                      });
                },
              ),
              Divider()
            ],
          );
        },
      ),
      // ),
    );
  }

  void customsnackbar() {
    SnackBar mysnackbar = SnackBar(
      content: Text('Delete Cancelled'),
      backgroundColor: Colors.blue,
    );
    Scaffold.of(context).showSnackBar(mysnackbar);
  }

  void customsnackbar2() {
    SnackBar mysnackbar = SnackBar(
      content: Text('Item Deleted'),
      backgroundColor: Colors.blue,
    );
    Scaffold.of(context).showSnackBar(mysnackbar);
  }
}
