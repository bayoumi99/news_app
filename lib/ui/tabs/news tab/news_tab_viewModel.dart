import 'package:flutter/material.dart';
import 'package:news_app/api/api_client.dart';
import 'package:news_app/api/provider_dio.dart';
import 'package:news_app/core/base/base_view_model.dart';
import 'package:news_app/model/articles_response.dart';



class NewsTabViewmodel extends BaseViewModel{
 final ApiClient  _ApiClient= ApiClient(ProviderDio());
  String? SourceErrorMasege;
  bool SourceLoading =false;
  List<Source> Sources=[];



 Future<void> loadSources(String categoryId) async {
   SourceLoading=true;
   notifyListeners();
   try{
     var response= await _ApiClient.getSources(categoryId);
if( response.status =="ok"){
  Sources = response.sources!.cast<Source>();
  if (Sources.isNotEmpty){
     loadArticles(Sources.first);
  }
}else{
SourceErrorMasege=response.message;
}

   }catch(e){
     SourceErrorMasege=e.toString();
   }finally{
     SourceLoading=false;
     notifyListeners();
   }

}
 List<Articles> articles=[];
 String? ArticlesErrorMasege;
 bool ArticlesLoading=false;
 Future<void> loadArticles(Source source) async {
   ArticlesLoading=true;
   notifyListeners();
   try{
     var response= await _ApiClient.getArticalResponse(source.id!);
     if( response.status =="ok"){
       articles = response.articles!.cast<Articles>();

     }else{
       ArticlesErrorMasege=response.message;
     }
   }catch(e){
     ArticlesErrorMasege=e.toString();

   }finally{
     ArticlesLoading=false;
     notifyListeners();

   }


















 }
}

