import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final List imageList = [
    'https://image.tmdb.org/t/p/w500/kk28Lk8oQBGjoHRGUCN2vxKb4O2.jpg',
    'https://image.tmdb.org/t/p/w300_and_h450_bestv2/aBkVgChtyyJaHyZh1gfd8DbzQon.jpg',
    'https://image.tmdb.org/t/p/w300_and_h450_bestv2/cdkyMYdu8ao26XOBvilNzLneUg1.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(appbarText: "Downloads"),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              Icon(
                Icons.settings,
                color: kwhiteColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Smart Downloads",
                style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Introducing Downloads for you",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: kwhiteColor)),
          )),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "We'll download a personalised selection of\n movies and shows for you, so there's\nalways something to watch on your\ndevice",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: size.width * .35,
                    backgroundColor: Colors.grey.withOpacity(0.45),
                  ),
                ),
                DownloadsImage(
                  imageList: imageList[1],
                  angle: 25,
                  margin: const EdgeInsets.only(left: 200),
                ),
                DownloadsImage(
                  imageList: imageList[2],
                  angle: -25,
                  margin: const EdgeInsets.only(right: 200),
                ),
                Container(
                  width: size.width * .6,
                  height: size.width * .60,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(imageList[0]))),
                ),
              ],
            ),
          ),
          Column(
            children: [
              MaterialButton(
                minWidth: double.infinity,
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                color: kblueColor,
                onPressed: () {},
                child: const Text(
                  "Set up",
                  style: TextStyle(
                      color: kwhiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                color: kwhiteColor,
                onPressed: () {},
                child: const Text(
                  "See what you can download",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DownloadsImage extends StatelessWidget {
  const DownloadsImage({
    Key? key,
    required this.imageList,
    required this.angle,
    required this.margin,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 360,
      child: Container(
        margin: margin,
        width: size.width * .4,
        height: size.width * .50,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageList))),
      ),
    );
  }
}
