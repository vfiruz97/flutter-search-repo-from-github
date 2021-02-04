import 'package:flutter/material.dart';
import 'package:search_from_github_repo/data/models/arg.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ПОИСК'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1.0,
      ),
      body: Container(
        height: 50.0,
        margin: const EdgeInsets.only(
          top: 100.0,
          left: 10.0,
          right: 10.0,
        ),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: <Widget>[
            textField(),
            searchBtn(),
          ],
        ),
      ),
    );
  }

  Widget textField() {
    return Expanded(
      child: TextFormField(
        initialValue: search,
        onChanged: (val) {
          setState(() {
            search = val;
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(
            left: 10.0,
            bottom: 5.0,
          ),
        ),
      ),
    );
  }

  Widget searchBtn() {
    return FlatButton(
      height: 44.0,
      minWidth: 100.0,
      color: Colors.blue[300],
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Text(
        "НАЙТИ",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (search.length > 1) {
          Navigator.pushNamed(context, '/result', arguments: Arguments(search));
        }
      },
    );
  }
}
