import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';

class EditScreen extends StatefulWidget {

  final JobData job;
  final Function(JobData) onSave;

  const EditScreen({
    super.key,
    required this.job,
    required this.onSave,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  late TextEditingController roleController;
  late TextEditingController companyController;
  late TextEditingController cityController;
  late TextEditingController stipendController;

  @override
  void initState() {
    super.initState();

    roleController =
        TextEditingController(text: widget.job.role);

    companyController =
        TextEditingController(text: widget.job.name);

    cityController =
        TextEditingController(text: widget.job.city);

    stipendController =
        TextEditingController(text: widget.job.stipend);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Job"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: roleController,
              decoration: const InputDecoration(
                labelText: "Role",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: companyController,
              decoration: const InputDecoration(
                labelText: "Company",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: "City",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: stipendController,
              decoration: const InputDecoration(
                labelText: "Stipend",
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(

              onPressed: () {

                JobData updatedJob = JobData(

                  role: roleController.text,
                  name: companyController.text,
                  city: cityController.text,
                  stipend: stipendController.text,

                  logo: widget.job.logo,
                  eligibility: widget.job.eligibility,
                  applyLink: widget.job.applyLink,
                );

                widget.onSave(updatedJob);

                Navigator.pop(context);
              },

              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}