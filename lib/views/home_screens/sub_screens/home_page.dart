import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/components/full_card/course_card.dart';
import 'package:proacadamy_student_management_app/providers/course_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final coursData = Provider.of<CoursesProvider>(context);
    final length = coursData.courses.length;
    return SafeArea(
      child: Scaffold(
          body: ListView.builder(
            itemCount: length,
            itemBuilder: (context, index) => CusCourseSingleCard(index: index),
          ),
          ),
    );
  }
}
