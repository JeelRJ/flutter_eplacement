import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';

class AddScreen extends StatefulWidget {

  final Function(JobData) onAdd;

  const AddScreen({
    super.key,
    required this.onAdd,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

  TextEditingController roleController =
      TextEditingController();

  TextEditingController companyController =
      TextEditingController();

  TextEditingController cityController =
      TextEditingController();

  TextEditingController stipendController =
      TextEditingController();

  TextEditingController logoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Job"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(

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
                  labelText: "Company Name",
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

              const SizedBox(height: 15),

              TextField(
                controller: logoController,
                decoration: const InputDecoration(
                  labelText: "Logo URL",
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(

                onPressed: () {

                  JobData newJob = JobData(

                    role: roleController.text,
                    name: companyController.text,
                    city: cityController.text,
                    stipend: stipendController.text,

                    logo: logoController.text,

                    eligibility: "",
                    applyLink: "",
                  );

                  widget.onAdd(newJob);

                  Navigator.pop(context);
                },

                child: const Text("Add Job"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}