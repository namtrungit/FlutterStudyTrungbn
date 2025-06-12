import 'package:flutter/material.dart';

class SwipToDismiss extends StatefulWidget {
  const SwipToDismiss({super.key});

  @override
  State<SwipToDismiss> createState() => _SwipToDismissState();
}

class _SwipToDismissState extends State<SwipToDismiss> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe to dismiss')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Dismissed $item'),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.green,
                ),
              );
            },
            background: Container(
              color: Colors.red[600],
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete),
            ),
            child: ListTile(title: Text(item)),
          );
        },
      ),
    );
  }
}
