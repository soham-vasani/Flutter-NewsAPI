import 'package:flutter/material.dart';
import 'Model/Article.dart';

class new_page extends StatelessWidget {

  final Article article;
  const new_page({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          elevation: 5,
          child: Column(

              children: [
                Image.network(
                  '${article.urlToImage}',
                  fit: BoxFit.cover,

                ),
                Text('Author:- ${article.author}'),
                Text('Content:- ${article.content}'),
              ]

          ),
        ),
      ),
    );
  }
}
