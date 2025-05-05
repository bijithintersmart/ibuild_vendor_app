import 'package:animate_equipment_view/animate_equipment_view.dart'
    show AnimatedEquipmentCard, CardViewType;
import 'package:flutter/widgets.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';

import '../pages/equipments.dart';

class BaseCard extends StatefulWidget {
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
  final SubcategoryModel equipmentData;

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  bool isEquipmentAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.index,
      child: AnimatedEquipmentCard(
        equipment: widget.equipmentData,
        index: widget.index,
        viewType: widget.viewType,
        avilalblity: isEquipmentAvailable,
        onAvilalblityChange: (value) {
          setState(() {
            isEquipmentAvailable = value;
          });
        },
        onTap: () => widget.onPressedCard(widget.index),
      ),
    );
  }
}
