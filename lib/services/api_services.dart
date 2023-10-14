import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_app/model_class/details_class.dart';
import 'package:movies_app/model_class/tv_show_class.dart';
import 'package:movies_app/utilities/api_constants.dart';
import 'package:movies_app/utilities/network_failure.dart';

class ApiService {
  Future<List<Details>> popularMovie() async {
    final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.popularApi),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNjZmYjNmNTZkNDAwNjM5OTQyMzc2MjQ1MGRmYWNkOSIsInN1YiI6IjY1MTY0OGNhOTNiZDY5MDBmZTQ3ZWRlYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kyrL97zm2gCQgGgIhU3olNDNjxfr_Kd1RcQxMS2Ui5Y'
        });
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      List<Details> data = await decodeData["results"].map<Details>((e) {
        return Details.fromJson(e);
      }).toList();
      return data;
    } else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
  Future<List<TvShowss>> tvShows()async{
    final response=await http.get(Uri.parse(ApiConstants.baseUrl+ApiConstants.tvShows+ApiConstants.apiKey));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      List<TvShowss>data=await decodeData["results"].map<TvShowss>((e){
        return TvShowss.fromJson(e);
      }).toList();
      return data;
    }else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
  Future<List<Details>>topRated()async{
    final response=await http.get(Uri.parse(ApiConstants.baseUrl+ApiConstants.toprated+ApiConstants.apiKey));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      List<Details>data=await decodeData["results"].map<Details>((e){
        return Details.fromJson(e);
      }).toList();
      return data;}
    else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
  Future<List<Details>>upComing()async{
    final response=await http.get(Uri.parse(ApiConstants.baseUrl+ApiConstants.upcoming+ApiConstants.apiKey));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      List<Details>data=await decodeData["results"].map<Details>((e){
        return Details.fromJson(e);
      }).toList();
      return data;}
    else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
  Future<List<Details>>similiarMovies(String movieId)async{
    final response=await http.get(Uri.parse(ApiConstants.similiarUrl+movieId+ApiConstants.similiarApi));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      List<Details>data=await decodeData["results"].map<Details>((e){
        return Details.fromJson(e);
      }).toList();
      return data;}
    else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
  Future<List<TvShowss>>similiarShows(String seriesId)async{
    final response=await http.get(Uri.parse(ApiConstants.similiarShow+seriesId+ApiConstants.similiarApi));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      List<TvShowss>data=await decodeData["results"].map<TvShowss>((e){
        return TvShowss.fromJson(e);
      }).toList();
      return data;}
    else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
  Future<List<Details>>searchMovie(String query)async{
    final response=await http.get(Uri.parse(ApiConstants.baseUrl+ApiConstants.searchMovie+ApiConstants.apiKey+ApiConstants.queryUrl+query));

    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      List<Details>data=await decodeData["results"].map<Details>((e){
        return Details.fromJson(e);
      }).toList();
      return data;}
    else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
  Future<String>movieVideo(String movieId)async{
    final response=await http.get(Uri.parse(ApiConstants.baseUrl+ApiConstants.videoApi+movieId+ApiConstants.video+ApiConstants.apiKey));


    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      String data=await decodeData["results"].elementAt(0)["key"];
      return data;}
    else {
      throw NetworkFailures.errorHandling(response.statusCode);
    }
  }
}
