import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Форма успешно отправлена!'),
                TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black26)),
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          )])
      ),
    );
  }
}