import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 78, 188, 54)),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  TextEditingController _samp = TextEditingController();
  TextEditingController _sam = new TextEditingController();
  List<String> todos = [];
  List<int> todosinput = [];

  List<TextEditingController> controllerStore = [];


  Widget textfielder(int index, label) {
    return TextField(
      controller: controllerStore[index],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
    );
  }

  TextEditingController uniqueTextController() {
    return TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _samp,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "hello",
                      ),
                    )
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todos.add(_samp.text);
                  todosinput.add(1);
                  
                  controllerStore.add(uniqueTextController());
                  _samp.clear();
                });
              },
              child: const Text('Add'),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          title: Text(todos[index]),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todosinput.length,
                      itemBuilder: (BuildContext context, index){
                        return Expanded(child: textfielder(controllerStore.length -1, "Enter"));
                      }
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
