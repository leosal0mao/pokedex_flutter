import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/modules/notes/presenter/note_editor_screen.dart';
import 'package:pokedex_flutter/app/modules/notes/presenter/note_reader_screen.dart';
import 'package:pokedex_flutter/app/shared/widgets/note_card.dart';

import '../../../shared/style/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const NoteEditorScreen())));
        },
        elevation: 10,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 2,
        title: const Text('Firebase Notes'),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Suas notas mais recentes',
                style: AppStyle.bigTitle,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NoteReaderScreen(doc: note)));
                              }, note))
                          .toList(),
                    );
                  }

                  return Center(
                    child: Text(
                      'Nenhuma nota por enquanto :)',
                      style: AppStyle.mainTitle,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
