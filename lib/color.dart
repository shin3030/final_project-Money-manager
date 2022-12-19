import 'package:flutter/material.dart';

//注意使用這裡的素材更改樣式時，不能使用Hot reload，要使用Run，如此才會更新color.dart。
//在list加入設計，用textstyle值去選取，Ex:Text('Hi',style:tstyle[textstyle]，Button同理
//用final建立函式，直接用Tes1執行，Ex:Text('Hi',style:Tes1)；Button設計同理
//依自己需求刪減、修改、新增
//盡量使用List方式，會比較方便

//background design---第187行
int backgroundnum=0;
int backgroundnum1=0;int backgroundnum2=0;int backgroundnum3=0;int backgroundnum4=0;
int backgroundnum5=0;int backgroundnum6=0;int backgroundnum7=0;int backgroundnum8=0;
int backgroundnum9=0;int backgroundnum10=0;int backgroundnum11=0;int backgroundnum12=0;


List<BoxDecoration> backgrounds = [
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromARGB(255, 49, 49, 49), Color.fromARGB(
          255, 9, 120, 122)],
    ),
  ),//-----tech
  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.orange.shade400,Colors.pink.shade400,Colors.purple],
    ),
  ),//------juicy

];


//ElevatedButton design---第138、152行
List<ButtonStyle> bstyle=[
  ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 0, 95, 112),),//tech
];

//AlertDiog design---第104行
List<Color> stylealert=[
  Color.fromARGB(179, 8, 208, 253),
];

//Switch design---第112行
List<Color> styleswitch=[
  Color.fromARGB(255, 255, 255, 255),
];


//Card shadow design---第196、201行
List<Color> styleshadow=[
  Color.fromARGB(255, 8, 245, 253),
];

//appbar design---第175行
List<Color> styleappbar=[
  Color.fromARGB(255, 9, 120, 122),
];

//up arrow and $income design---第230、241行
List<Color> styleup=[
  Color.fromARGB(255, 19, 255, 74),//up箭頭和income的$
];

//down arrow and $expense design---第264、275行
List<Color> styledown=[
  Color.fromARGB(255, 255, 19, 137),//dowm箭頭和income的$
];

//listText design---第298~300行
List<Color> stylelist=[
  Color.fromARGB(255, 8, 245, 253),//listtitle(全部)
];

//FloatButton design---第314行
List<Color> styleFloatbutton=[
  Color.fromARGB(255, 70, 70, 70),//FloatingActionButton
];

//FloatButton icon design---第317行
List<Icon> styleFloaticon=[
  Icon(Icons.add,color: Color.fromARGB(255, 8, 245, 253),),//FloatingActionButto的+
];

//Card design--- 第196~210
List<BoxDecoration> Cardground=[
  BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey[800],
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0),
        BoxShadow(
            color:Color.fromARGB(255, 8, 245, 253),
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0),
      ]),//-----tech

  BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color.fromARGB(255, 245, 200, 56),
      boxShadow: [
        BoxShadow(
            color: Colors.orange.shade400,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0),
        BoxShadow(
            color: Colors.orange.shade400,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0),
      ]),//-----juicy


];