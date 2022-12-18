import 'package:flutter/material.dart';
import '1.dart';import '2.dart';import '3.dart';import '4.dart';
import '5.dart';import '6.dart';import '7.dart';import '8.dart';
import '/9.dart';import '10.dart';import '11.dart';import '12.dart';
import 'color.dart';import 'counting.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
  }
class _HomePageState extends State<HomePage>{



  void changeBackground() {
    setState(() {
      backgroundnum= (backgroundnum + 1) % backgrounds.length;
    });
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          elevation:5,
          backgroundColor: Colors.cyan.shade50.withOpacity(1.0),
          title: Text('Money manager',
            style:TextStyle(fontSize: 30,color: Colors.grey[600]) ,),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: changeBackground,
            ),
          ],
        ),
      body: Center(
        child: Container(
          decoration:backgrounds[backgroundnum],
        child:Column(
        children: [
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[800],
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ]),
            height: 200,
            width: 350,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Asset:',style: TextStyle(color: Colors.white,fontSize: 20),),
                Text('\$$total_asset',style: TextStyle(color: Colors.white,fontSize: 30),),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Income',
                                      style: TextStyle(color: Colors.grey[500])),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('\$$total_income',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Expense',
                                      style: TextStyle(color: Colors.grey[500])),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('\$$total_expense',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          )
                        ])

                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(1),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.shade50.withOpacity(0.25),
                      border: Border.all(width: 2,color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Colors.pink.shade50,
                            offset: Offset(-4.0, -4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ]
                  ),

                  child:ListTile(
                  title: Text((index + 1).toString() + '月'),
                  trailing: Text(index==0?'$asset1':index==1?'$asset2':index==2?'$asset3':index==3?'$asset4':
                                  index==4?'$asset5':index==5?'$asset6':index==6?'$asset7':index==7?'$asset8':
                                  index==8?'$asset9':index==9?'$asset10':index==10?'$asset11':index==11?'$asset12':''),
                  onTap: () {
                    switch(index+1){
                      case 1:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => JanuaryPage(title: '1月',)
                              ,)).then((value){setState(() {
                                total_asset=total_income-total_expense;

                              });});
                        break;
                      case 2:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FebruaryPage(title: '2月',)
                              ,)).then((value) {
                              setState(() {
                                total_asset = total_income - total_expense;
                              });
                            });
                        break;
                      case 3:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>MarchPage(title: '3月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 4:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>AprilPage(title: '4月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 5:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>MayPage(title: '5月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 6:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>JunePage(title: '6月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 7:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>JulyyPage(title: '7月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 8:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>AugustPage(title: '8月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 9:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>SeptemberPage(title: '9月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 10:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>OctoberPage(title: '10月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 11:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>NovemberPage(title: '11月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                      case 12:
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>DecemberPage(title: '12月',)
                              ,)).then((value) {
                          setState(() {
                            total_asset = total_income - total_expense;
                          });
                        });
                        break;
                    }
                  },
                ),);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ],
      ),)
    ));
  }
}



