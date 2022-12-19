import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/counting.dart';
import 'color.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController amountController = TextEditingController();


void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    print(details.toString());
  };
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FebruaryPage(title:'2月'),
    );
  }
}

class FebruaryPage extends StatefulWidget {
  FebruaryPage({Key? key,required this.title}) : super(key:key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FebruaryPage> {

  bool seletincome=false;



  void _changeBackground() {
    setState(() {
      backgroundnum2 = (backgroundnum2 + 1) % backgrounds.length;
    });
  }


  void _addItem(String name, int amount, bool isIncome) {
    setState(() {
      if (isIncome) {
        income2 += amount;
        total_income+=amount;
      } else {
        expense2 += amount;
        total_expense+=amount;
      }
      asset2 = income2 - expense2;
      items2.add({
        'name': name,
        'amount':amount,
        'isIncome': isIncome,
      });
    });
  }

  void _removeItem(int index) {

    setState(() {
      Map<String, dynamic> item = items2[index];
      int a1=item['amount'];
      if (item['isIncome']) {
        income2 -= a1;
        total_income-=a1;
      } else {
        expense2 -= a1;
        total_expense-=a1;
      }
      asset2 = income2 - expense2;
      items2.removeAt(index);

    });
  }



  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(243, 189, 73, 0.7647058823529411),
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Expense'),
                  Switch(
                    activeColor: Colors.orange.shade900,
                    activeTrackColor: Colors.orange.shade800,
                    value:seletincome,
                    onChanged: (newValue) {
                      setState(() {
                        seletincome =!seletincome;
                      });
                    },
                  ),
                  Text('Income'),
                ],
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 176, 0, 0.8274509803921568),),
                    child: Text('Enter'),
                    onPressed: () {
                      _addItem(nameController.text, int.parse(amountController.text), seletincome);
                      Navigator.of(context).pop();
                      nameController.text = '';
                      amountController.text = '';
                      if(seletincome==true){
                        setState((){
                          seletincome=false;
                        });
                      };
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 176, 0, 0.8274509803921568),),
                    child: Text('Cancel'),
                    onPressed: () {
                      setState((){
                        seletincome=false;
                      });
                      Navigator.of(context).pop();
                      nameController.text = '';
                      amountController.text = '';
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor:Colors.orange.shade400,
        title: Text(widget.title,
          style:TextStyle(fontSize: 30) ,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: _changeBackground,
          ),
        ],

      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange.shade400,Colors.pink.shade400,Colors.purple],
          ),
        ),
        child:Column(
          children: [

            SizedBox(width: 0,height: 20,),
            Container(
              decoration: BoxDecoration(
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
                  ]),
              width: 350,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Asset:',style: TextStyle(color: Color.fromARGB(255, 108, 36, 250),fontSize: 20,fontWeight: FontWeight.bold),),
                  Text('\$$asset2',style: TextStyle(color: Color.fromARGB(255, 108, 36, 250),fontSize: 30),),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.cyan.shade100,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: Colors.green.shade600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Income',
                                        style: TextStyle(color: Colors.grey[800])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$$income2',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.cyan.shade100,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_downward,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Expense',
                                        style: TextStyle(color: Colors.grey[800])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$$expense2',
                                        style: TextStyle(
                                            color: Colors.grey[700],
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
            Expanded(
              child: ListView.builder(
                itemCount: items2.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> item = items2[index];
                  return ListTile(
                      title: Text(item['name']),
                      subtitle: Text(DateFormat.Md().format(DateTime.now())),
                      trailing: Text(item['amount'].toString()),
                      leading: item['isIncome']
                          ? Icon(Icons.arrow_upward,color:Colors.green.shade600,)
                          : Icon(Icons.arrow_downward,color:Color.fromARGB(
                          255, 232, 25, 25)),
                      onLongPress: () =>_removeItem(index)
                  );
                },
              ),
            ),
          ],
        ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(161, 186, 87, 243),
        onPressed: _showAddDialog,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
