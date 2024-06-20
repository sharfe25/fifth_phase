import 'package:ecommerce_design_system_package/ecommerce_design_system_package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../molecules/card_container.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_spacing.dart';
import '../tokens/app_text_styles.dart';

/// A screen that allows users to log in to the application.
///
/// The [LoginPage] widget provides UI elements for users to enter their
/// username and password. It uses an [AuthProvider] to manage authentication
/// and form validation.
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: AppColors.grayColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/shop.png',
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              const CardContainer(
                title: 'Welcome',
                subtitle: 'Please enter your data to continue',
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
                        onChanged: () => authProvider.isValidLogin(),
                        controller: authProvider.usernameController,
                        label: 'Username',
                      ),
                      const SizedBox(
                        height: AppSpacing.xLarge,
                      ),
                      CustomInput(
                        onChanged: () => authProvider.isValidLogin(),
                        isObscure: true,
                        controller: authProvider.pswdController,
                        label: 'Password',
                      ),
                      const SizedBox(
                        height: AppSpacing.xLarge,
                      ),
                      CustomButtonWidget(
                        enabled: authProvider.isValidLoginForm,
                        onPressed: () => authProvider.login(context: context),
                        text: 'Login',
                      ),
                      TextButton(
                        onPressed: () {
                          authProvider.clearProvider();
                          Navigator.pushNamed(
                            context,
                            '/sign_up',
                          );
                        },
                        child: const Text(
                          'Create new account',
                          style: AppTextStyles.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
