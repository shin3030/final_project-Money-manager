import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      home: MarchPage(title:'3月'),
    );
  }
}

class MarchPage extends StatefulWidget {
  MarchPage({Key? key,required this.title}) : super(key:key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MarchPage> {
  bool seletincome=false;


  void changeBackground() {
    setState(() {
      backgroundnum3 = (backgroundnum3 + 1) % backgrounds.length;
    });
  }



  void _addItem(String name, int amount, bool isIncome) {
    setState(() {
      if (isIncome) {
        income3 += amount;
        total_income+=amount;
      } else {
        expense3 += amount;
        total_expense+=amount;
      }
      asset3 = income3 - expense3;
      items3.add({
        'name': name,
        'amount':amount,
        'isIncome': isIncome,
      });
    });
  }

  void _removeItem(int index) {

    setState(() {
      Map<String, dynamic> item = items3[index];
      int a1=item['amount'];
      if (item['isIncome']) {
        income3 -= a1;
        total_income-=a1;
      } else {
        expense3 -= a1;
        total_expense-=a1;
      }
      asset3 = income3 - expense3;
      items3.removeAt(index);

    });
  }



  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Expense'),
                  Switch(
                    value:seletincome,
                    onChanged: (newValue) {
                      setState(() {
                        seletincome =!seletincome;
                      });print(seletincome);
                    },
                  ),
                  Text('Income'),
                ],
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
                      _addItem(nameController.text, int.parse(amountController.text), seletincome);
                      Navigator.of(context).pop();
                      nameController.text = '';
                      amountController.text = '';
                    },
                  ),
                  ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: () {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
          style:TextStyle(fontSize: 30) ,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: changeBackground,
          ),
        ],

      ),
      body:Container(
        decoration: backgrounds[backgroundnum3],
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
                  Text('\$$asset3',style: TextStyle(color: Colors.white,fontSize: 30),),
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
                                    Text('\$$income3',
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
                                    Text('\$$expense3',
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
                itemCount: items3.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> item = items3[index];
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
