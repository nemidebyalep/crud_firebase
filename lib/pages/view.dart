import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/database.dart';

class View extends StatefulWidget {
  View({Key key, this.country, this.db}) : super(key: key);
  Map country;
  Database db;
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print(widget.country);
    nameController.text = widget.country['name'];
    codeController.text = widget.country['code'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/loli.jpg')
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white12,
          title: Text("Actualizar Pais"),
          actions: [
            IconButton(
              color: Colors.white,
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.db.delete(widget.country["id"]);
                  Navigator.pop(context, true);
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: inputDecoration("nombre"),
                  controller: nameController,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: inputDecoration("Codigo"),
                  controller: codeController,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 70, vertical: 130),
          color: Colors.transparent,
          child: BottomAppBar(
            color: Colors.transparent,
            child: RaisedButton(
                color: Colors.yellow[100],
                onPressed: () {
                  widget.db.update(widget.country['id'], nameController.text,
                      codeController.text);
                  Navigator.pop(context, true);
                },
                child: Text(
                  "Guardar Cambio",
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    
    return InputDecoration(

      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.yellow[100],
          width: 4.0,
        ),
      ),
    );
  }
}
