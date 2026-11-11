import 'package:auth_app/services/auth_service.dart';
import 'package:auth_app/widgets/auth_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final _authService = AuthService();
  bool _carregando = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _confirmacaoController.dispose();
    super.dispose();
  }

  // void _AvisarCadastroFuturo() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Cadastro será finalizado na próxima aulas'),
  //     ),
  //   );
  // }

  void _avisar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  Future<void> _cadastrar() async {
    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();
    final confirmacao = _confirmacaoController.text.trim();

    if (email.isEmpty || senha.isEmpty || confirmacao.isEmpty) {
      _avisar('Prrencha todos os campos.');
      return;
    }

    if (senha != confirmacao) {
      _avisar('As senhas não coincidem.');
      return;
    }

    setState(() => _carregando = true);

    try {
      await _authService.cadastrar(
        email: email,
        senha: senha,
      );

      if (!mounted) return;

      _avisar('Conta criada com sucesso!');
      Navigator.pop(context);
    } on FirebaseAuthException catch (erro) {
      if (!mounted) return;

      switch (erro.code) {
        case 'email-already-in-use':
          _avisar('Este e-mail já está cadastrado');
          break;

        case 'invalid-email':
          _avisar('Informe um email válido');
          break;

        case 'weak-password':
          _avisar('Escolha uma senha mais forte');
          break;

        default:
          _avisar('Não foi possível cadastrar. Tente novamente');
      }
    } catch (erro) {
      if (!mounted) return;

      _avisar('Ocorreu uma falha. Verifique a Conecão.');
    } finally {
      if (mounted) {
        setState(() => _carregando = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
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
                  onPressed: _carregando ? null : _cadastrar,
                  child: _carregando
                  ? const CircularProgressIndicator()
                  :const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}