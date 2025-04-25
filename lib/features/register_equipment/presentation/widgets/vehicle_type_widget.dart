import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';

class CategorizedVehicleDropdowns extends StatefulWidget {
  const CategorizedVehicleDropdowns({super.key});

  @override
  State<CategorizedVehicleDropdowns> createState() =>
      _CategorizedVehicleDropdownsState();
}

class _CategorizedVehicleDropdownsState
    extends State<CategorizedVehicleDropdowns> {
  final Map<String, List<String>> vehicleCategories = {
    'Construction Vehicles': [
      'Excavator',
      'Bulldozer',
      'Wheel Loader',
      'Backhoe Loader',
      'Motor Grader',
      'Crawler Dozer',
    ],
    // 'Mining Vehicles': [
    //   'Dump Truck',
    //   'Articulated Hauler',
    //   'Mining Truck',
    //   'Dragline Excavator',
    // ],
  };

  final Map<String, String?> selectedVehicles = {
    'Construction Vehicles': null,
    'Mining Vehicles': null,
  };

  Widget _buildStyledDropdown(String category, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Vehicle Type",
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
            border: Border.all(color: AppColors.borderGrey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedVehicles[category],
            hint: Text(
              "Choose vehicle",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12,
                  ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
            items: items.map((String vehicle) {
              return DropdownMenuItem<String>(
                value: vehicle,
                child: Row(
                  children: [
                    const Icon(Icons.local_shipping, size: 18),
                    const SizedBox(width: 8),
                    Text(vehicle),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedVehicles[category] = value;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: vehicleCategories.entries.map((entry) {
        return _buildStyledDropdown(entry.key, entry.value);
      }).toList(),
    );
  }
}
