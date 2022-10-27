import 'package:flutter/material.dart';
import 'package:mini_project_1/menu.dart';

class TodoApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo List',
      home: new TodoList(),
    );
  }
}

class TodoList extends StatefulWidget{

  @override 
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override 
  Widget build(BuildContext Context){
    return new Scaffold(
      drawer: menuDrawer(),
      appBar: new AppBar(
        title: new Text('Todo List',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo){
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChanged,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'add',
        backgroundColor: Colors.red,
        child: Icon(Icons.add)),
    );
  }

  Future<void> _displayDialog() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Add New Item'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              labelText: 'Todo',
              prefixIcon: Icon(Icons.task),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              )),

          ),
          actions: <Widget>[
            TextButton(
              child: const Text('add'),
              onPressed: (){
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            )
          ],
        );
      }
    );
  }

  void _addTodoItem(String name){
    setState((){
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  void _handleTodoChanged(Todo todo){
    setState((){
      todo.checked = !todo.checked;
    });
  }
}

class Todo{
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

class TodoItem extends StatelessWidget{
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked){
    if(! checked) return null;

    return TextStyle(
      color: Colors.black,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override 
  Widget build(BuildContext context){
    return ListTile(
      onTap: (){
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(todo.name[0], style: TextStyle(color: Colors.white),),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}