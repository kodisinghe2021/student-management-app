import 'package:flutter/cupertino.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';

class Course {
  int id;
  String name;
  String duration;
  List<Days> schedule;
  String description;
  double fee;
  String logoUrl;
  String bannerUrl;

  Course({
    required this.id,
    required this.name,
    required this.duration,
    required this.schedule,
    required this.description,
    required this.fee,
    required this.logoUrl,
    required this.bannerUrl,
  });
}

class CoursesProvider with ChangeNotifier {
  final List<Course> _coursesList = [
    Course(
      id: 1,
      name: 'Flutter development',
      duration: '6',
      schedule: [Days.Thursday, Days.Friday],
      description:
          "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum has been the industry's\nprinter took a galley of type and scrambled it to make a type specimen book. ",
      fee: 80000.0,
      logoUrl: 'https://picsum.photos/id/1001/200/300',
      bannerUrl: 'https://picsum.photos/id/1000/200/300',
    ),
    Course(
      id: 2,
      name: 'Web development',
      duration: '6',
      schedule: [Days.Monday, Days.Tuesday],
      description:
          "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum has been the industry's\nprinter took a galley of type and scrambled it to make a type specimen book. ",
      fee: 40000.0,
      logoUrl: 'https://picsum.photos/id/1003/200/300',
      bannerUrl: 'https://picsum.photos/id/1002/200/300',
    ),
    Course(
      id: 3,
      name: 'Ethical Hacking',
      duration: '9',
      schedule: [Days.Sunday],
      description:
          "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum has been the industry's\nprinter took a galley of type and scrambled it to make a type specimen book. ",
      fee: 60000.0,
      logoUrl: 'https://picsum.photos/id/1005/200/300',
      bannerUrl: 'https://picsum.photos/id/1014/200/300',
    ),
    Course(
      id: 4,
      name: 'React native development',
      duration: '9',
      schedule: [Days.Wednesday, Days.Saturday],
      description:
          "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum has been the industry's\nprinter took a galley of type and scrambled it to make a type specimen book. ",
      fee: 70000.0,
      logoUrl: 'https://picsum.photos/id/1009/200/300',
      bannerUrl: 'https://picsum.photos/id/1006/200/300',
    ),
    Course(
      id: 5,
      name: 'Syber Security',
      duration: '12',
      schedule: [Days.Thursday, Days.Friday],
      description:
          "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum has been the industry's\nprinter took a galley of type and scrambled it to make a type specimen book. ",
      fee: 30000.0,
      logoUrl: 'https://picsum.photos/id/1009/200/300',
      bannerUrl: 'https://picsum.photos/id/1008/200/300',
    ),
    Course(
      id: 6,
      name: 'Python developemnt',
      duration: '3',
      schedule: [Days.Friday],
      description:
          "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum has been the industry's\nprinter took a galley of type and scrambled it to make a type specimen book. ",
      fee: 20000.0,
      logoUrl: 'https://picsum.photos/id/1011/200/300',
      bannerUrl: 'https://picsum.photos/id/1010/200/300',
    ),
    Course(
      id: 7,
      name: 'Data science',
      duration: '18',
      schedule: [Days.Monday, Days.Tuesday],
      description:
          "Lorem Ipsum is simply dummy text of the printing and\n typesetting industry. Lorem Ipsum has been the industry's\nprinter took a galley of type and scrambled it to make a type specimen book. ",
      fee: 60000.0,
      logoUrl: 'https://picsum.photos/id/1013/200/300',
      bannerUrl: 'https://picsum.photos/id/1012/200/300',
    ),
  ];

  List<Course> get courses {
    return [..._coursesList];
  }
}
