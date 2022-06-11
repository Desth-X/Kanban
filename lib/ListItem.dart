import 'package:demo/main.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget{

  late MyHomePageState myHomePageState;
  late ListItemState listItemState;

  ListItem(MyHomePageState myHomePageState){
    this.myHomePageState = myHomePageState;
    this.listItemState = ListItemState(myHomePageState: this.myHomePageState);
  }

  @override
  State<ListItem> createState() => listItemState;

  void addItem(String task){
    listItemState.addItem(task);
  }
  

//  @override
  //State<ListItem> createState() => ListItemState(myHomePageState: this.myHomePageState);

  /*77
  MyHomePageState myHomePageState;

  //ListItem({required this.myHomePageState, Key? key}):super(key: key);  
 
  ListItemState listItemState = ListItemState(myHomePageState: myHomePageState);

  @override
  State<ListItem> createState() => ListItemState(myHomePageState: this.myHomePageState);

  void addItem(String task){

  }*/

}

class ListItemState  extends State<ListItem> {

  MyHomePageState myHomePageState;
  
  ListItemState({required this.myHomePageState}) : super();

  final List<String> tasks = ["Task1","Task2","Task3"];

  List<Widget> createRows(){
    return tasks.map((element) {
      return Container(
        margin: new EdgeInsets.only(top: 10, right: 10, bottom: 0, left: 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        padding: EdgeInsets.all(20),
        child: Row(children: [
        Text(element),
        Spacer(), 
        FlatButton(onPressed: (){}, child: Text('Acept', style: TextStyle(fontSize: 20.0))), 
        FlatButton(onPressed: (){removeItem(element);}, child: Text('Delete', style: TextStyle(fontSize: 20.0)))                       
      ]),
      );          
    }).toList();        
  }

  void removeItem(String task){
    tasks.remove(task);
    myHomePageState.sentItemToInProcess(task);
    setState((){});
  }

  void addItem(String task){
    tasks.add(task);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {    
    return ListView(      
      children: createRows(),
        
    );
  } 

}
