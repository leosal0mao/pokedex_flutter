import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/shared/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  final QueryDocumentSnapshot? doc;
  const NoteReaderScreen({Key? key, this.doc}) : super(key: key);

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc!['color_id'];

    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.doc!['note_title'],
            style: AppStyle.mainTitle,
          ),
          SizedBox(height: 5),
          Text(
            widget.doc!['creation_date'],
            style: AppStyle.dateTitle,
          ),
          SizedBox(height: 10),
          Text(
            widget.doc!['note_content'],
            style: AppStyle.mainContent,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          )
        ]),
      ),
    );
  }
}
