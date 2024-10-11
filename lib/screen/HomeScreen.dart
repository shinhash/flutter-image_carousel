import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      int currPageNum = pageController.page!.toInt();
      int nextPageNum = currPageNum + 1;
      if (nextPageNum > 4) nextPageNum = 0;

      pageController.animateToPage(nextPageNum,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          controller: pageController,
          children: [1, 2, 3, 4, 5]
              .map((i) => Image.asset('asset/img/image_${i}.jpeg'))
              .toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if(timer != null) timer!.cancel();
    pageController.dispose();

    super.dispose();
  }
}
