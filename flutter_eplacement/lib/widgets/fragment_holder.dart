import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';
import 'package:flutter_eplacement/widgets/listingScreen.dart';


class FragmentHolder extends StatefulWidget {
  const FragmentHolder({super.key});

  @override
  State<FragmentHolder> createState() => _FragmentHolderState();
}

class _FragmentHolderState extends State<FragmentHolder> {
  int selectedIndex = 0;

  // CHANGED: Use 'late' so we can initialize a mutable copy in initState
  late List<JobData> jobs;
  bool isLoading = true;

  // FIX: Added initState to turn off the loading state after the screen mounts
  @override
  void initState() {
    super.initState();
    
    // Creates a modifiable copy of your data list so CRUD actions don't crash
    jobs = List.from(data); 

    // Simulates a quick data load delay (e.g., 600ms) then tells Flutter to render the list
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() {
          isLoading = false; // This breaks the endless loading loop!
        });
      }
    });
  }

  Widget changeScreen() {
    switch (selectedIndex) {
      case 0:
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Listingscreen(
          jobs: jobs,
          onAdd: (newJob) {
            setState(() {
              jobs.add(newJob);
            });
          },
          onEdit: (index, updatedJob) {
            setState(() {
              jobs[index] = updatedJob;
            });
          },
          onDelete: (index) {
            setState(() {
              jobs.removeAt(index);
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