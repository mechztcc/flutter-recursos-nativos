import 'package:flutter/material.dart';
import 'package:recursos_nativos/widgets/image_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleControler = TextEditingController();

  void _submitForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Novo Lugar')),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _titleControler,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput()
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: Icon(Icons.add),
                label: Text('Adicionar'),
              ),
            ],
          ),
        ));
  }
}
