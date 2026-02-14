


import 'package:entrevista/feature/home/domain/entities/card_entitiy.dart';

abstract class CardListRepository {
  Future<List<CardEntitiy>> getList();
}