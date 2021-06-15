import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'myNotes.dart';

String title = "";
String amount = "";

class AddScreen extends StatefulWidget {
  String appBarTitle;
  Note note;
  int position;
  AddScreen(this.position, this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return AddScreenState(this.position, this.note, this.appBarTitle);
  }
}

class AddScreenState extends State<AddScreen> {
  static var _source = ['Income', 'Expense'];

  String appBarTitle;
  Note note;
  int position;

  AddScreenState(this.position, this.note, this.appBarTitle);
  var _currentItemSelected = 'Income';
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.Name;
    amountController.text = note.Amount;
    titleController.selection = TextSelection.fromPosition(
        TextPosition(offset: titleController.text.length));

    amountController.selection = TextSelection.fromPosition(
        TextPosition(offset: amountController.text.length));
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.indigo[800],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton<String>(
                items: _source.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValSel) {
                  setState(() {
                    this._currentItemSelected = newValSel;

                    debugPrint('$newValSel');
                  });
                },
                value: _currentItemSelected,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('$value');
                  // title = value;
                  setState(() {
                    //title = titleController.text;
                    note.Name = titleController.text;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('$value');
                  amount = value;
                  setState(() {
                    //amount = amountController.text;
                    note.Amount = amountController.text;
                    // if (_currentItemSelected == "Income") {
                    //   var myInt = int.parse('${value}');
                    //   assert(myInt is int);
                    //   myIncome = myIncome + myInt;
                    // } else {
                    //   var myInt = int.parse('${value}');
                    //   assert(myInt is int);
                    //   myExpense = myExpense + myInt;
                    // }
                    // myBudget = myIncome + myExpense;

                    debugPrint("$myIncome");
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Enter Amount',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Padding(
                padding: EdgeInsets.only(right: 80.0, left: 80.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white12)),
                  child: Text('Submit'),
                  textColor: Colors.white,
                  color: Colors.indigo[800],
                  elevation: 8.0,
                  onPressed: () {
                    setState(() {
                      if (_currentItemSelected == "Income") {
                        if (!edit) {
                          noteList.add(note);
                          var myInt = int.parse('${note.Amount}');
                          assert(myInt is int);
                          myIncome += myInt;
                        } else {
                          var myInt = int.parse('${note.Amount}');
                          assert(myInt is int);
                          var myInt1 =
                              int.parse('${noteList[position].Amount}');
                          assert(myInt1 is int);
                          myIncome -= myInt1;
                          myIncome += myInt;
                          noteList[position] = note;
                        }
                      } else {
                        if (!edit) {
                          noteListExpense.add(note);
                          var myInt = int.parse('${note.Amount}');
                          assert(myInt is int);
                          myExpense += myInt;
                        } else {
                          var myInt = int.parse('${note.Amount}');
                          assert(myInt is int);
                          var myInt1 =
                              int.parse('${noteListExpense[position].Amount}');
                          assert(myInt1 is int);
                          myExpense -= myInt1;
                          myExpense += myInt;
                          noteListExpense[position] = note;
                        }
                      }
                      // if (_currentItemSelected == "Income") {
                      //   var myInt = int.parse('${note.Amount}');
                      //   assert(myInt is int);
                      //   myIncome = myIncome + myInt;
                      // } else {
                      //   var myInt = int.parse('${note.Amount}');
                      //   assert(myInt is int);
                      //   myExpense = myExpense + myInt;
                      // }
                      myBudget = myIncome - (myExpense);
                      edit = false;
                      count++;
                    });
                    moveToLastScreen();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
    setState(() {});
  }
}
