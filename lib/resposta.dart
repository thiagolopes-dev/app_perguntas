import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
           shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Define o raio da borda como zero
          ),
          foregroundColor: Colors.white, // change background color of button
          backgroundColor: Colors.purple, // change text color of button
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
