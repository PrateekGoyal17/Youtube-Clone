import 'package:dio/dio.dart';

class ApiClient{
  Future<dynamic> getVideos() async {
    const URL = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=100&regionCode=IN&key=AIzaSyA7a0XGxw1oEBHAGG_oJgYQGgWkpxueCGs";
    Dio _dio = Dio();
    final Response response = await _dio.get(URL);
    return response.data['items'];
  }
}