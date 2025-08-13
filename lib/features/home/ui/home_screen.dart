import 'package:fitness_trainer_app/core/constants/app_assets.dart';
import 'package:fitness_trainer_app/core/constants/app_strings.dart';
import 'package:fitness_trainer_app/core/helpers/spacing.dart';
import 'package:fitness_trainer_app/core/widgets/custom_button.dart';
import 'package:fitness_trainer_app/features/home/widgets/calories_chart.dart';
import 'package:fitness_trainer_app/features/home/widgets/home_top_bar.dart';
import 'package:fitness_trainer_app/features/home/widgets/sleep_chart.dart';
import 'package:fitness_trainer_app/features/home/widgets/slider_banner.dart';
import 'package:fitness_trainer_app/features/home/widgets/water_in_take_chart.dart';
import 'package:fitness_trainer_app/features/home/widgets/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WaterData> waterData = [
    WaterData('6-8am', 600),
    WaterData('9-11am', 500),
    WaterData('11-2pm', 1000),
    WaterData('2-4pm', 700),
    WaterData('4pm-now', 900),
  ];

  List<SleepData> sleepData = [
    SleepData(0, 6.5),
    SleepData(1, 7.0),
    SleepData(2, 8.2),
    SleepData(3, 8.0),
    SleepData(4, 8.3),
  ];

  List<CaloriesData> caloriesData = [
    CaloriesData('Consumed', 760),
    CaloriesData('Remaining', 230),
  ];

  void _editWaterData() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        final controllers = waterData
            .map((e) => TextEditingController(text: e.amount.toString()))
            .toList();
        return _buildEditSheet(
          title: "Edit Water Intake",
          controllers: controllers,
          labels: waterData.map((e) => e.time).toList(),
          onSave: () {
            setState(() {
              for (int i = 0; i < waterData.length; i++) {
                waterData[i] = WaterData(
                  waterData[i].time,
                  int.tryParse(controllers[i].text) ?? 0,
                );
              }
            });
          },
        );
      },
    );
  }

  void _editSleepData() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        final controllers = sleepData
            .map((e) => TextEditingController(text: e.hours.toString()))
            .toList();
        return _buildEditSheet(
          title: "Edit Sleep Hours",
          controllers: controllers,
          labels: sleepData.map((e) => "Day ${e.day.toInt()}").toList(),
          onSave: () {
            setState(() {
              for (int i = 0; i < sleepData.length; i++) {
                sleepData[i] = SleepData(
                  sleepData[i].day,
                  double.tryParse(controllers[i].text) ?? 0,
                );
              }
            });
          },
        );
      },
    );
  }

  void _editCaloriesData() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        final controllers = caloriesData
            .map((e) => TextEditingController(text: e.value.toString()))
            .toList();
        return _buildEditSheet(
          title: "Edit Calories",
          controllers: controllers,
          labels: caloriesData.map((e) => e.label).toList(),
          onSave: () {
            setState(() {
              for (int i = 0; i < caloriesData.length; i++) {
                caloriesData[i] = CaloriesData(
                  caloriesData[i].label,
                  double.tryParse(controllers[i].text) ?? 0,
                );
              }
            });
          },
        );
      },
    );
  }

  Widget _buildEditSheet({
    required String title,
    required List<TextEditingController> controllers,
    required List<String> labels,
    required VoidCallback onSave,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...List.generate(
            controllers.length,
            (i) => TextField(
              controller: controllers[i],
              decoration: InputDecoration(labelText: labels[i]),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 12),

          GradientButton(
            width: 170,
            height: 50,
            onPressed: () {
              onSave();
              Navigator.pop(context);
            },
            buttonName: 'Save',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [AppAssets.banner1, AppAssets.banner2];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                const HomeTopBar(),
                verticalSpace(20),
                SliderBanner(images: images),
                verticalSpace(20),
                Container(
                  width: double.infinity,
                  height: 57,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(78, 157, 206, 255),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.todayTarget,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GradientButton(
                        width: 68,
                        height: 30,
                        onPressed: () {},
                        buttonName: AppStrings.check,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _editWaterData,
                        child: WaterIntakeChart(
                          small: true,
                          waterData: waterData,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: _editSleepData,
                        child: SleepChart(small: true, sleepData: sleepData),
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                GestureDetector(
                  onTap: _editCaloriesData,
                  child: CaloriesChart(small: true, caloriesData: caloriesData),
                ),
                WorkoutCard(
                  title: "Fullbody Workout",
                  subtitle: "180 Calories Burn | 20 minutes",
                  progress: 0.7,
                  imagePath: "assets/icons/Workout-Pic.svg",
                  onTap: () {},
                ),
                WorkoutCard(
                  title: "Fullbody Workout",
                  subtitle: "180 Calories Burn | 20 minutes",
                  progress: 0.7,
                  imagePath: "assets/icons/Workout-Pic (1).svg",
                  onTap: () {},
                ),
                WorkoutCard(
                  title: "Fullbody Workout",
                  subtitle: "180 Calories Burn | 20 minutes",
                  progress: 0.7,
                  imagePath: "assets/icons/Workout-Pic (2).svg",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
