import 'package:flutter/material.dart';
import 'package:quotation/quotation.ui.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    title: "HGFINANCE",
    home: Splash(),
    // Define um thema para todo o app
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
    debugShowCheckedModeBanner: false,
  ));
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SplashScreen(
        seconds: 6,
        navigateAfterSeconds: HgFinance(),
        title: Text(
          "Bem vindo ao HGFinance",
          style: TextStyle(fontSize: 70, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.amberAccent,
        loaderColor: Colors.black,
        loadingText: Text("Aguarde um momento..."),
      ),
    );
  }
}
