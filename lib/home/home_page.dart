import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              _buttonCard(
                onTap: () {
                  Navigator.of(context).pushNamed('/bloc/example');
                },
                label: 'Example',
              ),
              _buttonCard(
                  onTap: () {
                    Navigator.of(context).pushNamed('/bloc/example/freezed');
                  },
                  label: 'Example Freezed'),
              _buttonCard(
                  onTap: () {
                    Navigator.of(context).pushNamed('/contacts/list');
                  },
                  label: 'Contatos'),
              _buttonCard(
                  onTap: () {
                    Navigator.of(context).pushNamed('/contacts/cubit/list');
                  },
                  label: 'Contact Cubit'),
            ],
          ),
        ),
      ),
    );
  }

  _buttonCard({
    required void Function() onTap,
    required String label,
  }) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Card(
        child: TextButton(
          onPressed: onTap,
          child: Text(label),
        ),
      ),
    );
  }
}
