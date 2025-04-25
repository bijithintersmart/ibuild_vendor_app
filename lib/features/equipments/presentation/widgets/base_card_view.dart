import 'package:animate_equipment_view/animate_equipment_view.dart'
    show AnimatedEquipmentCard, CardViewType;
import 'package:flutter/widgets.dart';
import 'package:ibuild_vendor/features/equipments/data/models/equipment_model.dart';

import '../pages/equipments.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.index,
    required this.onPressedCard,
    required this.viewType,
    required this.equipmentData,
  });

  final int index;
  final OnPressedCard onPressedCard;
  final CardViewType viewType;
  final Equipment equipmentData;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: index,
      child: AnimatedEquipmentCard(
        equipment: equipmentData,
        index: index,
        viewType: viewType,
        onTap: () => onPressedCard(index),
      ),
    );
  }
}
