class WorkoutPlan {
  final String id;
  final String title;
  final String duration;
  final String frequency;
  final String imagePath;

  const WorkoutPlan({
    required this.id,
    required this.title,
    required this.duration,
    required this.frequency,
    required this.imagePath,
  });
}

class WorkoutProgram {
  final String id;
  final String title;
  final String category;
  final int calories;
  final int durationMinutes;
  final String imagePath;
  final bool isPro;

  const WorkoutProgram({
    required this.id,
    required this.title,
    required this.category,
    required this.calories,
    required this.durationMinutes,
    required this.imagePath,
    this.isPro = false,
  });
}

class GymAmenity {
  final String name;
  final String iconType;

  const GymAmenity({
    required this.name,
    required this.iconType,
  });
}
