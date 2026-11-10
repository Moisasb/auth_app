import 'package:auth_app/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmacaoController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _confirmacaoController.dispose();
    super.dispose();
  }

  void _AvisarCadastroFuturo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cadastro será finalizado na próxima aulas'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField(
              controller: _emailController,
              label: 'E-mail',
            ),

            const SizedBox(height: 12),

            AuthTextField(
              controller: _senhaController,
              label: 'Senha',
            ),

            AuthTextField(
              controller: _confirmacaoController,
              label: 'Confirmar Senha',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _AvisarCadastroFuturo,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}