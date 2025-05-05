import 'package:animate_equipment_view/animate_equipment_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';

import 'base_card_view.dart';

class ListViewContent extends StatefulWidget {
  const ListViewContent(
      {super.key,
      required this.basePageContext,
      this.tabController,
      required this.equipments});
  final TabController? tabController;
  final List<SubcategoryModel> equipments;
  final BuildContext basePageContext;

  @override
  State<ListViewContent> createState() => _ListViewContentState();
}

class _ListViewContentState extends State<ListViewContent> {
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
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.zero,
      primary: false,
      itemCount: widget.equipments.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final equipment = widget.equipments[index];
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: AspectRatio(
            aspectRatio: 16 / 13,
            child: BaseCard(
              viewType: CardViewType.list,
              index: index,
              equipmentData: equipment,
              onPressedCard: (index) {
                GoRouter.of(context).push(Routes.DETAILS);
              },
            ),
          ),
        );
      },
    );
  }
}

// class EquimentListView extends StatelessWidget {
//   final Animation<double> animation;
//   const EquimentListView({super.key, required this.animation});

//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: 1 - animation.value,
//       child: Transform.scale(
//         scale: 1 - (animation.value * 0.1),
//         child: ListView.builder(
//           shrinkWrap: true,
//           physics: const AlwaysScrollableScrollPhysics(),
//           padding: const EdgeInsets.all(16),
//           itemCount: equipments.length,
//           itemBuilder: (context, index) {
//             final equipment = equipments[index];
//             return EquipmentListItem(
//                 animation: animation, equipment: equipment, index: index);
//           },
//         ),
//       ),
//     );
//   }
// }
