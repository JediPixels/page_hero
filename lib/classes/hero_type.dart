import 'package:flutter/material.dart';

class HeroType {
  String title;
  String subTitle;
  String image;
  MaterialColor materialColor;

  HeroType({this.title, this.subTitle, this.image, this.materialColor});

  List<HeroType> createSampleList() {
    List _heroType = List<HeroType>();
    return _heroType
      ..add(HeroType(
          title: 'Amber',
          subTitle: 'Lorem ipsum dolor sit amet',
          image: 'assets/images/asparagus.jpg',
          materialColor: Colors.amber))
      ..add(HeroType(
          title: 'Light Green',
          subTitle: 'Consectetur adipiscing elit',
          image: 'assets/images/salmon.jpg',
          materialColor: Colors.lightGreen))
      ..add(HeroType(
          title: 'Light Blue',
          subTitle: 'Sed do eiusmod tempor incididunt - Placerat ullamcorper nulla, nulla potenti consequat sem. Sed molestie litora. Sit diam lorem. Fringilla purus pharetra, pretium quam sed et. Ultricies at facilisis vehicula sit etiam urna, quis pellentesque, congue erat posuere auctor aut mauris, consequat ipsum aenean. Imperdiet iaculis quis lorem, arcu praesent leo cras placerat. Dapibus ligula risus eros curae, neque lobortis nunc libero dolor ac.',
          image: 'assets/images/tree.jpg',
          materialColor: Colors.lightBlue))
      ..add(HeroType(
          title: 'Deep Orange',
          subTitle: 'Ut labore et dolore magna aliqua',
          image: 'assets/images/lion.jpg',
          materialColor: Colors.deepOrange))
      ..add(HeroType(
          title: 'Teal',
          subTitle: 'Enim ad minim veniam',
          image: 'assets/images/eagle.jpg',
          materialColor: Colors.teal))
      ..add(HeroType(
          title: 'Lime',
          subTitle: 'Duis aute irure dolor in reprehenderit',
          image: 'assets/images/home_top_mountain.jpg',
          materialColor: Colors.lime))
      ..add(HeroType(
          title: 'Brown',
          subTitle: 'Eum ea dolore repudiandae',
          image: 'assets/images/desk.jpg',
          materialColor: Colors.brown))
      ..add(HeroType(
          title: 'Blue Grey',
          subTitle: 'Tollit docendi scriptorem nec id',
          image: 'assets/images/dawn.jpg',
          materialColor: Colors.blueGrey))
      ..add(HeroType(
          title: 'Red',
          subTitle: 'Eros eruditi fierent mel et',
          image: 'assets/images/present.jpg',
          materialColor: Colors.red))
      ..add(HeroType(
          title: 'Indigo',
          subTitle: 'Eros eruditi fierent mel et',
          image: 'assets/images/elephant.jpg',
          materialColor: Colors.indigo))
      ..add(HeroType(
          title: 'Pink',
          subTitle: 'Veniam scripserit ad eum',
          image: 'assets/images/strawberries.jpg',
          materialColor: Colors.pink));
  }
}
