import 'package:flutter/material.dart';
import 'addScreen.dart';
import 'myNotes.dart';

class NoteDataExp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteDataExpState();
  }
}

class NoteDataExpState extends State<NoteDataExp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getNoteDataView(),
    );
  }

  ListView getNoteDataView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: noteListExpense.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(
              "${noteListExpense[position].Name}",
              style: textStyle,
            ),
            subtitle:
                Text("${noteListExpense[position].Amount}", style: textStyle),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 20.0,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    var myInt =
                        int.parse('${noteListExpense[position].Amount}');
                    assert(myInt is int);
                    myBudget += myInt;
                    myExpense -= myInt;
                    noteListExpense.removeAt(position);
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 20.0,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    //navigate(this.noteList[position], 'Edit Note');
                    edit = true;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddScreen(
                          position, noteListExpense[position], "Edit Data");
                    }));
                  },
                ),
              ],
            ),
            onTap: () {
              debugPrint('ListTile Tapped');
              edit = true;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddScreen(
                    position, noteListExpense[position], "Edit Data");
              }));
            },
          ),
        );
      },
    );
  }
}
