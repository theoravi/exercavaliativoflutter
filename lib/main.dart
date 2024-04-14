import 'package:flutter/material.dart';
import 'second_page.dart'; // Importando a segunda página

void main() {
  runApp(MeuApp());
}

class Tarefa {
  final String titulo;
  final String descricao;

  Tarefa(this.titulo, this.descricao);
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TelaListaTarefas(),
    );
  }
}

class TelaListaTarefas extends StatefulWidget {
  @override
  _TelaListaTarefasState createState() => _TelaListaTarefasState();
}

class _TelaListaTarefasState extends State<TelaListaTarefas> {
  List<Tarefa> tarefas = [];

  void adicionarTarefa(String titulo, String descricao) {
    setState(() {
      tarefas.add(Tarefa(titulo, descricao));
    });
  }

  void removerTarefa(int indice) {
    setState(() {
      tarefas.removeAt(indice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[900],
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, indice) {
          return Dismissible(
            key: Key(tarefas[indice].titulo),
            onDismissed: (direcao) {
              removerTarefa(indice);
            },
            child: Card(
              color: Colors.purple[700],
              elevation: 3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(
                  tarefas[indice].titulo,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                subtitle: Text(
                  tarefas[indice].descricao,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaAdicionarTarefa(adicionarTarefa)));
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
