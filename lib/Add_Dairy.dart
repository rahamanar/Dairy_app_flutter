import 'package:DairyApp_Flutter/ipconfig.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'listview.dart';
import 'package:http/http.dart' as http;

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
      home: MyHomePage2(),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  var dateCtl = TextEditingController();
  TextEditingController titleCtl = TextEditingController();
  TextEditingController messageCtl = TextEditingController();
  // bool dateValidate = false;
  // bool titleValidate = false;
  // bool msgValidate = false;

  void adddata() {
    var url = "$ipaddress:8081/personaldairy/AddDairy.php";
    http.post(url, body: {
      "Date": dateCtl.text,
      "Title": titleCtl.text,
      "Message": messageCtl.text
    });
  }

  // bool validateTextField(String text) {
  //   if (text.isEmpty) {
  //     setState(() {
  //       dateValidate = true;
  //     });
  //     return false;
  //   }
  //   setState(() {
  //     dateValidate = false;
  //   });
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Dairy"),
      ),
      body: new SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: dateCtl,
                decoration: InputDecoration(
                    labelText: "Please Select Date!",
                    //errorText: dateValidate ? 'Value is empty' : null,
                    // hintText: "Ex. Insert your dob",
                    icon: const Icon(
                      Icons.date_range,
                      color: Colors.blue,
                    )),
                onTap: () async {
                  dateCtl.clear();
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

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
              TextFormField(
                controller: titleCtl,
                decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.mode_edit,
                      color: Colors.blue,
                    ),
                    hintText: 'Title'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: TextFormField(
                  controller: messageCtl,
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
                      borderSide: BorderSide(color: Colors.black87, width: 1.0),
                    ),
                    // icon: const Icon(Icons.mode_edit,color: Colors.blue,),
                    hintText: 'Type Your Data Here.......',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: new RaisedButton(
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      // setState(() {
                      //   validateTextField(dateCtl.text);
                      // });
                      if (dateCtl.text.isEmpty ||
                          titleCtl.text.isEmpty ||
                          messageCtl.text.isEmpty) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Please Enter all Feilds"),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Close"))
                                ],
                              );
                            });
                      } else {
                        adddata();
                        setState(() {});
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Listview()));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
