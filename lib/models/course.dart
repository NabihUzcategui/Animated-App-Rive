import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = 'Build and animate an ios app from scratch',
    this.iconSrc = 'assets/icons/ios.svg',
    this.bgColor = const Color(0xff7553f6),
  });
}

List<Course> courses = [
  Course(title: 'Animations in SwiftUI'),
  Course(
    title: 'Animations in Flutter',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xff80a4ff),
  )
];

List<Course> recentCourses = [
  Course(title: 'State Machine'),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xff9cc5ff),
  ),
  Course(title: 'Flutter with Rive'),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xff80a4ff),
  )
];
