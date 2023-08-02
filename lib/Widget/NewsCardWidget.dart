import 'package:flutter/material.dart';
import '../Model/Article.dart';

class NewsCardWidget extends StatelessWidget {

  final Article article;
  const NewsCardWidget({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return

      Card(

          elevation: 5,

          child: Column(
            children: [

              Image.network(
                '${article.urlToImage}',
                fit: BoxFit.cover,

              ),
              Text(
                'Title:- ${article.title}',
                style: TextStyle(fontSize: 20),
              ),

              Text(
                'Description:- ${article.description}',
                style: TextStyle(color: Colors.black26),
              ),

            ],
          )
      );


  }
}