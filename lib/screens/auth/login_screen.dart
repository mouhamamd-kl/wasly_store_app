// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wasly/screens/auth/email_confirm_screen.dart';
// import 'package:wasly/screens/auth/forgot_password_screen.dart';
// import 'package:wasly/screens/auth/signup_screen.dart';
// import 'package:wasly/screens/auth/starting_location_screen.dart';
// import 'package:wasly/screens/auth/verification_screen.dart';
// import 'package:wasly_template/core/widgets/field/custom_password_field.dart';
// import 'package:wasly_template/core/widgets/field/custom_text_field.dart';
// import 'package:wasly_template/wasly_template.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         actions: [],
//       ),
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: const TextHeading3(
//                         text: "Welcome Back!",
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     // const SizedBox(height: 8),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: TextParagraph3(
//                         text: "Sign in with your email and password",
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//                 // const SizedBox(height: 16),
//                 // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//                 Align(alignment: Alignment.center, child: SignInForm()),
//                 // SizedBox(height: MediaQuery.of(context).size.height * 0.2),
//                 // const SizedBox(height: 16),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: CustomRichTextButton(
//                     firstText: "Don’t have account? ",
//                     secondText: "Sign Up",
//                     onPressed: () {
//                       Get.to(SignupScreen());
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignInForm extends StatefulWidget {
//   const SignInForm({super.key});

//   @override
//   State<SignInForm> createState() => _SignInFormState();
// }

// class _SignInFormState extends State<SignInForm> {
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           CustomTextField(
//             hintText: "Enter Your Email",
//             defaultIcon: AppConstants.getIconPath("message.svg"),
//             focusedIcon: AppConstants.getIconPath("message_off.svg"),
//             onChanged: (email) {
//               print("Email: $email");
//             },
//             onSaved: (email) {
//               print("Saved Email: $email");
//             },
//           ),
//           const SizedBox(height: 8),
//           CustomPasswordField(
//             controller: _passwordController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return "Password cannot be empty";
//               } else if (value.length < 8) {
//                 return "Password must be at least 8 characters long";
//               }
//               return null;
//             },
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: TextButton(
//               style: ButtonStyle(elevation: WidgetStateProperty.all<double>(0)),
//               onPressed: () async {
//                 await Get.to(() => ForgotPasswordScreen());
//               },
//               child: TextButton4(
//                 text: "forgot password ?",
//                 color: AppColors.primaryBase,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: MediaQuery.sizeOf(context).width,
//             child: CustomTextButtonActive(
//               radius: 100,
//               text: "Continue",
//               onClick: () async {
//                 await Get.to(() => VerificationScreen());
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasly_store/controllers/services/auth/customer_auth_service.dart';
import 'package:wasly_store/screens/auth/email_confirm_screen.dart';
import 'package:wasly_store/screens/auth/forgot_password_screen.dart';
import 'package:wasly_store/screens/auth/signup_screen.dart';
import 'package:wasly_store/screens/auth/starting_location_screen.dart';
import 'package:wasly_store/screens/auth/verification_screen.dart';
import 'package:wasly_store/screens/home_store_screen.dart';
import 'package:wasly_template/core/widgets/field/custom_password_field.dart';
import 'package:wasly_template/core/widgets/field/custom_text_field.dart';
import 'package:wasly_template/wasly_template.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const TextHeading3(
                        text: "Welcome Back!",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextParagraph3(
                        text: "Sign in with your email and password",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Align(alignment: Alignment.center, child: SignInForm()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomRichTextButton(
                    firstText: "Don't have account? ",
                    secondText: "Sign Up",
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CustomerAuthService _authService = CustomerAuthService();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.login(
        _emailController.text,
        _passwordController.text,
      );
      // Navigate to home screen or dashboard after successful login
      Get.offAll(() => HomeStoreScreen()); // Replace with your home screen
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            hintText: "Enter Your Email",
            defaultIcon: AppConstants.getIconPath("message.svg"),
            focusedIcon: AppConstants.getIconPath("message_off.svg"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email cannot be empty";
              }
              if (!GetUtils.isEmail(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomPasswordField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password cannot be empty";
              } else if (value.length < 8) {
                return "Password must be at least 8 characters long";
              }
              return null;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: ButtonStyle(elevation: WidgetStateProperty.all<double>(0)),
              onPressed: () async {
                await Get.to(() => ForgotPasswordScreen());
              },
              child: TextButton4(
                text: "forgot password ?",
                color: AppColors.primaryBase,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomTextButtonActive(
                    radius: 100,
                    text: "Continue",
                    onClick: _handleLogin,
                  ),
          )
        ],
      ),
    );
  }
}
