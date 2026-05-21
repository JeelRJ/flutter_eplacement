import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';

class jobDetailsScreen extends StatelessWidget{
  final JobData job;
  const jobDetailsScreen({super.key,required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  job.logo,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.business, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              job.role,
              style: const TextStyle(fontSize: 24, fontWeight:FontWeight.bold),
            ),
            Text(
              "${job.name} • ${job.city}",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const Divider(height: 32),

            const Text(
              "Stipend",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              " ${job.stipend}",
              style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text(
              "Eligibility Criteria",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              job.eligibility.isEmpty ? "No specific criteria listed." : job.eligibility,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 32),

            if (job.applyLink.isNotEmpty)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Optional: Use url_launcher package to open the link
                    debugPrint("Apply link clicked: ${job.applyLink}");
                  },
                  child: const Text("Apply Now"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}