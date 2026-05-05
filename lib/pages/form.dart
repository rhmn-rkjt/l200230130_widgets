import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Order {
  String? item;
  int? quantity;
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  Order order = Order();

  void _submitOrder() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Order: ${order.item}, Qty: ${order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Validation')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Espresso',
                  labelText: 'Item',
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? 'At least one item Required' : null,
                onSaved: (v) => order.item = v,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '3',
                  labelText: 'Quantity',
                ),
                validator: (v) {
                  int? q = int.tryParse(v ?? '');
                  return (q == null || q <= 0)
                      ? 'Quantity must be > 0'
                      : null;
                },
                onSaved: (v) =>
                    order.quantity = int.tryParse(v ?? ''),
              ),
              Divider(height: 32.0),
              ElevatedButton(
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                ),
                onPressed: _submitOrder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}