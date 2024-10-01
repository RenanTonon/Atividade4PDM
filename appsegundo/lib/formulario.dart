import 'package:flutter/material.dart';
import 'package:appsegundo/lista.dart';
class TelaFormulario extends StatefulWidget {
  @override
  _TelaFormularioState createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final TextEditingController _controller = TextEditingController();
  List<String> _itens = [];

  void _adicionarItem(String item) {
    if (item.isNotEmpty) {
      setState(() {
        _itens.add(item);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite um item',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
          
            ElevatedButton(
              onPressed: () {
                _adicionarItem(_controller.text);
              },
              child: Text('Adicionar Item'),
            ),
            SizedBox(height: 20),
          
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaLista(itens: _itens),
                  ),
                );
              },
              child: Text('Ver Lista de Itens'),
            ),
          ],
        ),
      ),
    );
  }
}

