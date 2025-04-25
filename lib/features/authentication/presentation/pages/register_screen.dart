import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ibuild_vendor/core/constant/app_assets.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/app_logger.dart';
import 'package:ibuild_vendor/core/utils/app_utils/validator.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/input_field_widget.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/features/authentication/presentation/widgets/other_sign_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SvgPicture.asset(AppSvgs.logo),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Create your account',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                title: "Name",
                controller: nameController,
                labelText: "",
                hintText: "ex: jon smith",
                validator: (val) => Validator.validateName(val, 'Name'),
                titleStyle: Theme.of(context).textTheme.bodyLarge!,
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                title: "Email",
                controller: emailController,
                validator: Validator.validateEmail,
                labelText: "",
                hintText: "ex: jon.smith@email.com",
                titleStyle: Theme.of(context).textTheme.bodyLarge!,
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                title: "Password",
                controller: passwordController,
                labelText: "",
                hintText: "*********",
                validator: Validator.validatePassword,
                titleStyle: Theme.of(context).textTheme.bodyLarge!,
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                title: "Confirm password",
                labelText: "",
                hintText: "*********",
                controller: confirmPasswordController,
                validator: (val) => Validator.validateConfirmPassword(
                    val, passwordController.text.trim()),
                titleStyle: Theme.of(context).textTheme.bodyLarge!,
              ),
              CheckboxListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  activeColor: AppColors.secondary,
                  checkColor: AppColors.primary,
                  value: true,
                  enableFeedback: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {},
                  visualDensity: VisualDensity.compact,
                  title: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      text: "I understood the ",
                      children: [
                        TextSpan(
                          text: "terms",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.secondary,
                                    decoration: TextDecoration.underline,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AppLogger.logInfo("Terms tapped");
                            },
                        ),
                        TextSpan(
                          text: " & ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: "policy",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.secondary,
                                    decoration: TextDecoration.underline,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              AppLogger.logInfo("Policy tapped");
                            },
                        ),
                        TextSpan(
                          text: ".",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).push(Routes.SKELETON);
                  }
                },
                child: NormalText(
                  text: 'SIGN UP',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              NormalText(
                text: "or sign up with",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                OtherSignInButton(
                  onTap: () {},
                  child: const Icon(
                    Icons.facebook,
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.grey),
                  children: [
                    TextSpan(
                      text: "SIGN IN",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.secondary,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          GoRouter.of(context).go(Routes.LOGIN);
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
