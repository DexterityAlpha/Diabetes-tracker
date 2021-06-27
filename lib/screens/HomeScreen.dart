import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(Icons.notes),
            onPressed: () {
              return Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [],
      ),
    );
  }
}
