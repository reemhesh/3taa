import'dart:async';
import 'package:http/http.dart' as http;
import'dart:convert';
import'package:flutter/material.dart';




class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();


}

class _AccountsState extends State<Accounts> {
   getData() async {
    var response =await http.get(Uri.https('jsonplaceholder.typicode.com','users/1'));
    var jsonData =jsonDecode(response.body);
    List<User> users =[];
    for(var u in jsonData ){
      User user =User(u['name'],u['email'],u['username']);
      users.add(user);
      return users;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child:Card(
      child:FutureBuilder(
        future:getData(),
          builder :(context,  AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Text("Loading"),
              );
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Column(
                        children: [
                          Text(snapshot.data![i].name),
                          Text(snapshot.data![i].userName),
                          Text(snapshot.data![i].email),
                        ],
                      ),
                    );
                  });
            }
          },
      ),
      )

    );
  }


}
 class User{
  final String name,email,userName;
  User(this.name,this.email,this.userName);



 }