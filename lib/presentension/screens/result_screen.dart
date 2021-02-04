import 'package:flutter/material.dart';
import 'package:search_from_github_repo/data/models/arg.dart';

class ResultScreen extends StatefulWidget {
  final Arguments arguments;
  ResultScreen({this.arguments});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('РЕЗУЛЬТАТ ПОИСКА'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleWidget(),
            SizedBox(
              height: 15.0,
            ),
            cardWidget(),
            cardWidget(),
            cardWidget(),
          ],
        ),
      ),
    );
  }

  Container titleWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'ПО ЗАПРОСУ: ',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '\"${widget.arguments.searchText}\"'.toUpperCase(),
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            TextSpan(
              text: '\nНАЙДЕНО: 54',
              style: TextStyle(
                height: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container cardWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Название репозитория",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      color: Theme.of(context).primaryColor,
                      size: 14.0,
                    ),
                    Text(
                      "67",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Username",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Divider(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                "Обновлено:  ",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "3 января",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
