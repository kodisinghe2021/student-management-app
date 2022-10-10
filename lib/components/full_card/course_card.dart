import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/components/card_compononts/card_text.dart';
import 'package:proacadamy_student_management_app/components/full_card/CusIcon.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';
import 'package:proacadamy_student_management_app/providers/course_provider.dart';
import 'package:proacadamy_student_management_app/views/student_list/student_list.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class CusCourseSingleCard extends StatelessWidget {
  const CusCourseSingleCard({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final coursData = Provider.of<CoursesProvider>(context);
    final coursesList = coursData.courses;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: SizedBox(
        child: Stack(
          children: [
//################################## Background ###############################//
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: getScreenSize(context).width * 0.9,
                height: getScreenSize(context).height * 0.25,
              ),
            ),
//#################################  Inner Card  ##############################//
            Positioned(
              bottom: 0,
              right: 0,
              child: Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  width: getScreenSize(context).width * 0.85,
                  height: getScreenSize(context).height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      coursesList[index].logoUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : const SkeletonAvatar();
                      },
                    ),
                  ),
                ),
              ),
            ),
//################################ Circular avatar #############################//
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    coursesList[index].bannerUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress == null
                          ? child
                          : const SkeletonAvatar();
                    },
                  ),
                ),
              ),
            ),
//################################ title #######################################//
            Positioned(
              right: 20,
              top: 50,
              child: CusCardText(
                text: coursesList[index].name,
                spacing: 2,
                weight: FontWeight.bold,
                size: 18,
              ),
            ),

//################################ syllabus ####################################//
            Positioned(
              right: 20,
              bottom: 20,
              child: Row(
                children: [
                  const CusCardText(
                    text: 'Syllabus',
                    spacing: 2,
                  ),
                  CusCircullarIcon(
                    icon: const Icon(Icons.download),
                    onTap: () {},
                  ),
                ],
              ),
            ),
//################################ Enrolled Stundets ####################################//
            Positioned(
              left: 30,
              bottom: 20,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, StudentList.pageKey);
                },
                child: const CusCardText(
                  text: 'Enrolled Students',
                  spacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
