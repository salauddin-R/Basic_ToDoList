import 'package:basic_to_do_list/decoration.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
  
}

class MyHomePageState extends State<MyHomePage>
{
  final TextEditingController _controller=TextEditingController();
  List toDoList=[];
  String item="";
  addItem(value)
  {
    setState(() {
      item=value;
    });
  }
 myInputOnChange(){
  setState(() {
    toDoList.add({"item":item});
    _controller.clear(); 
  });
 }
 removeItem(index)
 {
  setState(() {
    toDoList.removeAt(index);
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded( 
                    flex: 50,
                    child: TextField(
                      controller: _controller,
                      onChanged: (value){
                        addItem(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    )),
                    SizedBox(width: 5,),
                  Expanded(
                    flex: 15,
                    child: ElevatedButton(onPressed: (){
                      myInputOnChange();
                    },
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.green,
                    minimumSize: Size(30, 60)
                    ) ,
                     child:Text("Add",style: TextStyle(
                      fontSize: 20,color: Colors.black,
                      fontWeight: FontWeight.w900
                     ),)
                     ),
                  )
                ],
              )
              ),
      
      
            Expanded(
              flex: 90,
              child:ListView.builder(
                itemCount:toDoList.length ,
                itemBuilder: (context,index){
                  return Card(
                    child:sizedBox50(
                      Row(
                        children: [
                          Expanded(flex:80,child:
                          Text(toDoList[index]["item"])),

                          Expanded(flex:20,child:TextButton(onPressed:(){
                            removeItem(index);
                          }, child:Icon(Icons.delete)))
                        ],
                      )
                    ),
                  );
                })
              ),
          ],
        ),
      ),
    );
  }
  
}