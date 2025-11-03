
import 'package:dio/dio.dart';

import 'package:news_app/model/Sources_response.dart';
import 'package:news_app/model/articles_response.dart';

class ApiManager{

  String baseUrl = "newsapi.org";
  String apiKey = "70dc19d299854971aa07a0cbdfebe93d";


  Future<SourcesResponse> getSources(String categoryId) async {
var dio = Dio();
var uri = Uri.https(baseUrl, "/v2/top-headlines/sources", {
  "category" : categoryId,
});
var response = await dio.getUri(uri, options: Options(headers: {"X-Api-Key" : apiKey,}));
return SourcesResponse.fromJson(response.data);
  
  }

  Future<ArticalResponse> getArticalResponse(String sourceId) async{
    var dio = Dio();
    var uri = Uri.https(baseUrl, "/v2/everything", {
      "sources" : sourceId,
    });
    var response = await dio.getUri(uri, options: Options(headers: {"X-Api-Key" : apiKey,}));
    return ArticalResponse.fromJson(response.data);
  }

}