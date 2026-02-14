import 'package:entrevista/feature/home/data/repository/card_repository_impl.dart';
import 'package:entrevista/feature/home/domain/entities/card_entitiy.dart';
import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  final CardRepositoryImpl _repository = CardRepositoryImpl();

  bool loading = false;
  List<CardEntitiy> cardList = [];
  List<CardEntitiy> filteredList = [];

  Future<void> loadCard() async {
    loading = true;
    notifyListeners();

    cardList = await _repository.getList();
    filteredList = cardList;
    notifyListeners();
    loading = false;
  }

  void onFilterCard(String newCard) {
    if (newCard.isEmpty) {
      filteredList = cardList;
    }
    filteredList = cardList.where((item) {
      return item.name.toLowerCase().contains(newCard.toLowerCase());
    }).toList();
    
    notifyListeners();
  }
}
