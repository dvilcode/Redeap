import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:redeap/features/manage_news/data/models/news_model.dart';
import 'package:redeap/features/manage_news/domain/entities/news.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {

  final NewsModel tNews = NewsModel(
      newsCode: '1',
      reportCode: '1',
      radioCode: '5.20',
      hourDate: 750000,
      unitCode: 'Does1',
      message: 'Desplazamiento',
      updateDate: 750000,
      unitCreate: 'Genesis2');

  test('should be a subclass of News entity',(){
    // assert
    expect( tNews, isA<News>() );
  });

  group('toJson', (){
    
    final Map<String, dynamic> jsonExpected = json.decode( fixture('news.json') );

    test('should convert model to JSON',(){
      // act
      final result = tNews.toJson();
      // assert
      expect( result, equals( jsonExpected ) );
    });  
  });
}