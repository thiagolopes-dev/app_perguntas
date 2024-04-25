import 'package:flutter/material.dart';

import './questionario.dart';
import './resultado.dart';

main() => runApp(const PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Amarelo', 'pontuacao': 9},
        {'texto': 'Azul', 'pontuacao': 8},
        {'texto': 'Branco', 'pontuacao': 7},
      ]
    },
    {
      'texto': 'Qual seu carro favorito?',
      'respostas': [
        {'texto': 'Civic', 'pontuacao': 10},
        {'texto': 'Corolla', 'pontuacao': 9},
        {'texto': 'Fusca', 'pontuacao': 2},
        {'texto': 'Jetta', 'pontuacao': 5},
      ]
    },
    {
      'texto': 'Qual sua linguagem de programação web favorita?',
      'respostas': [
        {'texto': 'Angular', 'pontuacao': 10},
        {'texto': 'React', 'pontuacao': 5},
        {'texto': 'Vuejs', 'pontuacao': 4},
        {'texto': 'Flutter', 'pontuacao': 9},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
