import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Toplogo extends StatelessWidget {
  const Toplogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: SvgPicture.asset("assets/images/logo.svg")),
      ),
    );
  }
}
