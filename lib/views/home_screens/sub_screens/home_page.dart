import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: getScreenSize(context).width,
          height: getScreenSize(context).height,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: getScreenSize(context).height * 0.26,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: const [],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Image.network(
                              'https://picsum.photos/id/153/100/100',
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
