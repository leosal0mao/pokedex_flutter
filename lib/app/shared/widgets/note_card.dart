import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/shared/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          doc['note_title'],
          style: AppStyle.mainTitle,
        ),
        SizedBox(height: 5),
        Text(
          doc['creation_date'],
          style: AppStyle.dateTitle,
        ),
        SizedBox(height: 10),
        Text(
          doc['note_content'],
          style: AppStyle.mainContent,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    ),
  );
}
