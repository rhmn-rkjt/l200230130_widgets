import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Images')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Row: 2 gambar + 1 ikon
                Row(children: <Widget>[
                  Image(image: AssetImage('assets/images/logo.jpg'),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * 0.3),
                  Image.network('https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                    width: MediaQuery.of(context).size.width * 0.3),
                  Icon(Icons.brush, color: Colors.lightBlue, size: 48.0),
                ]),
                // Container dengan BoxDecoration
                Container(
                  height: 100, width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                    boxShadow: [BoxShadow(color:Colors.grey, blurRadius:10)]),
                ),
                // TextField dengan InputDecoration
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder()),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your notes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
