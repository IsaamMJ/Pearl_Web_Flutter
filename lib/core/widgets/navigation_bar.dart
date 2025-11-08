import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../components/nav_bar_item_button.dart';

class CustomNavigationBar extends StatefulWidget {
  final VoidCallback? onHomePressed;
  final VoidCallback? onAboutPressed;
  final VoidCallback? onAcademicsPressed;
  final VoidCallback? onGalleryPressed;
  final VoidCallback? onAdmissionsPressed;
  final VoidCallback? onContactPressed;
  final String? activeRoute;

  const CustomNavigationBar({
    super.key,
    this.onHomePressed,
    this.onAboutPressed,
    this.onAcademicsPressed,
    this.onGalleryPressed,
    this.onAdmissionsPressed,
    this.onContactPressed,
    this.activeRoute,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.getResponsiveValue(
        context: context,
        mobile: 70.0,
        tablet: 80.0,
        desktop: 85.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.navBackground,
        border: Border(
          bottom: BorderSide(color: AppColors.navBorder, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: ResponsiveHelper.getHorizontalPadding(context),
            child: Row(
              children: [
                // Logo - School Logo Image + School Name
                GestureDetector(
                  onTap: widget.onHomePressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: ResponsiveHelper.getResponsiveValue(
                          context: context,
                          mobile: 75.0,
                          tablet: 85.0,
                          desktop: 85.0,
                        ),
                        width: ResponsiveHelper.getResponsiveValue(
                          context: context,
                          mobile: 75.0,
                          tablet: 85.0,
                          desktop: 85.0,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/School/Pearl_logo.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                if (ResponsiveHelper.isDesktop(context)) ...[
                  const Spacer(),
                  _buildDesktopNavigation(),
                  const Spacer(),
                  _buildActionButtons(),
                ] else ...[
                  const Spacer(),
                  _buildMobileMenuButton(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.navBackground.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.navBorder.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          NavBarItemButton(
            title: 'Home',
            onPressed: widget.onHomePressed,
            isActive: widget.activeRoute == '/home',
          ),
          NavBarItemButton(
            title: 'About Us',
            onPressed: widget.onAboutPressed,
            isActive: widget.activeRoute == '/about',
          ),
          NavBarItemButton(
            title: 'Academics',
            onPressed: widget.onAcademicsPressed,
            isActive: widget.activeRoute == '/academics',
          ),
          NavBarItemButton(
            title: 'Gallery',
            onPressed: widget.onGalleryPressed,
            isActive: widget.activeRoute == '/gallery',
          ),
          NavBarItemButton(
            title: 'Admissions',
            onPressed: widget.onAdmissionsPressed,
            isActive: widget.activeRoute == '/admissions',
          ),
          NavBarItemButton(
            title: 'Contact',
            onPressed: widget.onContactPressed,
            isActive: widget.activeRoute == '/contact',
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        EnhancedPrimaryButton(
          label: 'Get Information',
          icon: Icons.info_outline,
          onPressed: widget.onContactPressed,
        ),
      ],
    );
  }

  Widget _buildMobileMenuButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _isMenuOpen
            ? AppColors.textPrimary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() => _isMenuOpen = !_isMenuOpen);
          HapticFeedback.lightImpact();
          _showMobileMenu();
        },
        child: AnimatedRotation(
          turns: _isMenuOpen ? 0.5 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            _isMenuOpen ? Icons.close : Icons.menu,
            color: AppColors.textPrimary,
            size: 24,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      isScrollControlled: true,
      builder: (context) => Container(
        margin: const EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          color: AppColors.navBackground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.navBorder,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),

              // Menu items
              _buildMenuItem('Home', Icons.home_outlined, () {
                Navigator.pop(context);
                widget.onHomePressed?.call();
              }),
              _buildMenuItem('About Us', Icons.info_outlined, () {
                Navigator.pop(context);
                widget.onAboutPressed?.call();
              }),
              _buildMenuItem('Academics', Icons.school_outlined, () {
                Navigator.pop(context);
                widget.onAcademicsPressed?.call();
              }),
              _buildMenuItem('Gallery', Icons.photo_library_outlined, () {
                Navigator.pop(context);
                widget.onGalleryPressed?.call();
              }),
              _buildMenuItem('Admissions', Icons.assignment_outlined, () {
                Navigator.pop(context);
                widget.onAdmissionsPressed?.call();
              }),
              _buildMenuItem('Contact', Icons.contact_mail_outlined, () {
                Navigator.pop(context);
                widget.onContactPressed?.call();
              }),

              const SizedBox(height: 24),

              // Action button
              EnhancedPrimaryButton(
                label: 'Get Information',
                icon: Icons.info_outline,
                isFullWidth: true,
                onPressed: () {
                  Navigator.pop(context);
                  widget.onContactPressed?.call();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ).then((_) => setState(() => _isMenuOpen = false));
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback? onPressed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.navText, size: 20),
        title: Text(
          title,
          style: AppTextStyles.navItem.copyWith(color: AppColors.navText),
        ),
        onTap: () {
          Navigator.pop(context);
          HapticFeedback.selectionClick();
          onPressed?.call();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}