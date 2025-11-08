import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_constants.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/components/nav_bar_item_button.dart';
import '../../data/datasources/school_data.dart';

class SchoolHeroSection extends StatelessWidget {
  final VoidCallback? onGetInfoPressed;
  final VoidCallback? onLearnMorePressed;

  const SchoolHeroSection({
    super.key,
    this.onGetInfoPressed,
    this.onLearnMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final heroHeight = screenHeight > 600
        ? (isMobile ? screenHeight * 0.75 : screenHeight * 0.85)
        : (isMobile ? 500.0 : 600.0);

    return Container(
      height: heroHeight,
      width: double.infinity,
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Container(
            margin: ResponsiveHelper.getHorizontalPadding(context),
            height: heroHeight - (isMobile ? AppConstants.spaceXXL : AppConstants.spaceHuge),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isMobile ? AppConstants.radiusM : AppConstants.radiusXXL),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isMobile ? AppConstants.radiusM : AppConstants.radiusXXL),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  // Background image from school
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('assets/School/Hero_Section.JPG'),
                          fit: BoxFit.cover,
                          alignment: isMobile
                              ? const Alignment(0.5, -0.9)  // Show top part (building) - even higher
                              : const Alignment(0.5, -0.8), // Show top part (building) - even higher
                          opacity: isMobile ? 0.5 : 0.65,
                        ),
                      ),
                    ),
                  ),

                  // Gradient overlay for text readability - school blue
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: isMobile
                            ? [
                          AppColors.primary.withOpacity(0.85),
                          AppColors.primary.withOpacity(0.6),
                          AppColors.primary.withOpacity(0.3),
                          Colors.transparent,
                        ]
                            : [
                          AppColors.primary.withOpacity(0.75),
                          AppColors.primary.withOpacity(0.5),
                          AppColors.primary.withOpacity(0.2),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.3, 0.6, 1.0],
                      ),
                    ),
                  ),

                  // Content
                  Padding(
                    padding: EdgeInsets.all(isMobile ? AppConstants.spaceL : AppConstants.spaceXXL),
                    child: Row(
                      children: [
                        Expanded(
                          flex: isMobile ? 1 : 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                            children: [
                              // School Name (PRIMARY HEADING)
                              Text(
                                'Pearl Matriculation\nHigher Secondary School',
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 26 : 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  height: 1.3,
                                  letterSpacing: 0.3,
                                ),
                                textAlign: isMobile ? TextAlign.center : TextAlign.left,
                              )
                                  .animate()
                                  .fadeIn(duration: AppConstants.animationSlow, delay: 100.ms)
                                  .slideY(begin: 0.2),

                              SizedBox(height: isMobile ? AppConstants.spaceXS : AppConstants.spaceXS),

                              // Location (SMALL, SUPPORTING)
                              Text(
                                'Therekalputhoor, Tamil Nadu',
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 11 : 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.85),
                                  height: 1.3,
                                  letterSpacing: 0.2,
                                ),
                                textAlign: isMobile ? TextAlign.center : TextAlign.left,
                              )
                                  .animate()
                                  .fadeIn(duration: AppConstants.animationSlow, delay: 150.ms)
                                  .slideY(begin: 0.2),

                              SizedBox(height: isMobile ? AppConstants.spaceM : AppConstants.spaceL),

                              // Main Tagline (SECONDARY MESSAGE)
                              Text(
                                SchoolData.tagline,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 18 : 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white.withOpacity(0.95),
                                  height: 1.4,
                                ),
                                textAlign: isMobile ? TextAlign.center : TextAlign.left,
                              )
                                  .animate()
                                  .fadeIn(duration: AppConstants.animationSlow, delay: 200.ms)
                                  .slideX(begin: -0.3, end: 0),

                              SizedBox(height: isMobile ? AppConstants.spaceS : AppConstants.spaceM),

                              // Subtitle (SUPPORTING TEXT)
                              Text(
                                SchoolData.subTagline,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 13 : 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.85),
                                  height: 1.4,
                                ),
                                textAlign: isMobile ? TextAlign.center : TextAlign.left,
                              )
                                  .animate()
                                  .fadeIn(duration: AppConstants.animationSlow, delay: 300.ms)
                                  .slideX(begin: -0.2, end: 0),

                              SizedBox(height: isMobile ? AppConstants.spaceL : AppConstants.spaceXL),

                              // CTA Buttons
                              if (isMobile)
                                Column(
                                  children: [
                                    EnhancedPrimaryButton(
                                      label: 'Get More Information',
                                      icon: Icons.arrow_forward,
                                      onPressed: onGetInfoPressed ?? () {},
                                      isFullWidth: true,
                                    )
                                        .animate()
                                        .fadeIn(duration: AppConstants.animationSlow, delay: 800.ms)
                                        .scale(begin: const Offset(0.8, 0.8)),
                                    SizedBox(height: AppConstants.spaceM),
                                    OutlinedIconButton(
                                      label: 'Learn About Us',
                                      icon: Icons.info_outline,
                                      onPressed: onLearnMorePressed ?? () {},
                                      isFullWidth: true,
                                    )
                                        .animate()
                                        .fadeIn(duration: AppConstants.animationSlow, delay: 1000.ms)
                                        .scale(begin: const Offset(0.8, 0.8)),
                                  ],
                                )
                              else
                                Row(
                                  children: [
                                    EnhancedPrimaryButton(
                                      label: 'Get More Information',
                                      icon: Icons.arrow_forward,
                                      onPressed: onGetInfoPressed ?? () {},
                                    )
                                        .animate()
                                        .fadeIn(duration: AppConstants.animationSlow, delay: 800.ms)
                                        .scale(begin: const Offset(0.8, 0.8)),
                                    SizedBox(width: AppConstants.spaceL),
                                    OutlinedIconButton(
                                      label: 'Learn About Us',
                                      icon: Icons.info_outline,
                                      onPressed: onLearnMorePressed ?? () {},
                                    )
                                        .animate()
                                        .fadeIn(duration: AppConstants.animationSlow, delay: 1000.ms)
                                        .scale(begin: const Offset(0.8, 0.8)),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        if (!isMobile)
                          const Expanded(
                            flex: 4,
                            child: SizedBox(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
