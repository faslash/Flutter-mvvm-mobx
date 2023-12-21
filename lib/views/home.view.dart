import 'package:flutter/material.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(store.picture),
              Text(store.name),
              Text(store.email)
            ],
          ),
        ));
  }
}
