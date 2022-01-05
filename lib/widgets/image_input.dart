import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key, required this.onSelectImage}) : super(key: key);

  final Function onSelectImage;

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    // local para salvar arquivos
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(_storedImage!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/${fileName}');

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            alignment: Alignment.center,
            child: _storedImage != null
                ? Image.file(
                    _storedImage!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Text('Nenhuma Imagem!')),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text('Tirar foto'),
          ),
        ),
      ],
    );
  }
}
