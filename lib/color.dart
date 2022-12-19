import 'package:flutter/material.dart';

//注意使用這裡的素材更改樣式時，不能使用Hot reload，要使用Run，如此才會更新color.dart。
//在list加入設計，用textstyle值去選取，Ex:Text('Hi',style:tstyle[textstyle]，Button同理
//用final建立函式，直接用Tes1執行，Ex:Text('Hi',style:Tes1)；Button設計同理
//依自己需求刪減、修改、新增
//盡量使用List方式，會比較方便

//background design---
int backgroundnum=0;
int backgroundnum1=0;int backgroundnum2=0;int backgroundnum3=0;int backgroundnum4=0;
int backgroundnum5=0;int backgroundnum6=0;int backgroundnum7=0;int backgroundnum8=0;
int backgroundnum9=0;int backgroundnum10=0;int backgroundnum11=0;int backgroundnum12=0;
List<BoxDecoration> backgrounds = [
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.red, Colors.blue],
    ),
  ),
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.orange, Colors.purple],
    ),
  ),
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.yellow, Colors.green],
    ),
  ),
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.pink, Colors.teal],
    ),
  ),
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.cyan, Colors.deepPurple],
    ),
  ),
];



//Text design---

final TextStyle Tes1=TextStyle(color: Colors.blue[800]);

int textstyle=0;
List<TextStyle> tstyle=[
  TextStyle(color: Colors.red[800]),
];


//Button design---

final ButtonStyle buts1=ElevatedButton.styleFrom(
  backgroundColor: Colors.grey,
);

int buttonstyle=0;
List<ButtonStyle> bstyle=[
  ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
  ),
];

