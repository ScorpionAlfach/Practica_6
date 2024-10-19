import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _patronymicController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String _profileImagePath = 'assets/images/enot.png';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Здесь можно добавить выбор фото
            },
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(_profileImagePath),
            ),
          ),
          SizedBox(height: 20),
          Text('Имя: ${_nameController.text.isNotEmpty ? _nameController.text : 'Имя'}'),
          Text('Фамилия: ${_surnameController.text.isNotEmpty ? _surnameController.text : 'Фамилия'}'),
          Text('Отчество: ${_patronymicController.text.isNotEmpty ? _patronymicController.text : 'Отчество'}'),
          Text('Электронная почта: ${_emailController.text.isNotEmpty ? _emailController.text : 'Почта'}'),
          Text('Телефон: ${_phoneController.text.isNotEmpty ? _phoneController.text : 'Номер телефона'}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final updatedData = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(
                    nameController: _nameController,
                    surnameController: _surnameController,
                    patronymicController: _patronymicController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                  ),
                ),
              );

              if (updatedData != null) {
                setState(() {
                  _nameController.text = updatedData['name'];
                  _surnameController.text = updatedData['surname'];
                  _patronymicController.text = updatedData['patronymic'];
                  _emailController.text = updatedData['email'];
                  _phoneController.text = updatedData['phone'];
                });
              }
            },
            child: Text('Изменить'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _patronymicController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
