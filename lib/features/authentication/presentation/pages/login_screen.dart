import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ibuild_vendor/core/constant/app_assets.dart';
import 'package:ibuild_vendor/core/router/go_route.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/validator.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/input_field_widget.dart';
import 'package:ibuild_vendor/core/utils/common_widgets.dart/normal_text.dart';
import 'package:ibuild_vendor/features/authentication/presentation/widgets/other_sign_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              SvgPicture.asset(AppSvgs.logo),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sign in your account',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                title: "Email",
                labelText: "",
                hintText: "ex: jon.smith@email.com",
                controller: emailController,
                titleStyle: Theme.of(context).textTheme.bodyLarge!,
                validator: Validator.validateEmail,
              ),
              const SizedBox(
                height: 10,
              ),
              InputField(
                title: "Password",
                labelText: "",
                hintText: "*********",
                controller: passwordController,
                validator: Validator.validatePassword,
                titleStyle: Theme.of(context).textTheme.bodyLarge!,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      Routes.FORGOT,
                    );
                  },
                  child: NormalText(
                    text: "Forgot password?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).go(Routes.SKELETON);
                  }
                },
                child: NormalText(
                  text: 'SIGN IN',
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
                text: "or sign in with",
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
                    Icons.login,
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.grey),
                  children: [
                    TextSpan(
                      text: "SIGN UP",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.secondary,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          GoRouter.of(context).go(Routes.REGISTER);
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
