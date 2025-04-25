import 'package:animate_equipment_view/src/colors.dart';
import 'package:flutter/material.dart';

enum CardViewType { grid, list }

class AnimatedEquipmentCard extends StatelessWidget {
  const AnimatedEquipmentCard({
    super.key,
    required this.equipment,
    required this.index,
    required this.viewType,
    required this.onTap,
  });

  final dynamic equipment;
  final int index;
  final CardViewType viewType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Builder(
        builder: (context) {
          if (viewType == CardViewType.list) {
            return _buildListViewCard(context);
          } else {
            return _buildGridViewCard(context);
          }
        },
      ),
    );
  }

  Widget _buildListViewCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            child: _buildImage(
              context,
              viewType: viewType,
              height: 120,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildTitle(), _buildPrice()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridViewCard(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.cardGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${equipment.name}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  FittedBox(
                    child: Row(
                      children: [
                        Text(
                          'KWD ',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${equipment.price}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          ' Per Day',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(
                            color: AppColors.greyDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 25,
          left: -7,
          right: -7,
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 140,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: _buildImage(
              viewType: viewType,
              context,
              fit: BoxFit.fill,
              height: 120,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(
    BuildContext context, {
    required double height,
    required CardViewType viewType,
    BoxFit fit = BoxFit.cover,
    required BorderRadius borderRadius,
  }) {
    return Container(
      height: height,
      width: viewType == CardViewType.grid ? 90 : null,
      decoration: BoxDecoration(
        color: equipment.backgroundColor,
        borderRadius: borderRadius,
        image: DecorationImage(image: AssetImage(equipment.imageUrl), fit: fit),
      ),
      child:
          !equipment.isAvailable
              ? Container(
                decoration: BoxDecoration(
                  color: AppColors.greyLight.withOpacity(.3),
                  borderRadius: borderRadius,
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'NOT AVAILABLE',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
              : null,
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            equipment.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            'Capacity: ${equipment.capacity} tons',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'KWD ',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: '${equipment.price}',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Per Day',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
