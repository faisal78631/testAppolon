import 'dart:convert';

import 'package:appollon/Widgets/Toplogo.dart';
import 'package:appollon/Widgets/shortTextWidget.dart';
import 'package:appollon/resource/mixins/validationMixin.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'ShortUrl.dart';
import 'package:flutter/services.dart';

class ShortenUrl extends StatefulWidget {
  const ShortenUrl({Key? key}) : super(key: key);

  @override
  _ShortenUrlState createState() => _ShortenUrlState();
}

class _ShortenUrlState extends State<ShortenUrl> with ValidationMixin {
  List<ShortUrl> urlList = [];
  bool _validate = false;
  bool isShowing = false;
  TextEditingController _textController = TextEditingController();
  String txtFieldVal = "";

  onItemChanged(String value) async {
    setState(() {
      print(value);
      txtFieldVal = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    initState() {
      super.initState();
    }

    dispose() {
      super.dispose();
    }

    getShortURl(String url) async {
      var response = await http.get(Uri.https('api.shrtco.de',
          'v2/shorten?url="$url" '));
      Map<String, dynamic> map = jsonDecode(response.body);
      Map<String, dynamic> data1 = map["result"];
      ////original_link   &&  full_short_link
      urlList.add(ShortUrl(urlList.length + 1, data1['original_link'],
          data1['full_short_link3'], false));

      if (urlList.length > 0) {
        isShowing = true;
      } else {
        isShowing = false;
      }

      setState(() {});
    }

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              Container(
                  height: screenSize.height * .75,
                  width: screenSize.width,
                  color: Colors.white,
                  child: isShowing
                      ? shortenTrue(screenSize, urlList)
                      : shortenFalse(screenSize)),
              Container(
                height: screenSize.height * .25,
                width: screenSize.width,
                color: Color(0xff5D4A89),
                child: Stack(
                  children: [
                    Positioned(
                        child: SvgPicture.asset("assets/images/shape.svg"),
                        width: 100,
                        height: 100,
                        top: 0,
                        right: 0),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30.0, left: 30.0, top: 15),
                          child: txtFieldLink(),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 400,
                              padding: const EdgeInsets.only(
                                  right: 30.0, left: 30.0, top: 10.0),
                              height: 45.0,
                              child: ElevatedButton(
                                child: Text('Shorten It'),
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                  primary:
                                      const Color.fromRGBO(89, 207, 207, 1.0),
                                  onPrimary: Colors.white,
                                  elevation: 5,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _textController.text.isEmpty
                                        ? _validate = true
                                        : _validate = false;

                                    if (_textController.text.isNotEmpty) {
                                      getShortURl(_textController.text);
                                      isShowing = true;
                                    } else {
                                      isShowing = false;
                                    }
                                  });
                                },
                              )),
                        ),
                      ],
                    )
                  ],
                ),

                //  txtFieldLink(),
                //           RaisedButton(

                //   child: Text("Show or hide"),
                //   onPressed: (() {
                //     setState(() {
                //       //// validation
                //       /// call api
                //       ///
                //       isShowing = true;
                //     });
                //   })
                //   ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container txtFieldLink() {
    return Container(
      color: Colors.white,
      child: TextField(
        showCursor: true,
        readOnly: false,
        controller: _textController,
        style: TextStyle(color: Colors.black, fontSize: 15.0, height: 1.0),
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          prefixIcon: Icon(Icons.link),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          hintText: 'Shorten a link here',
          errorText: _validate ? 'Value Can\'t Be Empty' : null,
        ),
        onChanged: onItemChanged,
      ),
    );
  }

  Container shortenTrue(Size screenSize, List<ShortUrl> userList) {
    return Container(
      child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.white,
                child: Container(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  width: screenSize.width * 0.75,
                                  child: Text(
                                    userList.elementAt(index).url,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: SvgPicture.asset(
                                        "assets/images/del.svg"))
                              ],
                            ),

                            Container(
                                margin:
                                    const EdgeInsetsDirectional.only(top: 8),
                                width: screenSize.width,
                                height: 0.5,
                                color: Colors.black),
                            // const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                userList.elementAt(index).origUrl,
                                style: TextStyle(
                                  color:
                                      const Color.fromRGBO(89, 207, 207, 1.0),
                                  fontSize: 15,
                                ),
                              ),

                              // Text(
                              //   contentsOnboard[i].discription,
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     fontSize: 18,
                              //     color: Colors.black,
                              //   ),
                              // ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 400,
                                  padding: const EdgeInsets.only(
                                      right: 30.0, left: 30.0, top: 15.0),
                                  height: 50.0,
                                  child: ElevatedButton(
                                    child:
                                        (userList.elementAt(index).copyOrNot ==
                                                true)
                                            ? Text("COPIED")
                                            : Text("COPY"),
                                    style: ElevatedButton.styleFrom(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      primary: const Color.fromRGBO(
                                          89, 207, 207, 1.0),
                                      onPrimary: Colors.white,
                                      elevation: 5,
                                    ),
                                    onPressed: () {
                                      print('Pressed2');
                                      setState(() {
                                        print('Pressed4');
                                        Clipboard.setData(ClipboardData(text: userList.elementAt(index).origUrl));
                                        userList.elementAt(index).copyOrNot =
                                            true;
                                      });
                                    },
                                  )),
                            ),
                          ])),
                ));
          }),
    );
  }

  Visibility shortenFalse(Size screenSize) {
    return Visibility(
      visible: !isShowing,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Container(
        //  color: Colors.lightBlue,
        height: screenSize.height * 0.73,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Toplogo(),
            Container(
                // color: Colors.lightGreen,
                height: screenSize.height * 0.40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/illustration.svg",
                      height: screenSize.height * 0.40,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                )),
            const textWidget(),
          ],
        ),
      ),
    );
  }
}
