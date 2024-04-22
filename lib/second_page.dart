import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tarefas_provider.dart';

class TelaAdicionarTarefa extends StatelessWidget {
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tarefasProvider = Provider.of<TarefasProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adicionar Tarefa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controladorTitulo,
              decoration: InputDecoration(
                labelText: 'Título da Tarefa',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controladorDescricao,
              decoration: InputDecoration(
                labelText: 'Descrição da Tarefa',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                tarefasProvider.adicionarTarefa(
                  _controladorTitulo.text,
                  _controladorDescricao.text,
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[900], // Fundo roxo escuro
                onPrimary: Colors.white, // Fonte branca
              ),
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
