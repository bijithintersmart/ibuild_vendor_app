import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/scrollable_tab_view.dart';
import 'package:ibuild_vendor/features/details/data/models/gallery_model.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/description_widget.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/details_carousel_widget.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/gallery_grid.dart';
import 'package:ibuild_vendor/features/details/presentation/widgets/tab_item_widget.dart';

class EquipmentDetailsPage extends StatefulWidget {
  const EquipmentDetailsPage({super.key});

  @override
  State<EquipmentDetailsPage> createState() => _EquipmentDetailsPageState();
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              side: BorderSide(
                color: AppColors.borderGrey,
              )),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailsCarouselWidget(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'JCB',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text.rich(TextSpan(
                              text: 'KWD ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                              children: [
                                TextSpan(
                                    text: '500.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.secondary))
                              ])),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                labelColor: Colors.black,
                isScrollable: true,
                padding: EdgeInsets.zero,
                splashFactory: NoSplash.splashFactory,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: TabItemWidget(
                        title: 'Description',
                        tabController: _tabController,
                        tabIndex: 0),
                  ),
                  Tab(
                    child: TabItemWidget(
                        title: 'Gallery',
                        tabController: _tabController,
                        tabIndex: 1),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _tabController.index = index;
                  });
                },
              ),
            ),
            ScrollableTabView(selectedIndex: _tabController.index, children: [
              const DescriptionWIdget(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: GalleryGrid(
                  items: galleryItems,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
