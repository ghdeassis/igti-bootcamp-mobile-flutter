import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Hello());
}

testeButton() {
  debugPrint('clicou');
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              width: 90.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hello', style: TextStyle(
                    fontSize: 40.0,
                    fontStyle: FontStyle.italic,
                )),
                Padding(
                  //padding: const EdgeInsets.all(0.0),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text('World', style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800
                  )),
                ),
                Text('John!',
                    style: TextStyle(
                        fontSize: 40.0,
                        backgroundColor: Colors.black,
                        color: Colors.white
                    ))
              ],
            ),
            FlatButton(
              onPressed: testeButton,
              color: Colors.lightGreen,
              child: Text(
                'Teste',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              color: Colors.amber,
              width: 300.00,
              height: 200.00,
              alignment: Alignment.center,
              child: Text('Texto dentro do container'),
            )
          ],
        ),
      ),
    );
  }
}
