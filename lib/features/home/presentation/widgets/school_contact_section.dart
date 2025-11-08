import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../data/datasources/school_data.dart';

class SchoolContactSection extends StatefulWidget {
  const SchoolContactSection({super.key});

  @override
  State<SchoolContactSection> createState() => _SchoolContactSectionState();
}

class _SchoolContactSectionState extends State<SchoolContactSection> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  String _gradeLevel = '';
  String _message = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Show confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Thank you! We will contact you soon.'),
          backgroundColor: AppColors.buttonPrimary,
          duration: const Duration(seconds: 3),
        ),
      );
      // Reset form
      _formKey.currentState!.reset();
      setState(() {
        _gradeLevel = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppConstants.spaceL : (isTablet ? AppConstants.spaceXL : AppConstants.spaceXXL),
        vertical: isMobile ? AppConstants.spaceXL : AppConstants.spaceXXL,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              // Section Title
              Text(
                'Get In Touch',
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: AppConstants.animationSlow)
                  .slideY(begin: 0.2),

              SizedBox(height: AppConstants.spaceM),

              Text(
                'Have questions? We\'d love to hear from you. Send us a message!',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: AppConstants.animationSlow, delay: 100.ms)
                  .slideY(begin: 0.2),

              SizedBox(height: AppConstants.spaceXL),

              // Two column layout - form and contact info
              if (!isMobile)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form
                    Expanded(
                      flex: 6,
                      child: _buildForm(context),
                    ),
                    SizedBox(width: AppConstants.spaceXXL),
                    // Contact Info
                    Expanded(
                      flex: 4,
                      child: _buildContactInfo(),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildForm(context),
                    SizedBox(height: AppConstants.spaceXL),
                    _buildContactInfo(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name field
          Text(
            'Full Name',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppConstants.spaceS),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Your name',
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.all(AppConstants.spaceM),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Please enter your name';
              return null;
            },
            onSaved: (value) => _name = value ?? '',
          ),

          SizedBox(height: AppConstants.spaceL),

          // Email field
          Text(
            'Email Address',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppConstants.spaceS),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'your.email@example.com',
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.all(AppConstants.spaceM),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Please enter your email';
              if (!value!.contains('@')) return 'Please enter a valid email';
              return null;
            },
            onSaved: (value) => _email = value ?? '',
          ),

          SizedBox(height: AppConstants.spaceL),

          // Phone field
          Text(
            'Phone Number',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppConstants.spaceS),
          TextFormField(
            decoration: InputDecoration(
              hintText: '9876543210',
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.all(AppConstants.spaceM),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Please enter your phone number';
              return null;
            },
            onSaved: (value) => _phone = value ?? '',
          ),

          SizedBox(height: AppConstants.spaceL),

          // Grade level field
          Text(
            'Grade Level (Optional)',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppConstants.spaceS),
          DropdownButtonFormField<String>(
            value: _gradeLevel.isEmpty ? null : _gradeLevel,
            items: [
              'KG',
              'Grade I',
              'Grade II',
              'Grade III',
              'Grade IV',
              'Grade V',
              'Grade VI',
              'Grade VII',
              'Grade VIII',
              'Grade IX',
              'Grade X',
              'Grade XI',
              'Grade XII',
            ]
                .map((grade) => DropdownMenuItem(
                      value: grade,
                      child: Text(grade),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() => _gradeLevel = value ?? '');
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.all(AppConstants.spaceM),
            ),
          ),

          SizedBox(height: AppConstants.spaceL),

          // Message field
          Text(
            'Message (Optional)',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppConstants.spaceS),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Tell us about your interest...',
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.all(AppConstants.spaceM),
            ),
            maxLines: 4,
            onSaved: (value) => _message = value ?? '',
          ),

          SizedBox(height: AppConstants.spaceXL),

          // Submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.spaceL,
                  vertical: AppConstants.spaceM,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
              ),
              child: Text(
                'Send Message',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(duration: AppConstants.animationSlow, delay: 600.ms)
              .scale(begin: const Offset(0.8, 0.8)),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: AppConstants.animationSlow)
        .slideX(begin: -0.2);
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        )
            .animate()
            .fadeIn(duration: AppConstants.animationSlow)
            .slideX(begin: 0.2),

        SizedBox(height: AppConstants.spaceL),

        // Address
        _ContactInfoItem(
          icon: Icons.location_on_outlined,
          title: 'Address',
          content: SchoolData.address,
          delay: 100,
        ),

        SizedBox(height: AppConstants.spaceL),

        // Admissions Phone
        _ContactInfoItem(
          icon: Icons.phone_outlined,
          title: 'Admissions Hotline',
          content: SchoolData.primaryPhone,
          delay: 200,
          onTap: () => launchUrl(Uri.parse('tel:${SchoolData.primaryPhone}')),
        ),

        SizedBox(height: AppConstants.spaceL),

        // Office Phone
        _ContactInfoItem(
          icon: Icons.phone_outlined,
          title: 'Office',
          content: SchoolData.officePhone,
          delay: 300,
          onTap: () => launchUrl(Uri.parse('tel:${SchoolData.officePhone}')),
        ),

        SizedBox(height: AppConstants.spaceL),

        // Accounts Phone
        _ContactInfoItem(
          icon: Icons.phone_outlined,
          title: 'Accounts',
          content: SchoolData.accountsPhone,
          delay: 400,
          onTap: () => launchUrl(Uri.parse('tel:${SchoolData.accountsPhone}')),
        ),

        SizedBox(height: AppConstants.spaceL),

        // Email
        _ContactInfoItem(
          icon: Icons.email_outlined,
          title: 'Email',
          content: SchoolData.email,
          delay: 500,
          onTap: () => launchUrl(Uri.parse('mailto:${SchoolData.email}')),
        ),
      ],
    );
  }
}

class _ContactInfoItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;
  final int delay;
  final VoidCallback? onTap;

  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
    required this.delay,
    this.onTap,
  });

  @override
  State<_ContactInfoItem> createState() => _ContactInfoItemState();
}

class _ContactInfoItemState extends State<_ContactInfoItem> {
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
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          child: Padding(
            padding: EdgeInsets.all(AppConstants.spaceM),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.buttonPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  child: Icon(
                    widget.icon,
                    color: AppColors.buttonPrimary,
                    size: 20,
                  ),
                )
                    .animate(delay: (widget.delay).ms)
                    .fadeIn(duration: AppConstants.animationSlow)
                    .scale(begin: const Offset(0.5, 0.5)),
                SizedBox(width: AppConstants.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textMuted,
                        ),
                      ),
                      SizedBox(height: AppConstants.spaceXS),
                      Text(
                        widget.content,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: _isHovered ? AppColors.buttonPrimary : AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                )
                    .animate(delay: (widget.delay + 100).ms)
                    .fadeIn(duration: AppConstants.animationSlow)
                    .slideX(begin: -0.2),
              ],
            ),
          ),
        ),
      ),
    )
        .animate(delay: (widget.delay).ms)
        .fadeIn(duration: AppConstants.animationSlow)
        .slideX(begin: 0.2);
  }
}
