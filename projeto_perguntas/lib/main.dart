import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resultado.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': "Qual é a sua cor favorita?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Amarelo', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 1},
      ],
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': "Qual é o seu Professor favorito?",
      'respostas': [
        {'texto': 'João', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 5},
        {'texto': 'José', 'pontuacao': 3},
        {'texto': 'Carla', 'pontuacao': 1},
      ],
    }
  ];
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
