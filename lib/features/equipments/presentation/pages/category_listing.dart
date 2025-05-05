import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/features/equipments/mock%20data/mockup_data.dart';
import 'package:ibuild_vendor/features/equipments/presentation/widgets/category_card.dart';

typedef OnPressedCard = Function(int index);

class CategoryListingScreen extends StatelessWidget {
  const CategoryListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            navController.jumpToTab(0);
          },
        ),
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 3,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find Equipment',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'Select a category to explore equipment options',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: equipmentList.length,
              itemBuilder: (context, index) {
                return CategoryCard(equipment: equipmentList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
