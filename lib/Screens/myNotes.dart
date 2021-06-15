List<Note> noteList = [];
List<Note> noteListExpense = [];
int count = 1;
bool edit = false;
var myIncome = 0;
var myExpense = 0;
var myBudget = 0;

class Note {
  // ignore: non_constant_identifier_names
  String Name;
  // ignore: non_constant_identifier_names
  String Amount;

  Note(this.Name, this.Amount);
}
