import 'package:flutter/material.dart';
import 'package:pagehero/classes/hero_type.dart';

class Details extends StatefulWidget {
  final HeroType heroType;

  const Details({super.key, required this.heroType});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late HeroType _heroType;
  late double _screenWidth;

  @override
  void initState() {
    super.initState();
    _heroType = widget.heroType;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_heroType.title}'),
        backgroundColor: _heroType.materialColor,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'background' + _heroType.title,
              child: Container(
                color: _heroType.materialColor,
              ),
            ),
            Positioned(
                top: 0.0,
                left: 0.0,
                width: _screenWidth,
                height: 230.0,
                child: Hero(
                    tag: 'image' + _heroType.title,
                    child: Image.asset(
                      _heroType.image,
                      fit: BoxFit.fitWidth,
                    ))),
            Positioned(
                top: 250.0,
                left: 32.0,
                width: _screenWidth - 64.0,
                child: Hero(
                    tag: 'text' + _heroType.title,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          '${_heroType.title}',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: _heroType.materialColor.shade900),
                        )))),
            Positioned(
                top: 280.0,
                left: 32.0,
                width: _screenWidth - 64.0,
                child: Hero(
                    tag: 'subtitle' + _heroType.title,
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          _heroType.subTitle,
                        )))),
          ],
        ),
      ),
    );
  }
}
