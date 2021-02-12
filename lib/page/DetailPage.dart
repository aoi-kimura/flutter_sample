import 'package:flutter/material.dart';
import 'package:flutter_sample/model/Item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.item}) : super(key: key);

  final Item item;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item.title),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: <Widget>[
              titleText(widget.item.title),
              createdAtText(widget.item.createdAt),
              bodyText(widget.item.body),
              button(widget.item.url)
            ],
          ),
        ));
  }

  Widget titleText(String title) {
    return Padding(
      child: Text(widget.item.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          )),
      padding: EdgeInsets.only(top: 10.0),
    );
  }

  Widget createdAtText(String createdAt) {
    final formated = createdAt.substring(0, 10);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        child: Text(formated, textAlign: TextAlign.right),
        padding: EdgeInsets.only(top: 10.0),
      ),
    );
  }

  Widget bodyText(String body) {
    return DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
        child: Padding(
          child: Text(widget.item.body),
          padding: EdgeInsets.only(top: 10.0),
        ));
  }

  Widget button(String url) {
    return Padding(
      child: RaisedButton(
        child: Text("webで見る"),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          launchURL(url);
        },
      ),
      padding: EdgeInsets.only(top: 10.0),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}
