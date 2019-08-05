import 'package:encodex/screens/decode.dart';
import 'package:encodex/screens/encode.dart';
import 'package:flutter/material.dart';


class home extends StatefulWidget {
  home({Key key}) : super(key: key);

  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0F2027),
            const Color(0xFF203A43),
          ],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "Encodex",
            style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                fontSize: 30.0,
                letterSpacing: 2.0),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.whatshot),
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(child: Image.asset('images/logo.png',),),
            Padding(
              padding: const EdgeInsets.only(right:120.0,left: 120.0),
              child: _encryptButton(),
            ),
            SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.only(right:120.0,left: 120.0),
              child: _decryptButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _encryptButton extends StatelessWidget {
  const _encryptButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.only(top:10.0,bottom: 10.0,right: 20.0,left: 20.0),
      
      elevation: 30.0,
      color: const Color(0xFF203A43),
      child: Text("Encode",style: TextStyle(fontFamily: 'Raleway',fontSize: 30.0,color: Colors.white),),
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)
             ),

      onPressed: () {
        //debugPrint("Encode button has been pressed ");
        Navigator.push(context, MaterialPageRoute(builder: (context){
            return encode();
          }));
      },
    );
  }
}

class _decryptButton extends StatelessWidget {
  const _decryptButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.only(top:10.0,bottom: 10.0,right: 20.0,left: 20.0),
      
      elevation: 30.0,
      color: const Color(0xFF203A43),
      child: Text("Decode",style: TextStyle(fontFamily: 'Raleway',fontSize: 30.0,color: Colors.white),),
      animationDuration: Duration(seconds: 2),
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)
             ),

      onPressed: () {
        //debugPrint("Decode button has been pressed ");
        Navigator.push(context, MaterialPageRoute(builder: (context){
            return decode();
          }));
      },
    );
  }
}
