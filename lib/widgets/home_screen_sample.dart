import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: const Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Pick an option'),
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    print('Starting navigation...');
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );
    print('Navigation returned with result: $result');
    if (!context.mounted) {
      print('Context not mounted, returning early');
      return;
    }
    print('Showing snackbar with result: $result');
    try {
      final messenger = ScaffoldMessenger.of(context);
      messenger.removeCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          content: Text('You picked $result'),
          duration: const Duration(seconds: 3),
        ),
      );
      print('Snackbar should be displayed');
    } catch (e) {
      print('Error showing snackbar: $e');
    }
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick an option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print('Option 1 pressed, popping with "Option 1"');
                  Navigator.pop(context, 'Option 1');
                },
                child: const Text('Option 1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print('Option 2 pressed, popping with "Option 2"');
                  Navigator.pop(context, 'Option 2');
                },
                child: const Text('Option 2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
