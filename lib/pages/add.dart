import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/database.dart';

class Add extends StatefulWidget {
  Add({Key key, this.db}) : super(key: key);
  Database db;
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(
         // image: NetworkImage('https://static.wikia.nocookie.net/doblaje/images/a/aa/Pikachu_XY.png/revision/latest?cb=20161002184039&path-prefix=es')
        image: AssetImage('assets/dorado.jpg')
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text("Agregar Pais"),
          
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(70),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: inputDecoration("Nombre"),
                  controller: nameController,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: inputDecoration("Código"),
                  controller: codeController,
                ),
              ],
            ),
          ),
        ),
        
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 100),
          color: Colors.transparent,
          child: BottomAppBar(
            color: Colors.transparent,
            child: RaisedButton(
                color: Colors.purple[800],
                
                onPressed: () {
                  widget.db.create(nameController.text, codeController.text);
                  Navigator.pop(context, true);
                  
                },
                
                child: Text(
                  "Guardar",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.black,
      labelStyle: TextStyle(color: Colors.black),
      labelText: labelText,
      fillColor: Colors.amber,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.purple,
          width: 3.0,
        ),
      ),
    );
  }
}
