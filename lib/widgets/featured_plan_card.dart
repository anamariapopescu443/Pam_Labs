import 'package:flutter/material.dart';
import '../models/workout.dart';

class FeaturedPlanCard extends StatelessWidget {
  final WorkoutPlan plan;
  final VoidCallback? onStartPressed;

  const FeaturedPlanCard({
    super.key,
    required this.plan,
    this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295.0,
      height: 160.0,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF131722),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            // Right Side Image
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 170.0,
              child: Image.asset(
                plan.imagePath,
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF1F2633),
                    child: const Icon(Icons.fitness_center, color: Colors.white24, size: 48),
                  );
                },
              ),
            ),

            // Dark gradient overlay from left to right for crisp text legibility
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0F1420),
                      Color(0xFA0F1420),
                      Color(0xD00F1420),
                      Color(0x400F1420),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.45, 0.65, 0.85, 1.0],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),

            // Card Content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.fitness_center,
                            color: Colors.white70,
                            size: 14.0,
                          ),
                          const SizedBox(width: 6.0),
                          Flexible(
                            child: Text(
                              '${plan.duration}   •   ${plan.frequency}',
                              style: const TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Start Now Button
                  GestureDetector(
                    onTap: onStartPressed,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 9.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00D95F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(
                        'Start Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
