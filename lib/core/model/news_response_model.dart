import 'package:json_annotation/json_annotation.dart';
import 'package:yt_ea_getx_dio_api/core/model/article.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponse {
  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "totalResults")
  int totalResults;

  @JsonKey(name: "articles")
  List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
