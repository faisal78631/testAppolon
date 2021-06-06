import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class card extends StatefulWidget {
  const card({Key? key}) : super(key: key);

  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      "adsdsaas",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                      child: AutoSizeText(
                    "asdasdas",
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
                ])));
  }
}
