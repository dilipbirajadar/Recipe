import 'package:flutter/material.dart';

class textrecipe extends StatelessWidget {
  textrecipe({required this.text, super.key});

  String text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      //padding: EdgeInsets.all(70),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        //borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      height: 165,
      //((MediaQuery.of(context).size.height) * 1 / 3) - 95,
      width: 400,
      //MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Wrap(children: [
              Container(
                margin: EdgeInsets.only(top: 20, right: 90, bottom: 40),
                padding: EdgeInsets.only(right: 10, left: 30),
                //margin: EdgeInsets.all(10),
                child: Text(text,
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontStyle: FontStyle.normal)),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
