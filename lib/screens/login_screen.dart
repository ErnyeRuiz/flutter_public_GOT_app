import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>{
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _password = '';

  void _submit(){
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      if (_userName == 'amdin' && _password == '1234'){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Credenciales incorrectas')));
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar sesión')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) =>
                  value!.isEmpty ? 'Ingrese un usuario': null,        
                  onSaved: (value) => _userName = value!,          
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                  validator: (value) => 
                    value!.isEmpty ? 'Ingrese la contraseña': null,
                  onSaved: (value) => _password = value!,            
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _submit, child: Text('Ingresar'),
              )
            ],
          ))
        )
    );
  }
}