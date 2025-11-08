import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../data/datasources/school_data.dart';

class SchoolFooter extends StatelessWidget {
  const SchoolFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppConstants.spaceL : (isTablet ? AppConstants.spaceXL : AppConstants.spaceXXL),
        vertical: isMobile ? AppConstants.spaceXL : AppConstants.spaceXXL,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              // Main footer content
              if (!isMobile)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // School info
                    Expanded(
                      flex: 3,
                      child: _buildSchoolInfo(),
                    ),
                    SizedBox(width: AppConstants.spaceXXL),
                    // Navigation links
                    Expanded(
                      flex: 2,
                      child: _buildNavigationLinks(),
                    ),
                    SizedBox(width: AppConstants.spaceXL),
                    // Quick links
                    Expanded(
                      flex: 2,
                      child: _buildQuickLinks(),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSchoolInfo(),
                    SizedBox(height: AppConstants.spaceXL),
                    _buildNavigationLinks(),
                    SizedBox(height: AppConstants.spaceXL),
                    _buildQuickLinks(),
                  ],
                ),

              SizedBox(height: AppConstants.spaceXXL),

              // Divider
              Container(
                height: 1,
                color: Colors.white.withOpacity(0.2),
              ),

              SizedBox(height: AppConstants.spaceXL),

              // Bottom footer
              if (!isMobile)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '© 2025 Pearl Matriculation Higher Secondary School. All rights reserved.',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Privacy Policy',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                        Text(
                          ' • ',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Terms & Conditions',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '© 2025 Pearl Matriculation Higher Secondary School. All rights reserved.',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: AppConstants.spaceM),
                    Wrap(
                      spacing: AppConstants.spaceS,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Privacy Policy',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                        Text(
                          '•',
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Terms',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSchoolInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pearl Matriculation\nHigher Secondary School',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.3,
          ),
        )
            .animate()
            .fadeIn(duration: AppConstants.animationSlow)
            .slideX(begin: -0.2),

        SizedBox(height: AppConstants.spaceM),

        Text(
          SchoolData.subTagline,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.8),
            height: 1.5,
          ),
        )
            .animate()
            .fadeIn(duration: AppConstants.animationSlow, delay: 100.ms)
            .slideY(begin: 0.2),

        SizedBox(height: AppConstants.spaceL),

        // Tagline
        Text(
          'Study • Serve • Shine',
          style: GoogleFonts.crimsonText(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.9),
            fontStyle: FontStyle.italic,
          ),
        )
            .animate()
            .fadeIn(duration: AppConstants.animationSlow, delay: 200.ms),
      ],
    );
  }

  Widget _buildNavigationLinks() {
    final links = [
      'Home',
      'About Us',
      'Academics',
      'Gallery',
      'Admissions',
      'Contact',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        )
            .animate()
            .fadeIn(duration: AppConstants.animationSlow)
            .slideX(begin: -0.2),

        SizedBox(height: AppConstants.spaceL),

        ...List.generate(
          links.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: AppConstants.spaceM),
            child: _FooterLink(
              text: links[index],
              delay: 100 * (index + 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        )
            .animate()
            .fadeIn(duration: AppConstants.animationSlow)
            .slideX(begin: 0.2),

        SizedBox(height: AppConstants.spaceL),

        _FooterContactItem(
          text: SchoolData.primaryPhone,
          icon: Icons.phone,
          delay: 100,
          onTap: () => launchUrl(Uri.parse('tel:${SchoolData.primaryPhone}')),
        ),

        SizedBox(height: AppConstants.spaceM),

        _FooterContactItem(
          text: SchoolData.email,
          icon: Icons.email,
          delay: 200,
          onTap: () => launchUrl(Uri.parse('mailto:${SchoolData.email}')),
        ),

        SizedBox(height: AppConstants.spaceL),

        // Social Media
        Text(
          'Follow Us',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.8),
          ),
        )
            .animate()
            .fadeIn(duration: AppConstants.animationSlow, delay: 300.ms),

        SizedBox(height: AppConstants.spaceM),

        Row(
          children: [
            _SocialMediaIcon(
              icon: Icons.facebook,
              delay: 400,
              url: 'https://www.facebook.com/Pearlmatricschool/',
            ),
            SizedBox(width: AppConstants.spaceM),
            _SocialMediaIcon(
              icon: Icons.camera_alt,
              delay: 500,
              url: 'https://www.instagram.com/pearlmatric/',
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;
  final int delay;

  const _FooterLink({
    required this.text,
    required this.delay,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: _isHovered ? Colors.white : Colors.white.withOpacity(0.8),
            decoration: _isHovered ? TextDecoration.underline : null,
          ),
        ),
      ),
    )
        .animate(delay: (widget.delay).ms)
        .fadeIn(duration: AppConstants.animationSlow);
  }
}

class _FooterContactItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final int delay;
  final VoidCallback? onTap;

  const _FooterContactItem({
    required this.text,
    required this.icon,
    required this.delay,
    this.onTap,
  });

  @override
  State<_FooterContactItem> createState() => _FooterContactItemState();
}

class _FooterContactItemState extends State<_FooterContactItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: Colors.white.withOpacity(_isHovered ? 1.0 : 0.8),
                size: 16,
              ),
              SizedBox(width: AppConstants.spaceS),
              Expanded(
                child: Text(
                  widget.text,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(_isHovered ? 1.0 : 0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(delay: (widget.delay).ms)
        .fadeIn(duration: AppConstants.animationSlow);
  }
}

class _SocialMediaIcon extends StatefulWidget {
  final IconData icon;
  final int delay;
  final String url;

  const _SocialMediaIcon({
    required this.icon,
    required this.delay,
    required this.url,
  });

  @override
  State<_SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<_SocialMediaIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(_isHovered ? 1.0 : 0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => launchUrl(Uri.parse(widget.url)),
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
            child: Icon(
              widget.icon,
              color: Colors.white.withOpacity(_isHovered ? 1.0 : 0.8),
              size: 16,
            ),
          ),
        ),
      ),
    )
        .animate(delay: (widget.delay).ms)
        .fadeIn(duration: AppConstants.animationSlow)
        .scale(begin: const Offset(0.5, 0.5));
  }
}
