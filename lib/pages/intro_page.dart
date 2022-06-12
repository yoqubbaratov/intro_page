import 'package:flutter/material.dart';
import 'package:intro_page/pages/home_page.dart';

import '../utils/Strings.dart';

class IntroPage extends StatefulWidget {
  static const String id = "/intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: [
                makePage(
                  image: "assets/images/img.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                ),
                makePage(
                  image: "assets/images/img_1.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                ),
                makePage(
                  image: "assets/images/img_2.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 68),
              child:  currentIndex==2?
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children:[ GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                ),
                ], ):
              const SizedBox(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // children: _buildIndicator(),
                children: _buildIndicator(),
              ),
            ),

          ],
        ));
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.red, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (i == currentIndex) {
        indicators.add(
          _indicator(true),
        );
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
