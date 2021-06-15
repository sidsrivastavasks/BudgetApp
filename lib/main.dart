import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'Screens/addScreen.dart';
import 'Screens/myNotes.dart';
import 'Screens/noteAdd.dart';
import 'Screens/noteExp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BudgetApp',
        home: HomeScreen());
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String res = '0';

  var Income = 0;
  double prcntg = 11.0;
  @override
  void initState() {
    setState(() {
      Income = myIncome;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;

    return Scaffold(
      backgroundColor: Colors.indigo[800],
      appBar: AppBar(
        title: Text('BudgetApp'),
        backgroundColor: Colors.indigo[800],
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Balance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                "$myBudget",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Income",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),

                            Text(
                              "$myIncome",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                              ),
                            ),
                            //update();
                          ],
                        ),
                        Column(
                          children: [
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 10.0,
                              animation: true,
                              percent: (myBudget) >= 0
                                  ? (myBudget) >= 100
                                      ? 1
                                      : myBudget / 100
                                  : 0,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.red,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Expense",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "$myExpense",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.indigo[800]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // alignment: Alignment.center,
                // margin: EdgeInsets.all(0.0),
                //color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),

                child: ContainedTabBarView(
                  tabs: [
                    Text(
                      'Income',
                      style: TextStyle(
                          color: Colors.indigo[700],
                          //fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Expense',
                      style: TextStyle(
                          color: Colors.indigo[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                  views: [
                    NoteData(),
                    NoteDataExp(),
                    //Text("Hello"),
                    //NoteData(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[800],
        foregroundColor: Colors.white,
        elevation: 5.0,
        //mini: true,
        onPressed: () {
          //debugPrint('Hello');
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddScreen(0, Note('', ''), "Add Data");
            }));
          });
          //Income += 10;

          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return AddScreen(0, Note('', ''), "Add Data");
          // }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
