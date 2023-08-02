import 'package:day10api/services/ApiService.dart';
import 'package:day10api/Model/Article.dart';
import 'package:day10api/Widget/NewsCardWidget.dart';
import 'package:day10api/new_page.dart';
import 'package:flutter/material.dart';

// when you open the code then fire flutter pub get command in main.dart file and pubspec.yaml file
// and change the api link from api news


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('News api'),backgroundColor: Colors.black45),
        body:

        FutureBuilder(

          //here we use getArticles() function ApiService class
            future: ApiService().getArticles(),
            builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){

              if(snapshot.hasData){
                return ListView.builder(

                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context,index){
                      return

                        //  custom widget for click to get new page
                        InkWell(
                            onTap:  (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => new_page(article: snapshot.data![index]))
                              );
                            },
                            child: NewsCardWidget(article: snapshot.data![index])
                        );
                    }

                );
              }
              return Center(child: CircularProgressIndicator(color: Colors.black45,));

            }
        )


    );
  }
}


