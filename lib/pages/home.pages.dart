import 'package:combustivel/widgets/logo.widget.dart';
import 'package:combustivel/widgets/submit-form.widget.dart';
import 'package:combustivel/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar Álcool";
  Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            SizedBox(
              height: 30,
            ),
            _completed
                ? Success(
                result: _resultText,
                reset: (){
                  setState(() {
                    _completed = false;
                  });
                })
                : SubmitForm(
              alcCtrl: _alcCtrl,
              gasCtrl: _gasCtrl,
              busy: _busy,
              submiFunc: calculate,
            ),
          ],
        ),
      ),
    );
  }

  Future calculate(){
    double alc = double.parse(
      _alcCtrl.text.replaceAll(new RegExp(r'[,.]'),''),) / 100;
    double gas = double.parse(
      _gasCtrl.text.replaceAll(new RegExp(r'[,.]'),''),) / 100;
    double res = alc / gas;

    setState(() {
      _color =  Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });
    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if(alc == 0 && gas == 0){
          _resultText = "Entre o valor do Álcool e da Gasolina";
        }else if(gas == 0){
          _resultText = "Entre o valor da Gasolina";
        }else if(alc == 0){
          _resultText = "Entre o valor do Álcool";
        }else if(res >= 0.7){
          _resultText = "Compensa utilizar Gasolina";
        }else {
          _resultText = "Compensa utilizar Álcool";
        }
        _completed = true;
        _busy = false;
        _color = Theme.of(context).primaryColor;
      });
    });

  }
}