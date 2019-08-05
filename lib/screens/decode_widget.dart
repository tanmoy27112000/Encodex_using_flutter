import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class decodeWidget extends StatefulWidget {
  decodeWidget({Key key}) : super(key: key);

  _decodeWidgetState createState() => _decodeWidgetState();
}

class _decodeWidgetState extends State<decodeWidget> {
  var charList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    ' '
  ];
  var codeList = [
    61,
    79,
    85,
    41,
    11,
    30,
    22,
    5,
    66,
    49,
    69,
    25,
    34,
    71,
    50,
    101,
    305,
    4,
    3,
    74,
    67,
    90,
    96,
    9,
    0,
    1,
    501,
    2,
    12,
    14,
    8,
    72,
    39,
    45,
    19,
    101,
    404
  ];
  String message = "";
  String password = "";
  String text = "";
  String decodedText = "";

  TextEditingController messageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0,
            ),
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text("Encode",
            // style: TextStyle(
            //   fontSize: ScreenUtil.getInstance().setSp(45),
            //   fontFamily: 'Raleway',
            //   fontWeight: FontWeight.w700,
            //   letterSpacing: 0.6,
            // ),
            // ),
            // SizedBox(height: ScreenUtil.getInstance().setHeight(50),),
            Text(
              "Message",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: ScreenUtil.getInstance().setSp(26),
              ),
            ),
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(50),
            ),
            Text(
              "Password",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: ScreenUtil.getInstance().setSp(26),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35.0),
            ),
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                    elevation: 30.0,
                    color: const Color(0xFF203A43),
                    child: Text(
                      "Copy",
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 30.0,
                          color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      setState(() {
                        //!copy functionality
                        Clipboard.setData(new ClipboardData(text: decodedText));
                        final snackBar =
                            SnackBar(content: Text('Message Copied'));
                        // Find the Scaffold in the widget tree and use it to show a SnackBar.
                        Scaffold.of(context).showSnackBar(
                            snackBar); //! snackbar popup on copying
                      });

                      //debugPrint("copy button has been pressed ");
                    },
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                    elevation: 30.0,
                    color: const Color(0xFF203A43),
                    child: Text(
                      "Decode",
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 30.0,
                          color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      if (decodedText.length != 0) {
                        decodedText = "";
                      }
                      setState(() {
                        _input();
                      });

                      //debugPrint("Decode button has been pressed ");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35.0),
            ),
            Align(
              child: Text(
                decodedText,
                style: TextStyle(fontFamily: 'Raleway', fontSize: 20),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }

  String _input() //!Taking input from the user
  {
    message = messageController.text;
    password = passwordController.text;
    //debugPrint("message=" + message + " password= " + password);
    text = message + password;
    text = text.toUpperCase();
    //debugPrint(text);
    _decrypt();
  }

  //! Decoding the the encoded text
  void _decrypt() {
    int counter = 0;
    text = text + " ";
    int lastIndex = 0, j = 0, number, c = 0;
    for (var i = 0; i < text.length; i++) {
      if (text[i] == " ") {
        counter++;
      }
    }
    //debugPrint("counter= $counter");
    List itemList = new List(counter);
    //debugPrint("list created");

    for (var i = 0; i < text.length; i++) {
      if (text[i] == ' ') {
        j = i;
        //counter++;
        String element = text.substring(lastIndex, j);
        lastIndex = j;
        try {
          number = int.parse(element);
        } catch (e) {
          //debugPrint("cannot cast to int");
        }
        //debugPrint("String to number done");
        try {
          itemList[c] = number;
        } catch (e) {
          //debugPrint("the element cannot be asssinged to the list");
        }
        c++;
      }
    }
    try {
      for (int i = 0; i < itemList.length - 1; i++) {
        if (i % 2 == 0) {
          itemList[i] = itemList[i] - 5;
        } else {
          itemList[i] = itemList[i] - 3;
        }
      }
    } catch (e) {
      print("summing causing problem");
    }
    for (int i = 0; i < itemList.length - 1; i++) {
      //debugPrint(itemList[i].toString());
      for (j = 0; j < codeList.length; j++) {
        if (itemList[i] == codeList[j]) {
          decodedText = decodedText + charList[j];
        }
      }
    }
    decodedText = decodedText.toLowerCase();
    //debugPrint(decodedText);
    if (decodedText.substring(decodedText.length - password.length) !=
        password) {
      decodedText = "Oops thats not for you!!!!";
      //decodedText="";
    } else if (password.length == 0) {
      decodedText = "you need to know the password baby!!";
      //decodedText="";
    } else {
      decodedText =
          decodedText.substring(0, decodedText.length - password.length);
      decodedText = decodedText.toLowerCase();
    }
  }
}
