import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (GoRouter.of(context).canPop()) {
                GoRouter.of(context).pop();
              }
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: NormalText(
          text: "My Address",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: NormalText(
              text: "My Address",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A202020),
                  offset: Offset(0, 4),
                  blurRadius: 50,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: ListTile(
              onTap: () {
                GoRouter.of(context).push(Routes.SAVE_ADDRESS);
              },
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.add,
                color: AppColors.secondary,
              ),
              title: NormalText(
                text: "Add Address",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.secondary),
              ),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: NormalText(
              text: "Saved Address",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: "Home",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          NormalText(
                            text:
                                "Sheikh Mohammed Bin Rashed Boulevard Downtown, Dubai",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: AppColors.greyDark,
                                ),
                          ),
                          NormalText(
                              text: "Phone Number : +91 9995599955",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.greyDark,
                                  )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Edit",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.secondary,
                                        ),
                                  )),
                              const SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Delete",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColors.secondary,
                                      ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColors.greyDark.withOpacity(.3),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
