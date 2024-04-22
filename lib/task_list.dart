import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tarefas_provider.dart';

class TelaListaTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tarefasProvider = Provider.of<TarefasProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[900],
      ),
      body: ListView.builder(
        itemCount: tarefasProvider.tarefas.length,
        itemBuilder: (context, indice) {
          return Dismissible(
            key: Key(tarefasProvider.tarefas[indice].titulo),
            onDismissed: (direcao) {
              tarefasProvider.removerTarefa(indice);
            },
            child: Card(
              color: Colors.purple[700],
              elevation: 3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(
                  tarefasProvider.tarefas[indice].titulo,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                subtitle: Text(
                  tarefasProvider.tarefas[indice].descricao,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adicionar_tarefa');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}
