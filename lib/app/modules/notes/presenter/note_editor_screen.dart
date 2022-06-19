import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../shared/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  final int color_id = Random().nextInt(AppStyle.cardsColor.length);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final String _date = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection('Notes').add({
            'note_title': _titleController.text,
            'creation_date': _date,
            'note_content': _contentController.text,
            'color_id': color_id,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print('falha ao adicionar nova nota por conta de $error'));
        },
        elevation: 10,
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 2,
        title: Text('Nova nota'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: _titleController,
              decoration: const InputDecoration(border: InputBorder.none, hintText: 'Título'),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 10),
            Text(_date, style: AppStyle.dateTitle),
            const SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: _contentController,
              decoration: const InputDecoration(border: InputBorder.none, hintText: 'Conteúdo'),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
