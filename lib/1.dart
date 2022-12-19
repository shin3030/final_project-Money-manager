import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:untitled/counting.dart';
import 'color.dart';
import 'counting.dart';


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
      home: JanuaryPage(title:'1月'),
    );
  }
}

class JanuaryPage extends StatefulWidget {
  JanuaryPage({Key? key,required this.title}) : super(key:key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<JanuaryPage> {
  bool _seletincome=false;


  void changeBackground() {
    setState(() {

      backgroundnum1= (backgroundnum1 + 1) % backgrounds.length;
    });
  }





  void _addItem(String name, int amount, bool isIncome) {
    setState(() {
      if (isIncome) {
        income1 += amount;
        total_income+=amount;
      } else {
        expense1 += amount;
        total_expense+=amount;
      }
      asset1 = income1 - expense1;
      items1.add({
        'name': name,
        'amount':amount,
        'isIncome': isIncome,
      });
    });

  }

  void _removeItem(int index) {
    setState(() {
      Map<String, dynamic> item = items1[index];
      int a1=item['amount'];

      if (item['isIncome']) {
        income1 -= a1;
        total_income-=a1;
      } else {
        expense1 -= a1;
        total_expense-=a1;
      }
      asset1 = income1 - expense1;
      items1.removeAt(index);

    });
  }


@override
  void _showAddDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
        return AlertDialog(
          title: Text('Add Item',),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Expense'),
                  Switch(
                    value:_seletincome,
                    onChanged: (Value) {
                      setState(() {
                        _seletincome =!_seletincome;
                      });}),
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
                    child: Text('Enter'),
                    onPressed: () {
                      _addItem(nameController.text, int.parse(amountController.text), _seletincome);
                      Navigator.of(context).pop();
                      nameController.text = '';
                      amountController.text = '';
                      if(_seletincome==true){
                        setState((){
                          _seletincome=false;
                        });
                      };

                    },
                  ),
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      setState((){_seletincome=false;});
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
    );
  });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1月',
          style:TextStyle(fontSize: 30) ,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: changeBackground,
          ),
        ],

      ),
      body:Container(
        decoration: backgrounds[backgroundnum1],
        child:Column(
          children: [
            SizedBox(width: 0,height: 20,),
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
                        color: Colors.red,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ]),
              width: 350,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Asset:',style: TextStyle(color: Colors.white,fontSize: 20),),
                  Text('\$$asset1',style: TextStyle(color: Colors.white,fontSize: 30),),
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
                                    color: Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_upward,
                                      color: Colors.green,
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
                                        style: TextStyle(color: Colors.grey[500])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$$income1',
                                        style: TextStyle(
                                            color: Colors.grey[600],
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
                                    color: Colors.grey[200],
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
                                        style: TextStyle(color: Colors.grey[500])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('\$$expense1',
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
            Expanded(
              child: ListView.builder(
                itemCount: items1.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> item = items1[index];
                  return ListTile(
                      title: Text(item['name']),
                      subtitle: Text(DateFormat.Md().format(DateTime.now())),
                      trailing: Text(item['amount'].toString()),
                      leading: item['isIncome']
                          ? Icon(Icons.arrow_upward,color:Colors.green,)
                          : Icon(Icons.arrow_downward,color:Colors.red),
                      onLongPress: () =>_removeItem(index)
                  );
                },
              ),
            ),
          ],
        ),),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
