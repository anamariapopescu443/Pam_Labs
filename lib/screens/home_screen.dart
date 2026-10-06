import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../widgets/challenge_card.dart';
import '../widgets/featured_plan_card.dart';
import '../widgets/category_chip.dart';
import '../widgets/workout_card.dart';
import 'workout_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = "All Type";

  final List<String> _categories = const [
    "All Type",
    "Pilates",
    "Cardio",
    "Boxing",
    "Yoga",
  ];

  final WorkoutPlan _featuredPlan = const WorkoutPlan(
    id: "1",
    title: "Massive Upper Body",
    duration: "5 week",
    frequency: "4x/week",
    imagePath: "assets/images/upper_body.jpg",
  );

  final List<WorkoutProgram> _workoutPrograms = const [
    WorkoutProgram(
      id: "1",
      title: "Yoga",
      category: "Yoga",
      calories: 210,
      durationMinutes: 120,
      imagePath: "assets/images/yoga.jpg",
      isPro: false,
    ),
    WorkoutProgram(
      id: "2",
      title: "Arm\nStrengthening",
      category: "Pilates",
      calories: 210,
      durationMinutes: 120,
      imagePath: "assets/images/arm_strengthening.jpg",
      isPro: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mock Status Bar Time & Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      color: Color(0xFF121217),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.signal_cellular_alt_rounded,
                          size: 16.0, color: Color(0xFF121217)),
                      const SizedBox(width: 5.0),
                      const Icon(Icons.wifi_rounded,
                          size: 16.0, color: Color(0xFF121217)),
                      const SizedBox(width: 5.0),
                      Transform.rotate(
                        angle: 1.5708,
                        child: const Icon(Icons.battery_full_rounded,
                            size: 18.0, color: Color(0xFF121217)),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

              // Header: Greeting & Notification Bell
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Friday, 20 May',
                        style: TextStyle(
                          color: Color(0xFF9E9E9E),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          color: Color(0xFF121217),
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),

                  // Circular Notification Bell Button
                  Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE2E2E8),
                        width: 1.0,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFF121217),
                          size: 22.0,
                        ),
                        Positioned(
                          top: 13.0,
                          right: 14.0,
                          child: Container(
                            width: 6.0,
                            height: 6.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE53935),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),

              // Today's Challenge Card
              const ChallengeCard(
                title: "Today's Challenge",
                activityName: "Running",
                currentProgress: 15,
                totalProgress: 20,
              ),

              const SizedBox(height: 24.0),

              // Featured Plan Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Featured Plan',
                    style: TextStyle(
                      color: Color(0xFF121217),
                      fontSize: 19.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFF00D95F),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14.0),

              // Featured Plan Horizontal Carousel
              SizedBox(
                height: 160.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    FeaturedPlanCard(
                      plan: _featuredPlan,
                      onStartPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Starting Workout Plan!'),
                            backgroundColor: const Color(0xFF00D95F),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                      },
                    ),
                    // Partial second card for scroll indication
                    FeaturedPlanCard(
                      plan: const WorkoutPlan(
                        id: "2",
                        title: "Full Body Shred",
                        duration: "4 week",
                        frequency: "3x/week",
                        imagePath: "assets/images/gym_hero.jpg",
                      ),
                      onStartPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24.0),

              // Workout Programs Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Workout Programs',
                    style: TextStyle(
                      color: Color(0xFF121217),
                      fontSize: 19.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFF00D95F),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14.0),

              // Category Selector List
              SizedBox(
                height: 42.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    return CategoryChip(
                      label: cat,
                      isSelected: _selectedCategory == cat,
                      onTap: () {
                        setState(() {
                          _selectedCategory = cat;
                        });
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 18.0),

              // Workout Cards 2-Column Row
              SizedBox(
                height: 230.0,
                child: Row(
                  children: [
                    // Card 1: Yoga
                    Expanded(
                      child: WorkoutCard(
                        program: _workoutPrograms[0],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const WorkoutDetailScreen(
                                title: "Yoga Training",
                                location: "California, New York",
                                heroImagePath: "assets/images/yoga.jpg",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    // Card 2: Arm Strengthening
                    Expanded(
                      child: WorkoutCard(
                        program: _workoutPrograms[1],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const WorkoutDetailScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
