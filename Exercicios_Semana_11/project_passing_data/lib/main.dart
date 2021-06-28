import 'package:flutter/material.dart';


class Todo {
  final String title;
  final String description;

  Todo(this.title, this. description);
}

void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: TodosScreen(
      todos: List.generate(
        20, (i) =>Todo('Todo $i', 'A rule of the world for the Todo $i')
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }  
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(todos[index].title),

            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  settings: RouteSettings(
                    arguments: todos[index]
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context).settings.arguments as Todo;
  
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}


// class DetailScreen extends StatelessWidget {
//   final Todo todo;

//   DetailScreen({Key key, this.todo}) : super(key: key);

//   @override

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(todo.title),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Text(todo.description),
//       ),
//     );
//   }
// }




