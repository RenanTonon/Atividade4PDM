import 'package:flutter/material.dart';

class TelaLista extends StatefulWidget {
  final List<String> itens;

  TelaLista({required this.itens});

  @override
  _TelaListaState createState() => _TelaListaState();
}

class _TelaListaState extends State<TelaLista> {
  void _editarItem(int index, String novoItem) {
    setState(() {
      widget.itens[index] = novoItem;
    });
  }

  void _removerItem(int index) {
    setState(() {
      widget.itens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens'),
      ),
      body: ListView.builder(
        itemCount: widget.itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.itens[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Botão para editar item
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    _mostrarDialogoEdicao(index);
                  },
                ),
            
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _removerItem(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  void _mostrarDialogoEdicao(int index) {
    final TextEditingController _editController =
        TextEditingController(text: widget.itens[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: TextField(
            controller: _editController,
            decoration: InputDecoration(
              labelText: 'Editar item',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _editarItem(index, _editController.text);
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
