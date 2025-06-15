import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final userController = TextEditingController(text: 'Hello');
  final passwordController = TextEditingController(text: '123456');
  bool obscureText = true;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Custom Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userController,
              decoration: InputDecoration(
                labelText: 'User Name',
                hintText: 'Please Enter Your User Name',
                border: OutlineInputBorder(),
              ),
              focusNode: myFocusNode,
            ),
            TextField(
              autofocus: true,
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Please Enter Your Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(userController.text),
                    Text(passwordController.text),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Show me Text',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
