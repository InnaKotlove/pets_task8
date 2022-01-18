import 'package:flutter/material.dart';
import 'package:pets_task8/detail_screen.dart';

enum GenderList { male, female }

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(title: const Text('Форма опросник')), body: MyForm())));

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool _agreement = false;
  bool _dryFood = false;
  bool _wetFood = false;
  bool _otherFood = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  const Text(
                    'a. Кличка питомца:',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextFormField(validator: (value) {
                    if (value!.isEmpty) return 'Пожалуйста введите кличку';
                  }),
                  const Text(
                    'b. Имя и контакты владельца:',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextFormField(validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пожалуйста введите свое имя и контактные данные';
                    }
                  }),
                  const SizedBox(height: 10.0),
                  const Text(
                    'c. Порода питомца:',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextFormField(validator: (value) {
                    if (value!.isEmpty) return 'Пожалуйста введите породу';
                  }),
                  const SizedBox(height: 10.0),
                  const Text(
                    'e. Самец или самка?:',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  RadioListTile(
                    title: const Text('Самец'),
                    value: GenderList.male,
                    groupValue: _gender,
                    onChanged: (GenderList? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Самка'),
                    value: GenderList.female,
                    groupValue: _gender,
                    onChanged: (GenderList? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  const Text(
                    'd. Чем питается ?:',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  CheckboxListTile(
                      value: _dryFood,
                      title: const Text('Сухой корм'),
                      onChanged: (bool? value) =>
                          setState(() => _dryFood = value ?? false)),
                  CheckboxListTile(
                      value: _wetFood,
                      title: const Text('Влажный корм'),
                      onChanged: (bool? value) =>
                          setState(() => _wetFood = value ?? false)),
                  CheckboxListTile(
                      value: _otherFood,
                      title: const Text('Натуральный корм'),
                      onChanged: (bool? value) =>
                          setState(() => _otherFood = value ?? false)),
                  const SizedBox(height: 10.0),
                  CheckboxListTile(
                      value: _agreement,
                      title: Text('f. Сохранить' +
                          (_gender == null
                              ? '()'
                              : _gender == GenderList.male
                                  ? ''
                                  : '') +
                          ''),
                      onChanged: (bool? value) =>
                          setState(() => _agreement = value!)),
                  const SizedBox(height: 10.0),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Color color = Colors.red;
                        String text;
                        bool isReady = false;

                        if (_gender == null) {
                          text = 'Нажмите сохранить для ввода данных';
                        } else if (_agreement == false) {
                          text = 'Необходимо сохранить форму';
                        } else {
                          text = 'Форма успешно заполнена';
                          color = Colors.green;
                          isReady = true;
                        }

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(text),
                          backgroundColor: color,
                        ));

                        if (isReady) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return DetailScreen();
                            }),
                          );
                        }
                      }
                    },
                    child: Text('Проверить'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  TextButton(
                    child: Text('Форма заполнена'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return DetailScreen();
                        }),
                      );
                    },
                  )
                ]))));
  }
}
