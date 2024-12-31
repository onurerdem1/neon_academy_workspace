import 'package:flutter/material.dart';
import 'db_helper.dart';

class PeopleFormScreen extends StatefulWidget {
  @override
  _PeopleFormScreenState createState() => _PeopleFormScreenState();
}

class _PeopleFormScreenState extends State<PeopleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();

  List<Map<String, dynamic>> _people = [];

  @override
  void initState() {
    super.initState();
    _loadPeople();
  }

  Future<void> _loadPeople() async {
    final people = await DBHelper().getAllPeople();
    setState(() {
      _people = people;
    });
  }

  Future<void> _savePerson() async {
    if (_formKey.currentState!.validate()) {
      final person = {
        'name': _nameController.text,
        'surname': _surnameController.text,
        'age': int.parse(_ageController.text),
        'email': _emailController.text,
      };

      await DBHelper().insertPerson(person);
      _nameController.clear();
      _surnameController.clear();
      _ageController.clear();
      _emailController.clear();

      _loadPeople();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asgard People Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter a name' : null,
                  ),
                  TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(labelText: 'Surname'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter a surname'
                        : null,
                  ),
                  TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter age' : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter email' : null,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _savePerson,
                    child: Text('Save Person'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _people.length,
                itemBuilder: (context, index) {
                  final person = _people[index];
                  return ListTile(
                    title: Text('${person['name']} ${person['surname']}'),
                    subtitle: Text(
                        'Age: ${person['age']}, Email: ${person['email']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
