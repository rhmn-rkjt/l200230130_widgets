import 'package:flutter/material.dart';

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem({required this.title, required this.icon});
}

List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: 'Fast Food', icon: Icon(Icons.fastfood)),
  TodoMenuItem(title: 'Flight', icon: Icon(Icons.flight)),
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
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        flexibleSpace: SafeArea(
          child: Icon(Icons.photo_camera, size: 75, color: Colors.white70),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: Container(
            height: 75,
            color: Colors.lightGreen.shade100,
            child: Center(child: Text('Bottom')),
          ),
        ),
      ),

      // ================= BODY =================
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                // ================= DEMO 1 =================
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

                // TextButton
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

                // ElevatedButton
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

                // Popup Menu
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
                            SizedBox(width: 8),
                            Text(item.title),
                          ],
                        ),
                      );
                    }).toList();
                  },
                ),

                SizedBox(height: 20),

                // ButtonBar
                Container(
                  color: Colors.white70,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: Icon(Icons.map), onPressed: () {}),
                      IconButton(icon: Icon(Icons.airport_shuttle), onPressed: () {}),
                      IconButton(icon: Icon(Icons.brush), onPressed: () {}),
                    ],
                  ),
                ),

                // ================= DEMO 3 (IMAGES + FORM) =================
                SizedBox(height: 20),

                Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/logo.jpg'),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Icon(Icons.brush, color: Colors.lightBlue, size: 48.0),
                  ],
                ),

                SizedBox(height: 20),

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
                ),

                SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Notes',
                    labelStyle: TextStyle(color: Colors.purple),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your notes'),
                ),

              ],
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
      ),

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