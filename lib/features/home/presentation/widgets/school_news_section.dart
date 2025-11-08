import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../data/datasources/school_data.dart';

class SchoolNewsSection extends StatelessWidget {
  const SchoolNewsSection({super.key});

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
              // Section Title and Subtitle
              Text(
                'Latest News & Achievements',
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
                'Celebrating Excellence and Academic Achievements',
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

              // Horizontal scrollable news list
              SizedBox(
                height: isMobile ? 320 : 360,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.spaceM),
                  child: Row(
                    children: List.generate(
                      SchoolData.latestNews.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: AppConstants.spaceL),
                        child: _NewsCard(
                          newsItem: SchoolData.latestNews[index],
                          index: index,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppConstants.spaceXL),

              // View All button
              Container(
                decoration: BoxDecoration(
                  color: AppColors.buttonSecondary,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.spaceL,
                        vertical: AppConstants.spaceM,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View All News',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: AppConstants.spaceS),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: AppConstants.animationSlow, delay: 400.ms)
                  .scale(begin: const Offset(0.8, 0.8)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsCard extends StatefulWidget {
  final NewsItem newsItem;
  final int index;

  const _NewsCard({
    required this.newsItem,
    required this.index,
  });

  @override
  State<_NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<_NewsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        width: isMobile ? 280 : 320,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
          border: Border.all(
            color: _isHovered ? AppColors.primary : AppColors.primary.withOpacity(0.1),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(_isHovered ? 0.15 : 0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
            child: Padding(
              padding: EdgeInsets.all(AppConstants.spaceL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category badge
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.spaceM,
                      vertical: AppConstants.spaceXS,
                    ),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(widget.newsItem.category).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(AppConstants.radiusS),
                    ),
                    child: Text(
                      widget.newsItem.category,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: _getCategoryColor(widget.newsItem.category),
                      ),
                    ),
                  ),

                  SizedBox(height: AppConstants.spaceM),

                  // Title
                  Text(
                    widget.newsItem.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: AppConstants.spaceM),

                  // Description
                  Text(
                    widget.newsItem.description,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: AppConstants.spaceL),

                  // Divider
                  Divider(
                    color: AppColors.primary.withOpacity(0.1),
                    height: 1,
                  ),

                  SizedBox(height: AppConstants.spaceM),

                  // Date and views
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.newsItem.date,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                      Text(
                        widget.newsItem.views,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
        .animate(delay: (widget.index * 100).ms)
        .fadeIn(duration: AppConstants.animationSlow)
        .slideX(begin: 0.2);
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Achievement':
        return const Color(0xFFDC143C); // Red
      case 'Results':
        return const Color(0xFF003E7E); // Blue
      case 'Admissions':
        return const Color(0xFF008B8B); // Teal
      default:
        return AppColors.textSecondary;
    }
  }
}
