import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:heyy/language/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:flutter_swiper/flutter_swiper.dart';

import 'dart:async';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  double _backgroundOffset = 0.0;
  Timer timer;

  @override
  void initState(){
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_backgroundOffset < 100) {
          _backgroundOffset +=0.02;
        }
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                alignment: FractionalOffset.fromOffsetAndSize(
                Offset(
                  _backgroundOffset,
                  0.0,
                ),
                Size(100, 100)
              ),
                colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop),
                image: NetworkImage("https://lh3.googleusercontent.com/VrPzQ6Z3XK7oDcKn51AbKRAs_4U1wybryBOX62YhXXo3hVQLK9fujO_NtZ2hqUDs8e6KYicmew=w640-h400-e365"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 42.0, top: 62.0, left: 12.0, right: 12.0),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text("heyy!"),
                        Spacer(),
                        Text(AppLocalizations.of(context).title),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 3,
              pagination: new SwiperPagination(builder: const DotSwiperPaginationBuilder(
                size: 10.0, activeSize: 10.0, space: 6.0, color: Colors.white, activeColor: Colors.green)
              )
            ),
          ),
          SizedBox(
          width: MediaQuery.of(context).size.width,
           child: Padding(
              padding: EdgeInsets.only(bottom: 38.0, left: 12.0, right: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ButtonTheme(
                    height: 42.0,
                    child: FlatButton(
                      child: Text(AppLocalizations.of(context).skip),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
