import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../features/auth/presentation/pages/login_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.secondary,
              child: Icon(Icons.person, size: 30, color: AppColors.primary),
            ),
            title: const Text('اسم المستخدم', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            subtitle: const Text('0551234567'),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: AppColors.primary),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 30),
          _buildMenuItem(context, Icons.person_outline, 'الملف الشخصي', () {}),
          _buildMenuItem(context, Icons.shopping_bag_outlined, 'طلباتي', () {}),
          _buildMenuItem(context, Icons.location_on_outlined, 'عناويني', () {}),
          _buildMenuItem(context, Icons.settings_outlined, 'الإعدادات', () {}),
          _buildMenuItem(context, Icons.language, 'تغيير اللغة', () {}),
          _buildMenuItem(context, Icons.help_outline, 'المساعدة والدعم', () {}),
          const Divider(),
          _buildMenuItem(context, Icons.logout, 'تسجيل الخروج', () {
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
          }, isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isDestructive ? AppColors.error.withValues(alpha: 0.1) : AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: isDestructive ? AppColors.error : AppColors.primary),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDestructive ? AppColors.error : AppColors.textPrimary,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
      onTap: onTap,
    );
  }
}
