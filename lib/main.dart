import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo - Kanban'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  
  int intPendientes = 0;
  int intEnCurso = 0;
  int intFinalizadas = 0;
  int _selectedIndex = 0;
  int _counter = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Tareas Pendientes',
      style: optionStyle,
    ),
    Text(
      'Tareas en Curso',
      style: optionStyle,
    ),
    Text(
      'Tareas Finalizadas',
      style: optionStyle,
    ),
  ];

  void _incrementCounter() {
    setState(() {
      if(_selectedIndex == 0){
        intPendientes++;
      } else if(_selectedIndex == 1){
        intEnCurso++;
      } else {
        intFinalizadas++;
      }
      setUpCounter();
    });
  }

  void setUpCounter(){
    if(_selectedIndex == 0){
        _counter = intPendientes;
      } else if(_selectedIndex == 1){
        _counter = intEnCurso;
      } else {
        _counter = intFinalizadas;
      }    
  }

  String getNombreFragmento(){
    if(_selectedIndex == 0){
      return "pendientes";
    } else if(_selectedIndex == 1){
      return "en curso";
    } else {
      return "finalizadas";
    }       
  }

  Future<void> _saludar() async {
    _incrementCounter();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('This is a demo alert dialog.'),
                // Text('Would you like to approve of this message?'),
                Text('El contador para la seccion de tareas '+ getNombreFragmento() +': ' + '$_counter'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      setUpCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saludar,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank ),
            label: 'Pendiente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'En Curso',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Hecho',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 132, 255),
        onTap: _onItemTapped,
      ),
    );
    
  
  
  }
}


