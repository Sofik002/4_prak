import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.amber,
  ),
  home: const UserPanel(),
));

class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("4 практическая работа"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
      ),
      body:  SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children:[
                const Padding(padding: EdgeInsets.only(top: 40),),
                ElevatedButton(child: const Text("ListView.builder"),onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const Home()));},),
                const Padding(padding: EdgeInsets.only(top: 40),),
                ElevatedButton(child: const Text("Column"),onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const NewWindow()));},),
                const Padding(padding: EdgeInsets.only(top: 40),),
                ElevatedButton(child: const Text("ListView.Separated"),onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const Skrin()));},),
              ],
            )
          ],
        ),
      ),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String vVod;
  List myList = [];

  @override
  void initState() {
    super.initState();
    
    myList.addAll(['почитать','помыть посуду','спорт']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: ListView.builder(
        itemCount: myList.length,//количество переменных
        itemBuilder:(BuildContext context, int index){//как список будет построен
          return Dismissible(
              key: Key(myList[index]),
              child: Card(
                child: ListTile(
                  title: Text(myList[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.blueGrey[200]
                    ),
                    onPressed:(){
                      setState(() {
                        myList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction){
                setState(() {//чтобы контролировать сотояния
                  myList.removeAt(index);
                });
              },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[200],
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('Добавить задачу'),
              content: TextField(
                onChanged: (String value){
                  vVod = value;
                },
              ),
              actions: [ //позволяет добавить кнопки в вспылвающее окно
                ElevatedButton(onPressed: (){
                  setState(() {
                    myList.add(vVod);
                  });
                  Navigator.of(context).pop();//закрываем диалоговое окно
                }, child: Text('Добавить'))
              ],
            );
          });

        },
        child: Icon(
          Icons.add_box,
          color: Colors.blueGrey.shade200
        )
      ),
    );
  }
}

class NewWindow extends StatefulWidget {
  const NewWindow({super.key});

  @override
  State<NewWindow> createState() => _NewWindowState();
}

class _NewWindowState extends State<NewWindow> {

  late String type;
  List newMyList = [];

  void initState() {
    super.initState();

    newMyList.addAll(['почитать','помыть посуду','спорт']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
                children: newMyList.map((item) => GestureDetector(
                  key: ValueKey(item),
                  onTap: () => setState(()=>newMyList.remove(item)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(item),
                  ),
                )).toList()
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[200],
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить задачу'),
                content: TextField(
                  onChanged: (String value) {
                    type = value;
                  },
                ),
                actions: [ //позволяет добавить кнопки в вспылвающее окно
                  ElevatedButton(onPressed: () {
                    setState(() {
                      newMyList.add(type);
                    });
                    Navigator.of(context).pop(); //закрываем диалоговое окно
                  }, child: Text('Добавить'))
                ],
              );
            });
          },
          child: Icon(
              Icons.add_box,
              color: Colors.blueGrey.shade200
          )
      ),
    );
  }
}

class Skrin extends StatefulWidget {
  const Skrin({super.key});

  @override
  State<Skrin> createState() => _SkrinState();
}

class _SkrinState extends State<Skrin> {


  late String newType;
  List newMySecondList = [];

  void initState() {
    super.initState();

    newMySecondList.addAll(['почитать','помыть посуду','спорт']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: ListView.separated(
          itemCount: newMySecondList.length,//количество переменных
          itemBuilder:(BuildContext context, int index){//как список будет построен
            return Dismissible(
              key: Key(newMySecondList[index]),
              child: Card(
                child: ListTile(
                  title: Text(newMySecondList[index]),
                  trailing: IconButton(
                    icon: Icon(
                        Icons.delete,
                        color: Colors.blueGrey[200]
                    ),
                    onPressed:(){
                      setState(() {
                        newMySecondList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction){
                setState(() {//чтобы контролировать сотояния
                  newMySecondList.removeAt(index);
                });
              },
            );
          }, separatorBuilder:(_,__)=> const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[200],
          onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text('Добавить задачу'),
                content: TextField(
                  onChanged: (String value){
                    newType = value;
                  },
                ),
                actions: [ //позволяет добавить кнопки в вспылвающее окно
                  ElevatedButton(onPressed: (){
                    setState(() {
                      newMySecondList.add(newType);
                    });
                    Navigator.of(context).pop();//закрываем диалоговое окно
                  }, child: Text('Добавить'))
                ],
              );
            });

          },
          child: Icon(
              Icons.add_box,
              color: Colors.blueGrey.shade200
          )
      ),
    );

  }
}


