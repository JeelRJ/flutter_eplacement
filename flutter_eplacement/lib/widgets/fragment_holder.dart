import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';
import 'package:flutter_eplacement/splashScreen.dart';
import 'package:flutter_eplacement/widgets/listingScreen.dart';
import 'package:http/http.dart' as http;

class FragmentHolder extends StatefulWidget {
  const FragmentHolder({super.key});

  @override
  State<FragmentHolder> createState() => _FragmentHolderState();
}

class _FragmentHolderState extends State<FragmentHolder> {

  int selectedIndex = 0;

  List<JobData> jobs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getDatafromApi();
  }

  Future<void> getDatafromApi() async {

    try {

      var url = Uri.https(
        '6a0b65bc5aa893e1015a3659.mockapi.io',
        '/jobs',
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {

        final List<dynamic> rawList =
            jsonDecode(response.body);

        List<JobData> fetchedList =
            rawList.map((jsonObject) {

          return JobData(
            name: (jsonObject['name'] ?? '').toString(),
            city: (jsonObject['city'] ?? '').toString(),
            role: (jsonObject['role'] ?? '').toString(),
            logo: (jsonObject['logo'] ?? '').toString(),
            eligibility:
                (jsonObject['eligibility'] ?? '').toString(),
            stipend:
                (jsonObject['stipend'] ?? '').toString(),
            applylink:
                (jsonObject['applylink'] ?? '').toString(),
          );

        }).toList();

        setState(() {
          jobs = fetchedList;
          isLoading = false;
        });
      }

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget changeScreen() {

    switch (selectedIndex) {

      case 0:

        return SplashScreen(

          onNext: () {

            setState(() {
              selectedIndex = 1;
            });

          },
        );

      case 1:

        if (isLoading) {

          return const Center(
            child: CircularProgressIndicator(),
          );
        }

return Listingscreen(

  jobs: jobs,

  onBack: () {

    setState(() {
      selectedIndex = 0;
    });

  },

  onEdit: (index, updatedJob) {

    setState(() {

      jobs[index] = updatedJob;

    });
  },
);

      default:

        return const Center(
          child: Text("Screen Not Found"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: changeScreen(),
    );
  }
}