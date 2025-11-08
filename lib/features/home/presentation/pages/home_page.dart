import 'package:flutter/material.dart';
import 'package:tomarep/features/home/presentation/widgets/school_footer.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../widgets/school_hero_section.dart';
import '../widgets/school_highlights_section.dart';
import '../widgets/school_mission_vision_section.dart';
import '../widgets/school_news_section.dart';
import '../widgets/school_contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _highlightsKey = GlobalKey();
  final GlobalKey _missionKey = GlobalKey();
  final GlobalKey _newsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: AppConstants.animationSlow,
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: AppConstants.animationSlow,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Navigation space - responsive
                SizedBox(
                  height: ResponsiveHelper.getResponsiveValue(
                    context: context,
                    mobile: AppConstants.navHeightMobile,
                    tablet: AppConstants.navHeightTablet,
                    desktop: AppConstants.navHeightDesktop,
                  ),
                ),

                // School Hero Section
                SchoolHeroSection(
                  key: _heroKey,
                  onGetInfoPressed: () => _scrollToSection(_contactKey),
                  onLearnMorePressed: () => _scrollToSection(_highlightsKey),
                ),

                _buildSectionSpacing(context),

                // School Highlights Section
                SchoolHighlightsSection(key: _highlightsKey),

                _buildSectionSpacing(context),

                // Mission, Vision, Goals Section
                SchoolMissionVisionSection(key: _missionKey),

                _buildSectionSpacing(context),

                // Latest News Section
                SchoolNewsSection(key: _newsKey),

                _buildSectionSpacing(context),

                // Contact & Inquiry Section
                SchoolContactSection(key: _contactKey),

                // Footer
                SchoolFooter(key: _footerKey),
              ],
            ),
          ),

          // Fixed Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomNavigationBar(
              onHomePressed: _scrollToTop,
              onAboutPressed: () => _scrollToSection(_highlightsKey),
              onAcademicsPressed: () => _scrollToSection(_missionKey),
              onGalleryPressed: () => _scrollToSection(_newsKey),
              onAdmissionsPressed: () => _scrollToSection(_contactKey),
              onContactPressed: () => _scrollToSection(_contactKey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionSpacing(BuildContext context) {
    return SizedBox(
      height: ResponsiveHelper.getResponsiveValue(
        context: context,
        mobile: AppConstants.sectionSpacingMobile,
        tablet: AppConstants.sectionSpacingTablet,
        desktop: AppConstants.sectionSpacingDesktop,
      ),
    );
  }
}