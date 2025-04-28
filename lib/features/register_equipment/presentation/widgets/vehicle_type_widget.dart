import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? selectedCategory;
  String? selectedSubcategory;

  List<String> get subcategories {
    return selectedCategory != null
        ? categoryData[selectedCategory!] ?? []
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vehicle Type',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.greyLight,
            border: Border.all(
              color: AppColors.borderGrey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: const InputDecoration(
              hintText: 'Choose a category',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
            value: selectedCategory,
            items: categoryData.keys.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Row(
                  children: [
                    Icon(categoryIcons[category] ?? Icons.category),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        category,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
                selectedSubcategory = null;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Vehicle Subcategory',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.greyLight,
            border: Border.all(
              color: AppColors.borderGrey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<String>(
            hint: Text(
              "Choose a subcategory vehicle",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12,
                  ),
            ),
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: const InputDecoration(
              hintText: 'Choose a subcategory',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
            value: selectedSubcategory,
            items: subcategories.map((subcategory) {
              return DropdownMenuItem(
                value: subcategory,
                child: Row(
                  children: [
                    
                    const Icon(Icons.subdirectory_arrow_right),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(subcategory,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSubcategory = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

final Map<String, List<String>> categoryData = {
  'Mobile Crane': [
    '25 Ton, Mobile Crane',
    '50 Ton, Mobile Crane',
    '60 Ton, Mobile Crane',
    '80 Ton, Mobile Crane',
    '100 Ton, Mobile Crane',
    '120 Ton, Mobile Crane',
    '150 Ton, Mobile Crane',
    '180 Ton, Mobile Crane',
    '200 Ton, Mobile Crane',
    '220 Ton, Mobile Crane',
    '250 Ton, Mobile Crane',
    '280 Ton, Mobile Crane',
  ],
  'Boom Truck Crane': [
    '6 Ton, Boom Truck Crane',
    '8 Ton, Boom Truck Crane',
    '10 Ton, Boom Truck Crane',
  ],
  'Tower Crane': [
    '6 Ton, 45 Mt. Tower Crane',
    '50 Ton, 50 Mt. Tower Crane',
    '60 Ton, 60 Mt. Tower Crane',
    '80 Ton, 70 Mt. Tower Crane',
    '100 Ton, 85 Mt. Tower Crane',
  ],
  'Dump Truck': [
    '18 M3, Dump Truck',
    '30 M3, Dump Truck',
  ],
  'Loader Tractor': [
    'Loader Tractor',
  ],
  'Excavator': [
    'Excavator with Lowbed Trail',
    'Excavator without Lowbed Trail',
    'Jack Hammer Excavator With Lowbed Trail',
    'Jack Hammer Excavator Without Lowbed Trail',
    'JCB Excavator',
  ],
  'Trailer': [
    'Lowbed Trail',
  ],
  'Compactor': [
    'Roller Compactor',
    'Double Wheel Compactor',
    'Plate Compactor',
  ],
  'Generator': [
    '20 KW, Diesel Generator',
    '30 KW, Diesel Generator',
    '40 KW, Diesel Generator',
    '50 KW, Diesel Generator',
    '60 KW, Diesel Generator',
    '80 KW, Diesel Generator',
    '100 KW, Diesel Generator',
    '120 KW, Diesel Generator',
    '150 KW, Diesel Generator',
    '160 KW, Diesel Generator',
    '200 KW, Diesel Generator',
  ],
  'Bobcat': [
    'Bobcat',
  ],
  'Forklift': [
    'Forklift',
  ],
};

final Map<String, IconData> categoryIcons = {
  'Mobile Crane': Icons.precision_manufacturing,
  'Boom Truck Crane': Icons.local_shipping,
  'Tower Crane': Icons.account_tree,
  'Dump Truck': Icons.directions_bus,
  'Loader Tractor': Icons.agriculture,
  'Excavator': Icons.construction,
  'Trailer': Icons.tram,
  'Compactor': Icons.settings,
  'Generator': Icons.power,
  'Bobcat': Icons.pets,
  'Forklift': Icons.local_shipping,
};
