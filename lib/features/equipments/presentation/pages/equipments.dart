import 'package:animate_equipment_view/animate_equipment_view.dart';
import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/features/equipments/data/models/equipment_model.dart';
import 'package:ibuild_vendor/features/equipments/presentation/widgets/equiment_list_view.dart';

import '../widgets/equiment_grid_view.dart';

enum FavoriteShape { gird, list }

typedef OnPressedCard = Function(int index);

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({super.key});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<FavoriteShape> _switchNotifier;
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    _switchNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _switchNotifier = ValueNotifier(FavoriteShape.gird);
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget _buildSwitchGridAndListButton() {
    return ValueListenableBuilder(
      valueListenable: _switchNotifier,
      builder: (context, value, child) {
        return ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(35, 35)),
          child: AspectRatio(
            aspectRatio: 1.9 / 2,
            child: RawMaterialButton(
              onPressed: () => _switchBetweenGridAndList(),
              elevation: 0,
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              fillColor: AppColors.secondary,
              child: Icon(
                _tabController.index == 0
                    ? Icons.grid_view_rounded
                    : Icons.view_agenda_outlined,
                size: 20 - 4,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  void _switchBetweenGridAndList() {
    if (_switchNotifier.value == FavoriteShape.gird) {
      _tabController.animateTo(1);
      _switchNotifier.value = FavoriteShape.list;
    } else {
      _tabController.animateTo(0);
      _switchNotifier.value = FavoriteShape.gird;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: const Size(150, 40),
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                // padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              icon: const Icon(
                Icons.handyman,
                color: Colors.white,
              ),
              label: Text(
                'Add New Equipment',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              )),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              navController.jumpToTab(0);
            },
          ),
          centerTitle: true,
          title: Text(
            'Equipments',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          elevation: 3,
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${equipments.length} Items',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildSwitchGridAndListButton()
                ],
              ),
            ),
            Expanded(
              child: LocalHero(
                controller: _tabController,
                pages: [
                  ListViewContent(
                    basePageContext: context,
                  ),
                  GridViewContent(
                    basePageContext: context,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
