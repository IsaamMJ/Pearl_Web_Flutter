// School data for Pearl Matriculation Higher Secondary School

class SchoolData {
  static const String schoolName = 'Pearl Matriculation Higher Secondary School';
  static const String location = 'Therekalputhoor, Tamil Nadu';
  static const String tagline = 'A Step Towards Quality Education';
  static const String subTagline = 'Serving Excellence for 22+ Years';

  // Contact details
  static const String primaryPhone = '9489601444';
  static const String officePhone = '9489694441';
  static const String accountsPhone = '9489694442';
  static const String email = 'info@pearlmatricschool.com';
  static const String address = 'Theroor Rd, Therekalputhoor, Tamil Nadu 629901';

  // School info
  static const String establishmentYear = '2004';
  static const String yearOfExcellence = '22+';
  static const String campusSize = '25';
  static const String studentStrength = '2000+';
  static const int passRate = 100;

  // About text
  static const String aboutText = '''The school was established in the year 2004 and meticulously maintained by Er.M.Shahul Hameed. Under expert leadership and dynamic guidance, the school has grown significantly and earned many achievements in academics and other activities.

The school looks forward to the unwavering advancement of students through education, discipline and character building.''';

  // Mission, Vision, Goals
  static const String mission = 'Committed to providing quality education with progressive emphasis on character building, cooperation and excellence. Inspiring sparkling imaginations, fertile minds and willingness to take risks.';

  static const String vision = 'Study, Serve and Shine: To ensure efficient teaching, enthusiastic coaching and excellent learning';

  static const List<String> goals = [
    'Honesty, Integrity and Professionalism',
    'Hardwork, Dedication and Achievement',
  ];

  // News items
  static const List<NewsItem> latestNews = [
    NewsItem(
      title: 'Honoring Our +2 Toppers – A Celebration of Excellence! 🎉',
      description: 'Our shining stars of +2 Results 2023–2024 were celebrated with pride and joy! 🏆✨',
      date: 'Apr 13, 2024',
      views: '30 views',
      category: 'Achievement',
    ),
    NewsItem(
      title: 'Outstanding Board Results 2023–2024 – Celebrating Academic Excellence! 🎓',
      description: 'We are proud to celebrate the exceptional achievements of our students in the Grade X and XII Board Examinations.',
      date: 'Apr 13, 2024',
      views: '23 views',
      category: 'Results',
    ),
    NewsItem(
      title: 'Cent percent result of Grade XII',
      description: 'We are greatly privileged to inform you the cent percent result of grade XII of our school!',
      date: 'May 13, 2023',
      views: '115 views',
      category: 'Achievement',
    ),
    NewsItem(
      title: 'Admissions Open for Classes KG to Grade IX and XI',
      description: 'Please be informed that Admissions are started for classes KG to Grade IX and XI. Our School Office will be open for inquiries.',
      date: 'May 24, 2022',
      views: '71 views',
      category: 'Admissions',
    ),
  ];
}

class NewsItem {
  final String title;
  final String description;
  final String date;
  final String views;
  final String category;

  const NewsItem({
    required this.title,
    required this.description,
    required this.date,
    required this.views,
    required this.category,
  });
}

class HighlightItem {
  final String title;
  final String value;
  final String icon;
  final String description;

  const HighlightItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.description,
  });
}

final List<HighlightItem> schoolHighlights = [
  const HighlightItem(
    title: '22+ Years Legacy',
    value: 'Est. 2004',
    icon: '📚',
    description: 'Established in 2004 and serving excellence for over 22 years',
  ),
  const HighlightItem(
    title: 'Expert Leadership',
    value: 'Experienced',
    icon: '👥',
    description: 'Led by faculty with decades of experience in education',
  ),
  const HighlightItem(
    title: '100% Pass Rate',
    value: 'Excellence',
    icon: '🏆',
    description: 'Consistent 100% pass rate in board examinations',
  ),
  const HighlightItem(
    title: '25-Acre Campus',
    value: 'Green Space',
    icon: '🌿',
    description: 'Sprawling, serene, and beautiful campus with salubrious climate',
  ),
];
