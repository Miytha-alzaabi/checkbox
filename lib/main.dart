import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;

  var _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   children: [
      //     CheckboxListTile(
      //       title: Text("Is Here"),
      //       selectedTileColor: Colors.cyan,
      //       selected: isChecked,
      //       value: isChecked,
      //        onChanged: (value){
      //         isChecked = value ?? false;
      //         setState(() {
                
      //         }
      //         );
      //        }
             
      //        )
      //   ],
      // ),

      body: Form(
        key: _key,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty || value == null){
                    return "Email Can't Be Empty";
                  }else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value))
                  {
                    return "Email is Not Correct";
                  }
                },
                decoration: InputDecoration(
                  labelText: "Email Can't Be Empty"
                ),

              ),
              ElevatedButton(
                onPressed: (){
                  _key.currentState!.validate();
                },
               child: Text("Forget {assword}")
               )
            ],
          ),
        ),
      ),
    );
  }
}