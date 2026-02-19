import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('المزيد'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // User Profile Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: const Icon(Icons.person, size: 30, color: AppColors.primary),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'محمد أحمد',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+966 50 000 0000',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: AppColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Divider(),

            // Menu Items
            MenuItem(
              icon: Icons.person_outline,
              title: 'الملف الشخصي',
              onTap: () {},
            ),
            MenuItem(
              icon: Icons.location_on_outlined,
              title: 'عناويني',
              onTap: () {},
            ),
            MenuItem(
              icon: Icons.favorite_border,
              title: 'المفضلة',
              onTap: () {},
            ),
            MenuItem(
              icon: Icons.assignment_outlined,
              title: 'طلباتي',
              onTap: () {},
            ),
            const Divider(),
            MenuItem(
              icon: Icons.language,
              title: 'اللغة',
              trailing: const Text('العربية', style: TextStyle(color: AppColors.textSecondary)),
              onTap: () {},
            ),
            MenuItem(
              icon: Icons.notifications_outlined,
              title: 'الإشعارات',
              trailing: Switch(
                value: true,
                onChanged: (val) {},
                activeTrackColor: AppColors.primary,
              ),
              onTap: () {}, // Switch handles interaction usually
            ),
            const Divider(),
            MenuItem(
              icon: Icons.help_outline,
              title: 'المساعدة والدعم',
              onTap: () {},
            ),
            MenuItem(
              icon: Icons.privacy_tip_outlined,
              title: 'سياسة الخصوصية',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            MenuItem(
              icon: Icons.logout,
              title: 'تسجيل الخروج',
              textColor: AppColors.error,
              iconColor: AppColors.error,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color? textColor;
  final Color? iconColor;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.primary).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.primary, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? AppColors.textPrimary,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}
