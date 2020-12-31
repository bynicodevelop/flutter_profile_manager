import 'package:flutter/material.dart';
import 'package:flutter_profile_manager/flutter_profile_manager.dart';
import 'package:flutter_profile_manager/models/Field.dart';
import 'package:flutter_profile_manager/enums/TypeField.dart';
import 'package:flutter_mobile_camera/CameraBuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, FieldModel> _map = Map<String, FieldModel>();

  @override
  void initState() {
    super.initState();

    _map.addAll(
      {
        'avatarURL': FieldModel(
          id: 'avatarURL',
          icon: null,
          label: null,
          defaultValue: 'John Doe',
          value: 'https://picsum.photos/200',
          onUpdated: (value) => null,
          type: TypeField.AVATAR,
        ),
        'email': FieldModel(
          id: 'email',
          icon: Icons.email,
          label: 'Email',
          value: 'john.doe@domain.tld',
          onUpdated: (value) => null,
          type: TypeField.EMAIL,
          fieldPlaceholder: 'Enter your email',
        ),
        'username': FieldModel(
          id: 'username',
          icon: Icons.person,
          label: 'Username',
          value: 'john doe',
          onUpdated: (value) => null,
          fieldPlaceholder: 'Enter your username',
        ),
        'status': FieldModel(
          id: 'status',
          icon: Icons.info,
          label: 'About',
          value:
              'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire.',
          onUpdated: (value) => null,
          fieldPlaceholder: 'Enter your status',
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ProfileManager(
          onCancled: (FieldModel fieldMode) => null,
          onUpdated: (dynamic value, FieldModel fieldModel) {
            if (fieldModel.id != 'avatarURL') {
              _map[fieldModel.id].updateValue = value;
            } else {
              // Convert path to URL
            }

            setState(() => print('refresh view...'));
          },
          fields: _map.values.toList(),
        ),
      ),
    );
  }
}
