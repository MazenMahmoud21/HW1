import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('إنشاء حساب'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'أهلاً بك',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'قم بإنشاء حساب جديد للاستمتاع بخدماتنا',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _nameController,
                label: 'الاسم الكامل',
                hint: 'الاسم هنا',
                prefixIcon: const Icon(Icons.person_outline, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                label: 'البريد الإلكتروني',
                hint: 'example@email.com',
                prefixIcon: const Icon(Icons.email_outlined, color: AppColors.textSecondary),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                label: 'رقم الهاتف',
                hint: '05xxxxxxxx',
                prefixIcon: const Icon(Icons.phone_outlined, color: AppColors.textSecondary),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                label: 'كلمة المرور',
                hint: '********',
                prefixIcon: const Icon(Icons.lock_outline, color: AppColors.textSecondary),
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _confirmPasswordController,
                label: 'تأكيد كلمة المرور',
                hint: '********',
                prefixIcon: const Icon(Icons.lock_outline, color: AppColors.textSecondary),
                obscureText: !_isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'إنشاء حساب',
                onPressed: () {
                  // Handle Register
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'لديك حساب بالفعل؟',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
