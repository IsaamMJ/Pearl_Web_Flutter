import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../data/datasources/school_data.dart';

class SchoolMissionVisionSection extends StatefulWidget {
  const SchoolMissionVisionSection({super.key});

  @override
  State<SchoolMissionVisionSection> createState() => _SchoolMissionVisionSectionState();
}

class _SchoolMissionVisionSectionState extends State<SchoolMissionVisionSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                'Our Foundation',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              )
                  .animate()
                  .fadeIn(duration: AppConstants.animationSlow)
                  .slideY(begin: 0.2),

              SizedBox(height: AppConstants.spaceXL),

              // Tab buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _TabButton(
                    label: 'Mission',
                    isSelected: _selectedIndex == 0,
                    onPressed: () => _tabController.animateTo(0),
                  ),
                  SizedBox(width: AppConstants.spaceM),
                  _TabButton(
                    label: 'Vision',
                    isSelected: _selectedIndex == 1,
                    onPressed: () => _tabController.animateTo(1),
                  ),
                  SizedBox(width: AppConstants.spaceM),
                  _TabButton(
                    label: 'Goals',
                    isSelected: _selectedIndex == 2,
                    onPressed: () => _tabController.animateTo(2),
                  ),
                ],
              ),

              SizedBox(height: AppConstants.spaceXL),

              // Content
              IndexedStack(
                index: _selectedIndex,
                children: [
                  // Mission
                  _ContentCard(
                    title: 'Our Mission',
                    content: SchoolData.mission,
                    icon: '🎯',
                  ),
                  // Vision
                  _ContentCard(
                    title: 'Our Vision',
                    content: SchoolData.vision,
                    icon: '👁️',
                  ),
                  // Goals
                  _GoalsCard(goals: SchoolData.goals),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spaceL,
            vertical: AppConstants.spaceM,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.buttonPrimary : Colors.transparent,
            border: Border.all(
              color: isSelected ? AppColors.buttonPrimary : AppColors.primary.withOpacity(0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    ).animate(target: isSelected ? 1.0 : 0.0)
        .scale(end: const Offset(1.05, 1.05));
  }
}

class _ContentCard extends StatelessWidget {
  final String title;
  final String content;
  final String icon;

  const _ContentCard({
    required this.title,
    required this.content,
    required this.icon,
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
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppConstants.spaceXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and title
          Row(
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 32),
              )
                  .animate()
                  .fadeIn(duration: AppConstants.animationSlow)
                  .scale(begin: const Offset(0.5, 0.5)),
              SizedBox(width: AppConstants.spaceM),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                )
                    .animate()
                    .fadeIn(duration: AppConstants.animationSlow)
                    .slideX(begin: -0.2),
              ),
            ],
          ),

          SizedBox(height: AppConstants.spaceL),

          // Content text
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          )
              .animate()
              .fadeIn(duration: AppConstants.animationSlow, delay: 200.ms)
              .slideY(begin: 0.2),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: AppConstants.animationSlow)
        .slideY(begin: 0.2);
  }
}

class _GoalsCard extends StatelessWidget {
  final List<String> goals;

  const _GoalsCard({required this.goals});

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
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(AppConstants.spaceXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and title
          Row(
            children: [
              Text(
                '🏅',
                style: const TextStyle(fontSize: 32),
              )
                  .animate()
                  .fadeIn(duration: AppConstants.animationSlow)
                  .scale(begin: const Offset(0.5, 0.5)),
              SizedBox(width: AppConstants.spaceM),
              Expanded(
                child: Text(
                  'Our Goals',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                )
                    .animate()
                    .fadeIn(duration: AppConstants.animationSlow)
                    .slideX(begin: -0.2),
              ),
            ],
          ),

          SizedBox(height: AppConstants.spaceL),

          // Goals list
          ...List.generate(
            goals.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: AppConstants.spaceM),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.buttonPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '✓',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                      .animate(delay: (index * 100).ms)
                      .fadeIn(duration: AppConstants.animationSlow)
                      .scale(begin: const Offset(0.5, 0.5)),
                  SizedBox(width: AppConstants.spaceM),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: AppConstants.spaceXS),
                      child: Text(
                        goals[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      )
                          .animate(delay: (index * 100 + 100).ms)
                          .fadeIn(duration: AppConstants.animationSlow)
                          .slideX(begin: -0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: AppConstants.animationSlow)
        .slideY(begin: 0.2);
  }
}
