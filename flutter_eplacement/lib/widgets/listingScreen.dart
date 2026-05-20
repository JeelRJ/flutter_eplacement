import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';
import 'package:flutter_eplacement/widgets/editScreen.dart';
import 'package:flutter_eplacement/widgets/jobDetails.dart'; // Import your new screen

class Listingscreen extends StatefulWidget {
  final List<JobData> jobs;
  final Function(int, JobData) onEdit;
  final VoidCallback onBack;

  const Listingscreen({
    super.key,
    required this.jobs,
    required this.onEdit,
    required this.onBack,
  });

  @override
  State<Listingscreen> createState() => _ListingscreenState();
}

class _ListingscreenState extends State<Listingscreen> {
  String selected = "All";

  List<String> cities = [
    "All",
    "Jamnager",
    "Rajkot",
    "Surat",
    "Ahamdabad",
    "Kutch"
  ];

  @override
  Widget build(BuildContext context) {
    List<String> sortedCities = [...cities];

    sortedCities.sort((a, b) {
      if (a == "All") return -1;
      if (b == "All") return 1;
      return a.toLowerCase().compareTo(b.toLowerCase());
    });

    List<JobData> filteredJobs = widget.jobs.where((job) {
      if (selected == "All") return true;
      return job.city.toLowerCase() == selected.toLowerCase();
    }).toList();

    filteredJobs.sort((a, b) => a.city.compareTo(b.city));

    return WillPopScope(
      onWillPop: () async {
        bool? result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Go Back"),
              content: const Text("Do you want to go to Splash Screen?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Yes"),
                ),
              ],
            );
          },
        );

        if (result == true) {
          widget.onBack();
        }
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () async {
                  bool? result = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Go Back"),
                        content: const Text("Do you want to go to Splash Screen?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text("No"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text("Yes"),
                          ),
                        ],
                      );
                    },
                  );

                  if (result == true) {
                    widget.onBack();
                  }
                },
                child: const Text("Back"),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButton<String>(
                value: selected,
                isExpanded: true,
                underline: const SizedBox(),
                items: sortedCities.map((city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selected = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: filteredJobs.isEmpty // Changed from widget.jobs.isEmpty to properly show empty filter states
                  ? const Center(child: Text("No Jobs Found"))
                  : ListView.builder(
                      itemCount: filteredJobs.length,
                      itemBuilder: (context, index) {
                        final job = filteredJobs[index];
                        
                        // FIX: Find the absolute index in the original list for editing
                        final int masterIndex = widget.jobs.indexOf(job);

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      job.logo,
                                      width: 55,
                                      height: 55,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) {
                                        return const Icon(Icons.business, size: 50);
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          job.role,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${job.name} • ${job.city}",
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                  // NEW: Wrapped in GestureDetector to open Detail Screen
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => jobDetailsScreen(job: job),
                                        ),
                                      );
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                ],
                
                              ),
                              const SizedBox(height: 10),
                              Divider(color: Colors.grey.shade200),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${job.stipend}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return EditScreen(
                                                  job: job,
                                                  onSave: (updatedJob) {
                                                    // Pass the corrected master index here
                                                    widget.onEdit(masterIndex, updatedJob);
                                                  },
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: const Icon(Icons.edit, size: 18),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(
                                        Icons.delete,
                                        size: 18,
                                        color: Colors.red,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}