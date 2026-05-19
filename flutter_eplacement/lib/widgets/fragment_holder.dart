import 'package:flutter/material.dart';
import 'package:flutter_eplacement/widgets/listingScreen.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FragmentHolder extends StatefulWidget {
  const FragmentHolder({super.key});

  @override
  State<FragmentHolder> createState() => _FragmentHolderState();
}

class _FragmentHolderState extends State<FragmentHolder> {
  List<JobData> jobs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getDatafromApi();
  }

  Future<void> getDatafromApi() async {
    try {
      var url = Uri.https('6a0b65bc5aa893e1015a3659.mockapi.io', '/jobs');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> rawList = jsonDecode(response.body);

        List<JobData> fetchedList = rawList.map((jsonObject) {
          return JobData(
            name: (jsonObject['name'] ?? '').toString(),
            city: (jsonObject['city'] ?? '').toString(),
            role: (jsonObject['role'] ?? '').toString(),
            logo: (jsonObject['logo'] ?? '').toString(),
            eligibility: (jsonObject['eligibility'] ?? '').toString(),
            stipend: (jsonObject['stipend'] ?? '').toString(),
            applylink: (jsonObject['applylink'] ?? '').toString(),
          );
        }).toList();

        setState(() {
          jobs = fetchedList;
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      debugPrint("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Listingscreen(jobs: jobs);
  }
}