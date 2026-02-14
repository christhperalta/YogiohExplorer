
import 'package:entrevista/feature/card_list/data/model/card_model.dart';
import 'package:entrevista/feature/card_list/domain/entities/card_entitiy.dart';
import 'package:entrevista/feature/card_list/domain/repository/card_list_repository.dart';
import 'package:dio/dio.dart';

class CardRepositoryImpl implements CardListRepository {
  final Dio dio = Dio();

  @override
  Future<List<CardEntitiy>> getList() async {
    try {
      final resp = await dio.get(
        'https://db.ygoprodeck.com/api/v7/cardinfo.php',
      );

      List<dynamic> data = resp.data['data'];  
      return data
      .map((json) => CardModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Error en la red ${e.message}');
    }
  }
}

