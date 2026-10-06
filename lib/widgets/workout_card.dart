import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutProgram program;
  final VoidCallback onTap;

  const WorkoutCard({
    super.key,
    required this.program,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  program.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFF2B303A),
                      child: const Icon(
                        Icons.fitness_center,
                        color: Colors.white30,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),

              // Bottom Dark Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color(0x30000000),
                        Color(0xC0000000),
                        Color(0xE6000000),
                      ],
                      stops: [0.35, 0.55, 0.8, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Pro Badge at Top Right (if isPro)
              if (program.isPro)
                Positioned(
                  top: 12.0,
                  right: 12.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.workspace_premium_rounded,
                          color: Color(0xFF00D95F),
                          size: 14.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'Pro',
                          style: TextStyle(
                            color: Color(0xFF00D95F),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Card Bottom Content
              Positioned(
                left: 14.0,
                right: 14.0,
                bottom: 14.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      program.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w800,
                        height: 1.15,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 4.0,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department_outlined,
                          color: Colors.white70,
                          size: 13.0,
                        ),
                        const SizedBox(width: 3.0),
                        Text(
                          '${program.calories} kcl',
                          style: const TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(
                          Icons.access_time_rounded,
                          color: Colors.white70,
                          size: 13.0,
                        ),
                        const SizedBox(width: 3.0),
                        Text(
                          '${program.durationMinutes} min',
                          style: const TextStyle(
                            color: Color(0xFFE0E0E0),
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
