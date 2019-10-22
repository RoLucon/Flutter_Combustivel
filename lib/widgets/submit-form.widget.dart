import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.widget.dart';
import 'loading-btt.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var alcCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function submiFunc;

  SubmitForm({
    @required this.gasCtrl,
    @required this.alcCtrl,
    @required this.busy,
    @required this.submiFunc,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
              label: "Gasolina",
              ctrl: gasCtrl),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
              label: "Alcool",
              ctrl: alcCtrl
          ),
        ),
        SizedBox(
          height: 50,
        ),
        LoadingButton(
          busy: busy,
          invert: false,
          txt: "CALCULAR",
          func: submiFunc,
        ),
      ],
    );
  }
}
