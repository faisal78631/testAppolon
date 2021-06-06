import 'package:appollon/Constants.dart';
import 'package:appollon/Screens/Onboarding.dart';
import 'package:appollon/Widgets/Toplogo.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        // Container(
        //   height: screenSize.height * 0.56,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //  color: Colors.lightBlue,
              height: screenSize.height * 0.56,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Toplogo(),
                  Container(
                      // color: Colors.lightGreen,
                      width: screenSize.width,
                      height: screenSize.height * 0.42,
                      margin: EdgeInsets.only(right: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            "assets/images/illustration.svg",
                            width: screenSize.width,
                            height: screenSize.height * 0.46,
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      )
                      ),
                  ///
                  ///
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      // color: Colors.deepOrange,
                      child: Column(children: [
                        
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right:10),
                        child: Container(
                          width: 150,
                          child: AutoSizeText(
                              "More than just shorter links",
                              style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              
                            ),
                        ),
                      ),
                      // Text("More than just shorter links",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.w900,
                      //       fontSize: 30.0,
                      //     ),
                      //     textAlign: TextAlign.center),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        // color: Colors.grey,
                        width: 240,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "Build your brand's recognition and get detailed insights on how your links are performing.",
                          style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.normal),
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                        )
                        // Text(
                        //   "Build your brand's recognition and get detailed insights on how your links are performing.",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w500, fontSize: 18.0),
                        //   textAlign: TextAlign.center,
                        // ),
                        ),
                  ])),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: screenSize.width / 2,
                      height: 45.0,
                      child: ElevatedButton(
                        child: Text('START'),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          primary: Colors.teal,
                          onPrimary: Colors.white,
                          shadowColor: Colors.red,
                          elevation: 5,
                        ),
                        onPressed: () {
                          print('Pressed');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Onboarding()));
                        },
                      )),
                ),
              ],
            )
            )
          ],
        )
      ],
    ));
  }
}
