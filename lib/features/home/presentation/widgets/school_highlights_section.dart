import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../data/datasources/school_data.dart';

class SchoolHighlightsSection extends StatelessWidget {
  const SchoolHighlightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      color: AppColors.background,
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
                'Why Choose Pearl School',
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

              SizedBox(height: AppConstants.spaceL),

              // Grid of highlights
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 2 : 4,
                  mainAxisSpacing: AppConstants.spaceL,
                  crossAxisSpacing: AppConstants.spaceL,
                  childAspectRatio: isMobile ? 0.9 : 1.0,
                ),
                itemCount: schoolHighlights.length,
                itemBuilder: (context, index) {
                  final highlight = schoolHighlights[index];
                  return _HighlightCard(
                    highlight: highlight,
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final HighlightItem highlight;
  final int index;

  const _HighlightCard({
    required this.highlight,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppConstants.radiusL),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          child: Padding(
            padding: EdgeInsets.all(AppConstants.spaceM),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icon emoji
                Text(
                  highlight.icon,
                  style: const TextStyle(fontSize: 40),
                )
                    .animate(delay: (index * 100).ms)
                    .fadeIn(duration: AppConstants.animationSlow)
                    .scale(begin: const Offset(0.5, 0.5)),

                SizedBox(height: AppConstants.spaceM),

                // Title
                Text(
                  highlight.title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate(delay: (index * 100 + 100).ms)
                    .fadeIn(duration: AppConstants.animationSlow)
                    .slideY(begin: 0.2),

                SizedBox(height: AppConstants.spaceS),

                // Value badge
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.spaceM,
                    vertical: AppConstants.spaceXS,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.buttonPrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  child: Text(
                    highlight.value,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonPrimary,
                    ),
                  ),
                )
                    .animate(delay: (index * 100 + 200).ms)
                    .fadeIn(duration: AppConstants.animationSlow),

                SizedBox(height: AppConstants.spaceM),

                // Description
                Text(
                  highlight.description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
                    .animate(delay: (index * 100 + 300).ms)
                    .fadeIn(duration: AppConstants.animationSlow),
              ],
            ),
          ),
        ),
      ),
    ).animate(delay: (index * 100).ms)
        .fadeIn(duration: AppConstants.animationSlow)
        .slideY(begin: 0.2);
  }
}
