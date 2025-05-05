import 'package:animate_equipment_view/animate_equipment_view.dart';
import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/input_field_widget.dart';
import 'package:ibuild_vendor/features/equipments/data/models/subcategory_model.dart';
import 'package:ibuild_vendor/features/features.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';


typedef OnPressedCard = Function(int index);

class EquipmentScreen extends StatefulWidget {
  final List<SubcategoryModel> equipments;
  const EquipmentScreen({super.key, required this.equipments});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  late ValueNotifier<CardViewType> _switchNotifier;

  bool _isSearching = false;
  List<SubcategoryModel> _filteredEquipments = [];
  @override
  void dispose() {
    _tabController.dispose();
    _switchNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _filteredEquipments = widget.equipments;
    _switchNotifier = ValueNotifier(CardViewType.grid);
    _tabController = TabController(length: 2, vsync: this);
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      _filteredEquipments = widget.equipments;
    });
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
                    ? Icons.view_agenda_outlined
                    : Icons.grid_view_rounded,
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
    if (_switchNotifier.value == CardViewType.grid) {
      _tabController.animateTo(1);
      _switchNotifier.value = CardViewType.list;
    } else {
      _tabController.animateTo(0);
      _switchNotifier.value = CardViewType.grid;
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredEquipments = widget.equipments
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: ElevatedButton.icon(
            onPressed: () {
              pushWithNavBar(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddEquipmentScreen(
                            onSubmit: () {
                              Navigator.pop(context);
                            },
                          )));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 40),
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
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
        title: _isSearching
            ? InputField(
                labelText: "",
                controller: _searchController,
                autofocus: true,
                hintText: 'Search equipments...',
                onChanged: _onSearchChanged,
                borderColor: AppColors.borderGrey,
              )
            : Text(
                'Equipments',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
        centerTitle: true,
        elevation: 3,
        actions: [
          if (_isSearching)
            IconButton(icon: const Icon(Icons.close), onPressed: _stopSearch)
          else
            IconButton(icon: const Icon(Icons.search), onPressed: _startSearch),
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
                  '${_filteredEquipments.length} Items',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildSwitchGridAndListButton(),
              ],
            ),
          ),
          Expanded(
            child: LocalHero(
              controller: _tabController,
              pages: [
                ListViewContent(
                  equipments: _filteredEquipments,
                  basePageContext: context,
                  tabController: _tabController,
                ),
                GridViewContent(
                  equipments: _filteredEquipments,
                  basePageContext: context,
                  tabController: _tabController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
