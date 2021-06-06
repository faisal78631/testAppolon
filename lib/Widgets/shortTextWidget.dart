import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class textWidget extends StatelessWidget {
  const textWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Container(
                              child: Padding(
                            padding:
                                const EdgeInsets.only(left: 35.0, right: 35.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Center(
                                  child: Container(
                                    width: 150,
                                    child: AutoSizeText(
                                      "Let's get started!",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.purple,fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 160,
                                    child: AutoSizeText(
                                      "Paste your first link into the field to shorten it",
                                      style: TextStyle(fontSize: 20,),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          );
  }
}