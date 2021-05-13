import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class FileMenu extends StatefulWidget {

  FileMenu({
    Key key,
  }) : super(key: key);

  @override
  _FileMenuState createState() => _FileMenuState();
}

class _FileMenuState extends State<FileMenu> {
  var rand = new Random();
  DateTime now;

  @override
  void initState() {
    now = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return ClipRect(
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 70.0, sigmaY: 70.0),
        child: new Container(
            height: size.height*0.035,
            width: size.width,
            padding: EdgeInsets.all(3),
            decoration: new BoxDecoration(
              color: Colors.blue.withOpacity(0.6),
              border:  Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.3),
                  width: 0.5,
                ),
              ),),
            child: Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: size.width*0.012,),
                    Image.asset("assets/icons/apple_file.png"),
                    SizedBox(width: size.width*0.013,),
                    Text("Finder", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w800),),
                    SizedBox(width: size.width*0.014,),
                    Text("File", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600),),
                    SizedBox(width: size.width*0.014,),
                    Text("Edit", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600),),
                    SizedBox(width: size.width*0.014,),
                    Text("View", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600),),
                    SizedBox(width: size.width*0.014,),
                    Text("Go", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600),),
                    SizedBox(width: size.width*0.014,),
                    Text("Window", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600),),
                    SizedBox(width: size.width*0.014,),
                    Text("Help", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600),),


                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text("${rand.nextInt(20)+60}% ", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600, fontSize: 12.5),),
                    Image.asset("assets/icons/battery.png", height: 12,),
                    SizedBox(width: size.width*0.014,),
                    Image.asset("assets/icons/wifi.png", height: 13.5,),
                    SizedBox(width: size.width*0.014,),
                    Image.asset("assets/icons/spotlight.png", height: 14.5),
                    SizedBox(width: size.width*0.014,),
                    InkWell(child: Image.asset("assets/icons/cc.png", height: 16,),),
                    SizedBox(width: size.width*0.014,),
                    Image.asset("assets/icons/siri.png", height: 15),
                    SizedBox(width: size.width*0.014,),
                    Text("${DateFormat('E d LLL hh:mm a').format(now)}", style: TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w600),),
                    SizedBox(width: size.width*0.014,),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}