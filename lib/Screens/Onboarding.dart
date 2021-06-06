import 'package:appollon/Widgets/Toplogo.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ContentOnboarding.dart';
import 'ShortenScreen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Column(
          children: [
            SizedBox(height: 20),
            const Toplogo(),
            SizedBox(height: 90.0),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contentsOnboard.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Stack(children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Colors.white,
                            child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          contentsOnboard[i].title,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Center(
                                          child: AutoSizeText(
                                        contentsOnboard[i].discription,
                                        style: TextStyle(fontSize: 40),
                                        maxLines: 4,
                                      )

                                          // Text(
                                          //   contentsOnboard[i].discription,
                                          //   textAlign: TextAlign.center,
                                          //   style: TextStyle(
                                          //     fontSize: 18,
                                          //     color: Colors.black,
                                          //   ),
                                          // ),
                                          ),
                                    ]
                                    )
                                    )
                                    ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 42,
                              width: 42,
                              decoration: new BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(contentsOnboard[i].image,
                                  width: 25, height: 25),
                            ),
                          ],
                        )
                      ],
                    )
                  ]);
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contentsOnboard.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  currentIndex == contentsOnboard.length - 1 ? "End" : "Next",
                  style: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (currentIndex == contentsOnboard.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ShortenUrl(),
                      ),
                    );
                  }
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                color: Colors.transparent,
                textColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.purple,
      ),
    );
  }
}