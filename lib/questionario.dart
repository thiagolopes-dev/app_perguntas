import 'package:app_perguntas/questao.dart';
import 'package:app_perguntas/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario(
      {super.key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.quandoResponder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(children: [
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      ...respostas.map((resp) {
        return Resposta(resp['texto'].toString(), () {
          final pontuacao = resp['pontuacao'];
          if (pontuacao != null) {
            quandoResponder(pontuacao as int);
          }
        });
      })
    ]);
  }
}
