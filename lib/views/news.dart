import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapp/models/newsModel.dart';
import 'package:newsapp/services/fetchNews.dart';
import 'detail.dart';

class AllNews extends StatefulWidget {
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  Stream<List<News>> news;

  @override
  void initState() {
    super.initState();
    news = Stream.fromFuture(new FetchNews().getNews).asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "News",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: _buildNewsList(news),
            margin: EdgeInsets.only(top: 5),
            color: Colors.white,
          ),
        ));
  }

//New list on home page
  Widget _buildNewsList(Stream<List<News>> newsStream) {
    return StreamBuilder<List<News>>(
      stream: newsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SpinKitDoubleBounce(
            color: Color.fromRGBO(212, 81, 0, 1),
            size: 50.0,
          );
        } else {
          List<News> news = snapshot.data;
          return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(news: news[index]),
                            ));
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    news[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    news[index].publisher,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(200, 199, 203, 1)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Color.fromRGBO(166, 166, 166, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
