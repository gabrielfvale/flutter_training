import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './models/profile_page_model.dart';
import './models/profile_model.dart';

Future<ProfileImageModel> fetchUsers() async {
  print('Fetching API');
  final response = 
    await http.get('https://reqres.in/api/users');

  if(response.statusCode == 200) {
    return ProfileImageModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load profiles');
  }
}

class App extends StatefulWidget {
  @override
  createState() => AppState();
}

class AppState extends State<App> {

  Future<ProfileImageModel> profileImageModel;

  @override
  void initState() {
    super.initState();
    profileImageModel = fetchUsers();
  }

  Widget profilesBuilder(BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.hasData) {
      var data = snapshot.data;
      var profileData = data.data;
      List<Widget> children = [];
      for(int i = 0; i < data.per_page; i++) {
        ProfileModel profile = ProfileModel(
          id: profileData[i]['id'],
          first_name: profileData[i]['first_name'],
          last_name: profileData[i]['last_name'],
          avatar: profileData[i]['avatar'],
        );
        children.add(Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(profile.avatar),
                ),
                title: Text('${profile.first_name} ${profile.last_name}'),
              )
            ],
          ),
        ));
      }
      return Column(
        children: children,
      );
    } else if(snapshot.hasError) {
      return Text('${snapshot.error}');
    }
    return CircularProgressIndicator();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Training App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<ProfileImageModel>(
                future: profileImageModel,
                builder: (context, snapshot) => 
                profilesBuilder(context, snapshot),
              )
            ],
          ),
        ),
      ),
    );
  }
}
