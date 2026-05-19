import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';

class Listingscreen extends StatefulWidget {
  final List<JobData> jobs;

  const Listingscreen({super.key, required this.jobs});

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

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [

          const SizedBox(height: 10),

          // DROPDOWN
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
            child: widget.jobs.isEmpty
                ? const Center(child: Text("No Jobs Found"))
                : ListView.builder(
                    itemCount: filteredJobs.length,
                    itemBuilder: (context, index) {
                      final job = filteredJobs[index];

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

                            // TOP ROW
                            Row(
                              children: [

                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    job.logo,
                                    width: 55,
                                    height: 55,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        const Icon(Icons.business, size: 50),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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

                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Divider(color: Colors.grey.shade200),

                            const SizedBox(height: 8),

                            // BOTTOM ROW
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "💰 ${job.stipend}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),

                                const Row(
                                  children: [
                                    Icon(Icons.edit, size: 18),
                                    SizedBox(width: 10),
                                    Icon(Icons.delete,
                                        size: 18, color: Colors.red),
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
    );
  }
}