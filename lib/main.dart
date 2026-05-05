import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: Home(),
    );
  }
}

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem({required this.title, required this.icon});
}

List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(
    title: 'Fast Food',
    icon: Icon(Icons.fastfood),
  ),
  TodoMenuItem(
    title: 'Flight',
    icon: Icon(Icons.flight),
  ),
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75,
            color: Colors.white70,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: Container(
            height: 75,
            color: Colors.lightGreen.shade100,
            child: Center(
              child: Text('Bottom'),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 10)
                    ],
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Flutter World',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.purple,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                            text: ' Mobile',
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Column, Row
                Column(
                  children: [
                    Text('Col 1'),
                    Text('Col 2'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Row 1'),
                        Text('Row 2'),
                        Text('Row 3'),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Flat Buttons versi terbaru Flutter jadi Text Button
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Flag'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Icon(Icons.flag),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),

                // RaisedButton versi terbaru Flutter jadi ElevatedButton
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.save),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),

                // IconButton
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.flight),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.flight),
                      iconSize: 42,
                      color: Colors.teal,
                      tooltip: 'Flight',
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // PopupMenuButton
                PopupMenuButton<TodoMenuItem>(
                  icon: Icon(Icons.view_list),
                  onSelected: (val) {
                    print(val.title);
                  },
                  itemBuilder: (context) {
                    return foodMenuList.map((item) {
                      return PopupMenuItem<TodoMenuItem>(
                        value: item,
                        child: Row(
                          children: [
                            Icon(item.icon.icon),
                            Padding(
                              padding: EdgeInsets.all(8),
                            ),
                            Text(item.title),
                          ],
                        ),
                      );
                    }).toList();
                  },
                ),

                SizedBox(height: 20),

                // Button Bar
                Container(
                  color: Colors.white70,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.map),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.airport_shuttle),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.brush),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
      ),

      // Bottom Bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(padding: EdgeInsets.all(32.0)),
          ],
        ),
      ),
    );
  }
}