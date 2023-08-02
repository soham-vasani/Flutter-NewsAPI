//in this file app is get the data from api
import 'dart:convert';
import 'package:http/http.dart';
import '../Model/Article.dart';

class ApiService{

  //"" <- here we put the api link from web.
  // every day change this link.
    final endPoint = "https://newsapi.org/v2/everything?q=tesla&from=2023-07-02&sortBy=publishedAt&apiKey=e26571f4da824244a6eb3e5ca9cd6c93";

  //  here we create the function which is take the data.
  Future<List<Article>> getArticles() async {

    //  here we calling api
    //  it required to install http package.
    //  await is wait for response then execute if part
    Response response = await get(Uri.parse(endPoint));

    //200 status code means api request was successful.
    if(response.statusCode == 200){

      //here data is come in json format so we need to decode it.
      Map<String, dynamic>body = jsonDecode(response.body);

      //  here we need only article from api
      List<dynamic> article = body['articles'];

      List<Article> data = article.map((dynamic item) => Article.fromJson(item)).toList();
      return data;
    }
    else{
      throw 'somthing wrong';
    }
  }
}