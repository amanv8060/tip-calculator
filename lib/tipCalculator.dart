import 'dart:ui';

import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  TipCalculator({Key key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  ///This variable stores tip Percentage
  double _tipPercentage = 15;
  

  ///This variable stores amount of tip
  double _tip = 0.0;

  //This Variable Will Store Bill Value
  double _bill = 0.0;

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          ListTile(
            title: Text("Enter Bill Amount"),
            trailing: Container(
              width: 60,
              child: TextFormField(
                decoration: InputDecoration(suffixText: "\$"),
                textAlign: TextAlign.right,
                initialValue: _bill.toString(),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (double.tryParse(value) != null) {
                    setState(() {
                      _bill = double.parse(value);

                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  } else {
                    setState(() { 
                      _bill = 0.0;
                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  }
                },
              ),
            ),
          ),
          ListTile(
            title: Text("Enter Tip Percentage"),
            trailing: Container(
              width: 60,
              child: TextFormField(
                decoration: InputDecoration(suffixText: "%"),
                textAlign: TextAlign.right,
                initialValue: _tipPercentage.toString(),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  if (double.tryParse(value) != null) {
                    setState(() {
                      _tipPercentage = double.parse(value);

                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  } else {
                    setState(() {
                      _tipPercentage = 0.0;
                      _tip = (_bill * _tipPercentage) / 100;
                    });
                  }
                },
              ),
            ),
          ),
          ListTile(
            title: Text("Tip Value"),
            trailing: Text(_tip.toString() + " \$"),
          ),
          ListTile(
            title: Text("Total Bill Amount"),
            trailing: Text((_tip + _bill).toString() + " \$"),
          ),
        ],
      ),
    );
  }
}
