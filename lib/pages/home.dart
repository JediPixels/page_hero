import 'package:flutter/material.dart';
import 'package:pagehero/classes/hero_type.dart';

import 'details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _heroTypeList = <HeroType>[];
  late double _screenWidthAdjustment;

  @override
  void initState() {
    super.initState();
    _heroTypeList = HeroType.createSampleList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Left and Right margins 24 + 24 = 48.0 - Text Left and Right Padding 32 + 32 = 64
    _screenWidthAdjustment = MediaQuery.of(context).size.width - 48.0 - 64.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemExtent: 180.0,
          itemCount: _heroTypeList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: <Widget>[
                    Hero(
                        tag: 'background' + _heroTypeList[index].title,
                        child: Container(
                          color: _heroTypeList[index].materialColor,
                        )),
                    Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Hero(
                            tag: 'image' + _heroTypeList[index].title,
                            child: Image.asset(_heroTypeList[index].image,
                                fit: BoxFit.fitWidth, height: 80.0))),
                    Positioned(
                        top: 96.0,
                        left: 32.0,
                        width: _screenWidthAdjustment,
                        child: Hero(
                            tag: 'text' + _heroTypeList[index].title,
                            child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  '${_heroTypeList[index].title}',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: _heroTypeList[index]
                                          .materialColor
                                          .shade900),
                                )))),
                    Positioned(
                        top: 125.0,
                        left: 32.0,
                        width: _screenWidthAdjustment,
                        child: Hero(
                            tag: 'subtitle' + _heroTypeList[index].title,
                            child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  _heroTypeList[index].subTitle,
                                  overflow: TextOverflow.ellipsis,
                                )))),
                  ],
                ),
              ),
              onTap: () {
                // MaterialPageRoute
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                      fullscreenDialog: true,
//                      builder: (BuildContext context) => Details(heroType: HeroType(title: _heroTypeList[index].title, subTitle: _heroTypeList[index].subTitle, image: _heroTypeList[index].image, materialColor: _heroTypeList[index].materialColor))
//                  ),
//                );

                // PageRouteBuilder
                Navigator.of(context).push(
                  PageRouteBuilder(
                    fullscreenDialog: true,
                    transitionDuration: Duration(milliseconds: 1000),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Details(
                          heroType: HeroType(
                              title: _heroTypeList[index].title,
                              subTitle: _heroTypeList[index].subTitle,
                              image: _heroTypeList[index].image,
                              materialColor:
                                  _heroTypeList[index].materialColor));
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return FadeTransition(
                        opacity:
                            animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                        child: child,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
