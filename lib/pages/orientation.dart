import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key}); // tambahan best practice

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orientation')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const <Widget>[
                OrientationLayoutIconsWidget(),
                Divider(),
                OrientationLayoutWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Ikon Orientation
class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation o = MediaQuery.of(context).orientation;

    if (o == Orientation.portrait) {
      return const Icon(Icons.school, size: 48.0);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.school, size: 48),
          Icon(Icons.brush, size: 48),
        ],
      );
    }
  }
}

// Layout Orientation
class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation o = MediaQuery.of(context).orientation;

    if (o == Orientation.portrait) {
      return Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        width: 100.0,
        child: const Text('Portrait'),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        color: Colors.green,
        width: 200.0,
        child: const Text('Landscape'),
      );
    }
  }
}