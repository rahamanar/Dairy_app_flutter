import 'package:flutter/material.dart';
import 'Add_Dairy.dart';
import 'listview.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("PERSONAL DAIRY"),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage2()));
                    },
                    child: Text(
                      "ADD DAIRY",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Listview()));
                    },
                    child: Text(
                      "VIEW DAIRY",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
//                  new RaisedButton(
//                    color: Colors.blue,
//                    textColor: Colors.white,
//                    onPressed: () {},
//                    child: Text(
//                      "SEARCH",
//                      style: TextStyle(fontWeight: FontWeight.bold),
//                    ),
//                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
