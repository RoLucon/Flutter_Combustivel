import 'package:flutter/material.dart';

import 'loading-btt.widget.dart';

class Success extends StatelessWidget {
  var result = "";
  Function reset;


  Success({
    @required this.result,
    @required this.reset});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontFamily: "Big Shoulder Display",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            busy: false,
            invert: true,
            txt: "CALCULAR NOVAMENTE",
            func: reset,
          ),
        ],
      ),
    );
  }
}
