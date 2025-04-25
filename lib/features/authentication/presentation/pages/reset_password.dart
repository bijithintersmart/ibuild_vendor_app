import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ibuild_vendor/core/constant/app_assets.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/validator.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/input_field_widget.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool showPassword = true;
  bool showConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 65,
            leading: IconButton(
              style: IconButton.styleFrom(
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
            actions: [
              SvgPicture.asset(
                AppSvgs.star,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            NormalText(
              text: "Reset password",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            NormalText(
              text: "Please type something you’ll remember",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black.withOpacity(.7),
                    letterSpacing: .7,
                  ),
            ),
            const SizedBox(
              height: 35,
            ),
            InputField(
              controller: passwordController,
              borderColor: AppColors.borderGrey,
              hintText: "must be 8 characters",
              labelText: 'password',
              obscuringCharacter: "*",
              obscureText: showPassword,
              title: "New password",
              maxLine: 1,
              suffix: PasswordIconWidget(
                isShown: showPassword,
                onPressed: () => setState(() {
                  showPassword = !showPassword;
                }),
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: Validator.validatePassword,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              controller: confirmPasswordController,
              borderColor: AppColors.borderGrey,
              hintText: "repeat password",
              maxLine: 1,
              obscureText: showConfirmPassword,
              labelText: 'Confirm password',
              title: "Confirm new password",
              obscuringCharacter: "*",
              suffix: PasswordIconWidget(
                isShown: showConfirmPassword,
                onPressed: () => setState(() {
                  showConfirmPassword = !showConfirmPassword;
                }),
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (val) => Validator.validateConfirmPassword(
                  val, passwordController.text.trim()),
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  GoRouter.of(context).go(Routes.RESET_SUCCESS);
                },
                child: NormalText(
                  text: "Reset password",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

class PasswordIconWidget extends StatelessWidget {
  final bool isShown;
  final Function()? onPressed;
  const PasswordIconWidget({
    super.key,
    required this.isShown,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          isShown ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ));
  }
}
