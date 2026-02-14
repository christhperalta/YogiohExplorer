


import 'package:entrevista/feature/card_list/domain/entities/card_entitiy.dart';

abstract class CardListRepository {
  Future<List<CardEntitiy>> getList();
}