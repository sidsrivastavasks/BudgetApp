import 'package:flutter/material.dart';
import 'addScreen.dart';
import 'myNotes.dart';

class NoteData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteDataState();
  }
}

class NoteDataState extends State<NoteData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getNoteDataView(),
    );
  }

  ListView getNoteDataView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: noteList.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.lightBlue[50],
          elevation: 2.0,
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(
              "${noteList[position].Name}",
              style: textStyle,
            ),
            subtitle: Text("${noteList[position].Amount}", style: textStyle),
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
                    var myInt = int.parse('${noteList[position].Amount}');
                    assert(myInt is int);
                    myBudget -= myInt;
                    myIncome -= myInt;
                    noteList.removeAt(position);
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
                          position, noteList[position], "Edit Data");
                    }));
                  },
                ),
              ],
            ),
            onTap: () {
              debugPrint('ListTile Tapped');
              edit = true;
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddScreen(position, noteList[position], "Edit Data");
              }));
            },
          ),
        );
      },
    );
  }
}
