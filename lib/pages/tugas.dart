import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Pop Up Menu Item
class MenuItem {
  final String title;
  final IconData icon;

  MenuItem(this.title, this.icon);
}

final List<MenuItem> menuItems = [
  MenuItem('Home', Icons.home),
  MenuItem('Profile', Icons.person),
  MenuItem('Settings', Icons.settings),
  MenuItem('Logout', Icons.logout),
];

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    Orientation o = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Tugas 4 Pertemuan 8'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<MenuItem>(
            onSelected: (item) {
              debugPrint(item.title);
            },
            itemBuilder: (context) {
              return menuItems.map((item) {
                return PopupMenuItem<MenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon),
                      const SizedBox(width: 10),
                      Text(item.title),
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  'Container BoxDecoration',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Flutter ',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: 'is ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'Awesome!',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [

                  // Name
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Name wajib diisi' : null,
                    onSaved: (v) => name = v,
                  ),

                  // Email
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (v) =>
                        v != null && v.contains('@')
                            ? null
                            : 'Email tidak valid',
                    onSaved: (v) => email = v,
                  ),

                  // Password
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (v) =>
                        v != null && v.length >= 6
                            ? null
                            : 'Minimal 6 karakter',
                    onSaved: (v) => password = v,
                  ),

                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        debugPrint('$name | $email | $password');
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            GridView.count(
              crossAxisCount: o == Orientation.portrait ? 2 : 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(8, (index) {
                return Card(
                  color: Colors.lightGreen,
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}