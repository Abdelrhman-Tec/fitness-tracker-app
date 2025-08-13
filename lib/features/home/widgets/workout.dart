import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress; // بين 0 و 1
  final String imagePath;
  final VoidCallback onTap;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // صورة التمرين
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // النصوص و الـ progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.deepPurpleAccent.shade100,
                  ),
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.purple.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
