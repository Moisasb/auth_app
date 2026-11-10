import 'package:auth_app/widgets/auth_text_field.dart';
import 'package:auth_app/widgets/screen/cadastro_screen.dart';
import 'package:auth_app/widgets/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'cadastro_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _mostrarAviso() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login será implementado na próxima aula')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth - Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField(controller: _emailController, label: 'E-mail'),

            const SizedBox(height: 12),

            AuthTextField(
              controller: _senhaController,
              label: 'Senha',
              obscureText: true,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _mostrarAviso,
              child: const Text('Entrar'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CadastroScreen(),
                  ),
                );
              },
              child: const Text('Criar conta'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                context, 
                MaterialPageRoute(builder: (_) => const
                HomeScreen()),
                );
              }, 
              child: const Text('Visualizar Home (Protótipo)')
            ),
          ],
        ),
      ),
    );
  }
}