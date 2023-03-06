import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radish_app/home_screen.dart';
import 'package:radish_app/splash_screen.dart';

//  메인함수 빌드
void main() {
  runApp(MyApp());
}

// 정적 클래스 선언
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return HomeScreen();

    return FutureBuilder<Object>(
      future: Future.delayed(Duration(seconds: 3), () => 100),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 900), // 페이드인아웃 효과
          child: _splashLoadingWidget(snapshot), // 스냅샷실행 위젯지정
        );
      }
    );
  }
  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object> snapshot) {
    if(snapshot.hasError) {print('에러가 발생하였습니다.'); return Text('Error');} //에러
    else if(snapshot.hasData) {return HomeScreen();} //정상
    else{return SplashScreen();} // 그외
  }
}
