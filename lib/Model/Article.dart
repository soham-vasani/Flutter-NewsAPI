// this model take some content from api(new api)

import 'dart:convert';

class Article {

  //here we put ? because author somtime have null val in api.
  final String? author;
  final String title;
  final String? description;
  final String? urlToImage;
  final String? content;


  Article({
    this.author,
    required this.title,
    this.description,
    this.urlToImage,
    this.content
  });

  //factory is used for show run time data in api
  //map is take data in the form of key:value.

  factory Article.fromJson(Map<String, dynamic>json){
    return Article(
        author: json['author'] == null ? null : json['author'],
        title: json['title'] == null ? null : json['title'],
        description: json['description'] == null ? null : json['description'],
        urlToImage: json['urlToImage'] == null ? null : json['urlToImage'],
        content: json['content'] == null ? null : json['content']
    );
  }

}