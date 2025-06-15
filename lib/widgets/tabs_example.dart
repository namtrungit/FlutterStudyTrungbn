import 'package:flutter/material.dart';

class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tabs Example'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_boat)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_boat),
            ],
          ),
        ),
      ),
    );
  }
}
