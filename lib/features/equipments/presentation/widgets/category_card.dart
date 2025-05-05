import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/features/details/presentation/pages/booking_slot_screen.dart';
import 'package:ibuild_vendor/features/equipments/data/models/category_model.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
class CategoryCard extends StatelessWidget {
  final CategoryModel equipment;

  const CategoryCard({
    super.key,
    required this.equipment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardGrey,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          pushWithNavBar(
            context,
            MaterialPageRoute(
              builder: (context) => BookingDatePickerScreen(
                equipments: equipment.subCategories,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  equipment.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(.2),
                        Colors.black.withOpacity(.5),
                        Colors.black.withOpacity(.7),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 5,
                  ),
                  child: Text(
                    equipment.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
