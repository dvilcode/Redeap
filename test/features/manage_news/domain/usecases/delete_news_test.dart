import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redeap/features/manage_news/domain/repositories/news_repository.dart';
import 'package:redeap/features/manage_news/domain/usecases/delete_news.dart';

class MockNewsRepository extends Mock
  implements NewsRepository {}

void main() {
  MockNewsRepository mockNewsRepository;
  DeleteNews usecase;

  setUp((){
    mockNewsRepository = MockNewsRepository();
    usecase = DeleteNews( mockNewsRepository );
  });

  final tParams = DeleteParams( newsCode: '1' );

  test('should return null when news has been delete',
    () async {
    // arrange
    when( mockNewsRepository.deleteNews( any ) )
        .thenAnswer((_) async => Right(null) );
    // act
    final result = await usecase( tParams );
    // assert
    expect( result, equals( Right(null) ) );
    verify( mockNewsRepository.deleteNews( tParams.newsCode ) );
    verifyNoMoreInteractions( mockNewsRepository );
  });
}