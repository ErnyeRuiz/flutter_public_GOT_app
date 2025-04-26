import 'package:flutter/material.dart';
import 'package:my_app/models/usuarios/login.model.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/services/usuarios.service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>{
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;  

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final currentContext = context;
    final scaffoldMessenger = ScaffoldMessenger.of(currentContext);
    final navigator = Navigator.of(currentContext);

    setState(() => _isLoading = true);

    try{
      final usuarioService = context.read<UsuariosService>();
      final Login login = Login(
        username: _usernameController.text.trim(), 
        password: _passwordController.text.trim()
      );

     final response = await usuarioService.login(login);

      if (!mounted) return;

      if(response != null){
        navigator.pushReplacementNamed('/home');
      }else{
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Credenciales incorrectas')),
        );
      }
    }catch(e){
       if (!mounted) return;
        scaffoldMessenger.showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // ← Esto elimina las tres líneas
        title: Text('Iniciar sesión')
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Ingrese un usuario';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,                         
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null: _submit,
                  child: 
                    _isLoading ?
                    const CircularProgressIndicator() :
                    const Text('Ingresar'),
                  )
              )            
            ],
          ))
        )
    );
  }
}