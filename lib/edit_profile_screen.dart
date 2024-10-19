import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController patronymicController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  EditProfileScreen({
    required this.nameController,
    required this.surnameController,
    required this.patronymicController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактировать профиль'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            TextField(
              controller: surnameController,
              decoration: InputDecoration(labelText: 'Фамилия'),
            ),
            TextField(
              controller: patronymicController,
              decoration: InputDecoration(labelText: 'Отчество'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Электронная почта'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Телефон'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'surname': surnameController.text,
                  'patronymic': patronymicController.text,
                  'email': emailController.text,
                  'phone': phoneController.text,
                });
              },
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
