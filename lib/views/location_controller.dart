import 'package:flutter/material.dart';
import 'package:proacadamy_student_management_app/components/custom_buttons.dart';
import 'package:proacadamy_student_management_app/const_vaues.dart';
import 'package:proacadamy_student_management_app/providers/location_provider.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  static const String pageKey = '/location-screen';
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool _isLoadingA = false;
  bool _isLoadingB = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: getScreenSize(context).width,
          child: Consumer<LocationProvider>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: CustomButton(
                            isLoading: _isLoadingA,
                            onTap: () async {
                              setState(() {
                                _isLoadingA = true;
                              });
                              await value.setUSerCoordinates(context);
                              // Position? userCurrentPosition =
                              //     value.getUserCoordinates;
                              // Logger().w('Result: $userCurrentPosition');
                              setState(() {
                                _isLoadingA = false;
                              });
                            },
                            text: 'Set My Location'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: CustomButton(
                            isLoading: _isLoadingB,
                            onTap: () async {
                              setState(() {
                                _isLoadingB = true;
                              });
                              await value.findDistance();
                              // Position? userCurrentPosition =
                              //     value.getUserCoordinates;
                              // Logger().w('Result: $userCurrentPosition');
                              setState(() {
                                _isLoadingB = false;
                              });
                            },
                            text: 'Get distance'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (value.getUserCoordinates != null)
                      SizedBox(
                          width: getScreenSize(context).width * 0.9,
                          child: Text(
                            'User Latlang: ${value.getUserCoordinates}',
                            textAlign: TextAlign.center,
                          )),
                    if (value.getPlaceMark.isNotEmpty)
                      SizedBox(
                        width: getScreenSize(context).width * 0.9,
                        child: Text(
                          'User Location: ${value.getAddress}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (value.getDistance != 0.0)
                      SizedBox(
                        width: getScreenSize(context).width * 0.9,
                        child: Text(
                          'Distance between the campus and me : ${value.getDistance.toStringAsFixed(2)} KM',
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
