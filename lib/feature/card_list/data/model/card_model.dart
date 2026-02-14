import 'package:entrevista/feature/card_list/domain/entities/card_entitiy.dart';

class CardModel extends CardEntitiy {
  CardModel({
    required super.name,
    required super.type,
    required super.image,
    required super.id,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      image: json['card_images'][0]['image_url_small'],
    );
  }
}
