import 'package:animate_equipment_view/animate_equipment_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';

import 'base_card_view.dart';

class GridViewContent extends StatefulWidget {
  const GridViewContent(
      {super.key,
      required this.basePageContext,
      this.tabController,
      required this.equipments});
  final TabController? tabController;
  final List<SubcategoryModel> equipments;
  final BuildContext basePageContext;

  @override
  State<GridViewContent> createState() => _GridViewContentState();
}

class _GridViewContentState extends State<GridViewContent> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    widget.tabController?.addListener(() {
      if (widget.tabController?.indexIsChanging ?? false) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: _scrollController,
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 16 / 28.5,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      children: List.generate(
        widget.equipments.length,
        (index) => BaseCard(
          viewType: CardViewType.grid,
          index: index,
          equipmentData: widget.equipments[index],
          onPressedCard: (index) {
                GoRouter.of(context).push(Routes.DETAILS);
          },
        ),
      ),
    );
  }
}
// class EquipmentGridView extends StatelessWidget {
//   final Animation<double> animation;
//   const EquipmentGridView({super.key, required this.animation});

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: animation.value,
//       child: Transform.scale(
//         scale: 0.9 + (animation.value * 0.1),
//         child: GridView.builder(
//           padding: const EdgeInsets.all(16),
//           shrinkWrap: true,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.85,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//           ),
//           itemCount: equipments.length,
//           itemBuilder: (context, index) {
//             final equipment = equipments[index];
//             return EquipmentGridItem(animation: animation, equipment: equipment, index: index,);
//           },
//         ),
//       ),
//     );
//   }
// }
