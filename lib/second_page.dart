import 'package:flutter/material.dart';

class TelaAdicionarTarefa extends StatelessWidget {
  final Function(String, String) callbackAdicionarTarefa;
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorDescricao = TextEditingController();

  TelaAdicionarTarefa(this.callbackAdicionarTarefa);

  @override
  Widget build(BuildContext context) {
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
                callbackAdicionarTarefa(
                    _controladorTitulo.text, _controladorDescricao.text);
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
