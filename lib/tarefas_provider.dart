import 'package:flutter/material.dart';

class Tarefa {
  final String titulo;
  final String descricao;

  Tarefa(this.titulo, this.descricao);
}

class TarefasProvider extends ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  void adicionarTarefa(String titulo, String descricao) {
    _tarefas.add(Tarefa(titulo, descricao));
    notifyListeners();
  }

  void removerTarefa(int indice) {
    _tarefas.removeAt(indice);
    notifyListeners();
  }
}
