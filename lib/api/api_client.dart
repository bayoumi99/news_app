import 'package:dio/dio.dart';
import 'package:news_app/model/articles_response.dart';
import 'package:retrofit/retrofit.dart';

import '../model/Sources_response.dart';
part 'api_client.g.dart';



@RestApi(baseUrl : "http://newsapi.org")
abstract class ApiClient{
 factory ApiClient(Dio dio )=> _ApiClient(dio);


@GET("/v2/top-headlines/sources")
 Future<SourcesResponse> getSources(
    @Query("category") String categoryId);

@GET("/v2/everything")
 Future<ArticalResponse> getArticalResponse(
    @Query("sources") String sourceId,);



}