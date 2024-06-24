import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';

import '../../providers/auth_provider.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A screen that allows users to sign up for a new account.
///
/// The [SignUpPage] widget provides input fields for users to enter their
/// name, last name, username, email, and password. It utilizes an [AuthProvider]
/// to manage the sign-up process and validate user inputs.
class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: AppColors.grayColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Sign Up',
              onTapBack: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: AppSpacing.medium),
              child: Column(
                children: [
                  const SizedBox(
                    height: AppSpacing.medium,
                  ),
                  Image.asset(
                    'assets/shop.png',
                    height: 150,
                  ),
                  const SizedBox(
                    height: AppSpacing.medium,
                  ),
                  const Text(
                    'Sign Up',
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(
                    height: AppSpacing.medium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      child: Column(
                        children: [
                          CustomInput(
                            key: const Key('name_field'),
                            onChanged: authProvider.isValidSignUp,
                            controller: authProvider.nameController,
                            label: 'Name',
                          ),
                          const SizedBox(
                            height: AppSpacing.xLarge,
                          ),
                          CustomInput(
                            key: const Key('last_name_field'),
                            onChanged: authProvider.isValidSignUp,
                            controller: authProvider.lastNameController,
                            label: 'Last name',
                          ),
                          const SizedBox(
                            height: AppSpacing.xLarge,
                          ),
                          CustomInput(
                            key: const Key('username_field'),
                            onChanged: authProvider.isValidSignUp,
                            controller: authProvider.usernameController,
                            label: 'Username',
                          ),
                          const SizedBox(
                            height: AppSpacing.xLarge,
                          ),
                          CustomInput(
                            key: const Key('email_field'),
                            onChanged: authProvider.isValidSignUp,
                            controller: authProvider.emailController,
                            label: 'Email',
                          ),
                          const SizedBox(
                            height: AppSpacing.xLarge,
                          ),
                          CustomInput(
                            key: const Key('password_field'),
                            onChanged: authProvider.isValidSignUp,
                            isObscure: true,
                            controller: authProvider.pswdController,
                            label: 'Password',
                          ),
                          const SizedBox(
                            height: AppSpacing.xLarge,
                          ),
                          CustomButtonWidget(
                            key: const Key('sign_up_btn'),
                            enabled: authProvider.isValidSignUpForm,
                            onPressed: () =>
                                authProvider.signUp(context: context),
                            text: 'Register',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/login',
                              );
                              authProvider.clearProvider();
                            },
                            child: const Text(
                              'Do you already have an account?',
                              style: AppTextStyles.subtitle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
