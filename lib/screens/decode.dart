import 'package:flutter/cupertino.dart';
import 'decode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class decode extends StatefulWidget {
  decode({Key key}) : super(key: key);

  _decodeState createState() => _decodeState();
}

class _decodeState extends State<decode> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance=ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance=ScreenUtil(width: 750,height:1334,allowFontScaling: true);
    return Scaffold(
       backgroundColor: Color(0xFF0F2027),
       resizeToAvoidBottomPadding: true,
       body: Stack(
         fit: StackFit.expand,
         children: <Widget>[
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top:20.0),
                child: Image.asset('images/image_01.png'),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset('images/image_02.png'),
             ],
           ),
           SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.only(top:60,left:28.0,right:28.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Image.asset('images/logo_small.png',
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                       ),
                       Text("Encodex",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: ScreenUtil.getInstance().setSp(46),
                          fontWeight: FontWeight.w700,
                          letterSpacing: .6,
                        ),
                       )
                     ],
                   ),
                   SizedBox(
                     height: ScreenUtil.getInstance().setHeight(180),
                   ),
                  decodeWidget(),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40),),
                  //encryptButton(),
                 ],
               ),
             ),
           ) 
         ],
       ),
    );
  }
}


