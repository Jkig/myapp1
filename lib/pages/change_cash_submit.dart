import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loading.dart';
/*
import 'package:brokerage_app/services/stock_data.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
*/
//import quant1 shit:
import 'package:brokerage_app/services/globals.dart' as globals;


class ChangeCashSumbit extends StatefulWidget {
  @override
  _ChangeCashSumbitState createState() => _ChangeCashSumbitState();
}

class _ChangeCashSumbitState extends State<ChangeCashSumbit> {
  double delta;
  @override
  Widget build(BuildContext context) {
    Map fullStanck = ModalRoute.of(context).settings.arguments;
    delta =  fullStanck['delta'];
    return Scaffold(
      appBar: AppBar(
          title: Text('Delta Page'),
          centerTitle: true,
          backgroundColor: Colors.blue[600]
      ),

      body: Column(

        children: <Widget>[
          //make sure to animate this page in
          Text('$delta'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    minWidth: 120.0,
                    height: 45.0,
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {

                        });
                        globals.quant1['cash'] +=delta;

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Loading()),
                              (Route<dynamic> route) => false,
                        );

                      },
                      color: Colors.blue[600],
                      child: Text('Deposit'),
                      padding: EdgeInsets.all(4.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),

                  SizedBox(width: 8.0),

                  ButtonTheme(
                    minWidth: 120.0,
                    height: 45.0,
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {
                          globals.quant1['cash'] -=delta;
                        });
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Loading()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      color: Colors.blue[600],
                      child: Text('Withdrawl'),
                      padding: EdgeInsets.all(4.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
