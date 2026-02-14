import 'package:entrevista/feature/card_list/presentation/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = context.watch<CardProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yugioh - Explorer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: cardProvider.loading
            ? Center(child: const CircularProgressIndicator())
            : Column(
                children: [
                  TextField(
                    onChanged: cardProvider.onFilterCard,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Busca una carta",
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    flex: 7,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: min(cardProvider.filteredList.length, 10),
                      itemBuilder: (BuildContext context, int index) {
                        final card = cardProvider.filteredList[index];
                        return CardItem(
                          name: card.name,
                          type: card.type,
                          image: card.image,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String type;
  final String image;
  const CardItem({
    super.key,
    required this.name,
    required this.type,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Image.network(image, width: 200, height: 180),
          SizedBox(height: 8),
          Text(type),
        ],
      ),
    );
  }
}
