import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/input_field_widget.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
        centerTitle: true,
        title: NormalText(
          text: "Personal",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                Positioned(
                    right: -20,
                    bottom: -10,
                    child: IconButton(
                        style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: AppColors.cardGrey),
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt)))
              ],
            ),
            const SizedBox(
              height: 15,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    InputField(
                      labelText: "Name",
                      feildRadius: BorderRadius.circular(10),
                      borderColor: AppColors.borderGrey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      labelText: "Mobile Number",
                      feildRadius: BorderRadius.circular(10),
                      borderColor: AppColors.borderGrey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      labelText: "Email ex:jon.smith@email.com",
                      feildRadius: BorderRadius.circular(10),
                      borderColor: AppColors.borderGrey,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: const Size(130, 40)),
                        onPressed: () {},
                        child: NormalText(
                          text: "Update",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
