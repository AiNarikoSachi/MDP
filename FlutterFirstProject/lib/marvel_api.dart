import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'marvel.dart';

class MarvelApi {
  Future<Marvel> readMarvelHero(int id) async {
    Dio dio = Dio();
    var public = '857874b00fdca6330433d7448e97392a';
    var private = 'e80096fbd5746a53f9147c040e63400e9303142d';
    int time = DateTime.now().millisecondsSinceEpoch;
    String key = md5.convert(utf8.encode('$time$private$public')).toString();
    dio.options.queryParameters['ts'] = time;
    dio.options.queryParameters['apikey'] = public;
    dio.options.queryParameters['hash'] = key;

    Response response =
        await dio.get('https://gateway.marvel.com/v1/public/characters/$id');

    var result = response.data['data']['results'][0];

    return Marvel(
        id: result['id'],
        name: result['name'].toString().split('(')[0],
        image: result['thumbnail']['path'] + '/portrait_incredible.jpg',
        text: result['description']);
  }

  Future<List<Marvel>> readMarvelHeroes(List<int> ids) async {
    try {
      List<Future<Marvel>> marvel = [];
      for (var id in ids) {
        marvel.add(readMarvelHero(id));
      }
      return Future.wait(marvel);
    } catch (e) {
      return [];
    }
  }
}
