import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:newsapp/models/newsModel.dart';

class Detail extends StatelessWidget {
  final News news;
  Detail({Key key, @required this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Center(child: Text(news.title)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/loading-opaque.gif",
                  image: news.image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        news.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      news.publisher,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromRGBO(200, 199, 203, 1)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Html(
                  data: news.body,
                ),
              )
            ],
          ),
        ));
  }
}
