import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('Sl'),
              backgroundColor: Colors.brown,
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://images2-mega.mdstrm.com/etcetera/2018/05/29/6027_1_5b0d7e2e3e0f8.jpg?d=500x500'),
              radius: 25.0,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 200),
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stan-lee-arrives-at-the-premiere-of-disney-and-marvels-news-photo-950501274-1542049801.jpg'),
        ),
      ),
    );
  }
}
