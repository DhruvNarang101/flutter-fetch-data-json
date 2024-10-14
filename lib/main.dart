
import 'package:flutter/material.dart';
import 'dart:convert';

void main(){
  runApp( MaterialApp(
    home:HomePage(),
  ));
}

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Fetch Data from JSON",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          child: FutureBuilder( // When app needs to retrieve data(load) from a network,
            // database, or any asynchronous source, FutureBuilder can manage the
            // UI updates seamlessly.
            // the future(property) represents an asynchronous task that will complete
            // at some point in the future.
            // DefaultAssetBundle is a widget that provides access to the app's assets,
            // such as images, fonts, and data files like JSON,
            future: DefaultAssetBundle
                .of(context)
                .loadString('load_json/person.json'),
            builder:(context,snapshot){
              var mydata = json.decode(snapshot.data.toString());

              return Container(
                margin: EdgeInsets.all(9.0),
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Name : "+ mydata[index]['name'],
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            ),
                            Text("Age : "+ mydata[index]['age'],
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Text("Height : "+ mydata[index]['height'],
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Text("Hair Color : "+ mydata[index]['hair_color'],
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Text("Gender: "+ mydata[index]['gender'],
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: mydata == null ? 0 : mydata.length,
                ),
              );
            }
          ),
        ),
    );
  }
}