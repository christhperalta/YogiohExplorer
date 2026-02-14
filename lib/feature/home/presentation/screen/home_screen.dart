import 'package:entrevista/core/shared/widgets/custom_search_bar.dart';
import 'package:entrevista/feature/home/presentation/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = context.watch<CardProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yugioh Explorer',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: cardProvider.loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    CustomSearchbar(onChanged: cardProvider.onFilterCard),
                    const SizedBox(height: 16),
                    Expanded(
                      child: cardProvider.filteredList.isEmpty
                          ? Center(child: const Text('No hay resultados.'))
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 0.65,
                                  ),
                              itemCount: min(
                                cardProvider.filteredList.length,
                                10,
                              ),
                              itemBuilder: (context, index) {
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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Imagen
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Información
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  type,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
