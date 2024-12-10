import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/models/ArticleModel.dart';
import "dart:developer" as dev;


class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
   List<ArticleModel> allArticles = [];

  final dio = Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/"
      )
  );
   
  
  handleGetPosts()async{
    Response res = await dio.get("posts");

    print("${res.runtimeType}");
    print("${res.statusCode}");
    print("${res.statusMessage}");
    // dev.log("$res");

    if(res.data!=null){
      setState(() {
        allArticles = (res.data as List).map((e){
          return ArticleModel(title: e['title'], body: e['body'], id: e['id'], userId: e['userId']);
        }).toList();
      });
    }
  }




  @override
  void initState() {
    super.initState();
    handleGetPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Posts"),
              const SizedBox(height: 12,),
              allArticles.isEmpty?
                  Text("No articles found")
                  : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allArticles.length, itemBuilder: (_, i){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    children: [

                      Text("${allArticles[i].id!}", style: Theme.of(context).textTheme.bodySmall,),
                      SizedBox(height: 12,),
                      Text(allArticles[i].title!, style: Theme.of(context).textTheme.titleLarge,),
                      SizedBox(height: 12,),
                      Text(allArticles[i].body!),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
