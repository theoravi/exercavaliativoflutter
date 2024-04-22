import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tarefas_provider.dart';
import 'second_page.dart';
import 'task_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TarefasProvider(),
      child: MaterialApp(
        title: 'Lista de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.purple[100],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => TelaListaTarefas(),
          '/adicionar_tarefa': (context) => TelaAdicionarTarefa(),
        },
      ),
    ),
  );
}
