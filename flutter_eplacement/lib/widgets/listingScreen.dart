import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';
import 'package:flutter_eplacement/widgets/addScreen.dart';
import 'package:flutter_eplacement/widgets/editScreen.dart';
import 'package:flutter_eplacement/widgets/jobDetailsScreen.dart';
class Listingscreen extends StatelessWidget {

  final List<JobData> jobs;

  final Function(int, JobData) onEdit;
  final Function(JobData) onAdd;
  final VoidCallback onBack;

  const Listingscreen({
    super.key,
    required this.jobs,
    required this.onEdit,
    required this.onAdd,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {

    List<JobData> filteredJobs = jobs;

    filteredJobs.sort(
      (a, b) => a.city.compareTo(b.city),
    );

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
            const Color.fromARGB(255, 21, 62, 96),

        foregroundColor: Colors.white,

        title: const Text("E-placement"),

        actions: [

          IconButton(

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) {

                    return AddScreen(

                      onAdd: (newJob) {

                        onAdd(newJob);

                      },
                    );
                  },
                ),
              );
            },

            icon: const Icon(Icons.add),
          ),
        ],
      ),

      body: WillPopScope(

        onWillPop: () async {

          bool? result =
              await showDialog(

            context: context,

            builder: (context) {

              return AlertDialog(

                title: const Text("Go Back"),

                content: const Text(
                  "Do you want to go to Splash Screen?",
                ),

                actions: [

                  TextButton(

                    onPressed: () {

                      Navigator.pop(
                        context,
                        false,
                      );
                    },

                    child: const Text("No"),
                  ),

                  TextButton(

                    onPressed: () {

                      Navigator.pop(
                        context,
                        true,
                      );
                    },

                    child: const Text("Yes"),
                  ),
                ],
              );
            },
          );

          if (result == true) {
            onBack();
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

                    bool? result =
                        await showDialog(

                      context: context,

                      builder: (context) {

                        return AlertDialog(

                          title:
                              const Text("Go Back"),

                          content:
                              const Text(
                            "Do you want to go to Splash Screen?",
                          ),

                          actions: [

                            TextButton(

                              onPressed: () {

                                Navigator.pop(
                                  context,
                                  false,
                                );
                              },

                              child: const Text("No"),
                            ),

                            TextButton(

                              onPressed: () {

                                Navigator.pop(
                                  context,
                                  true,
                                );
                              },

                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );

                    if (result == true) {
                      onBack();
                    }
                  },

                  child: const Text("Back"),
                ),
              ),

              const SizedBox(height: 15),

              Expanded(

                child: jobs.isEmpty

                    ? const Center(
                        child: Text("No Jobs Found"),
                      )

                    : ListView.builder(

                        itemCount:
                            filteredJobs.length,

                        itemBuilder:
                            (context, index) {

                          final job =
                              filteredJobs[index];

                         return GestureDetector(

  onTap: () {

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) {

          return jobDetailsScreen(
            job: job,
          );
        },
      ),
    );
  },

  child: Container(

                            margin:
                                const EdgeInsets.symmetric(
                              vertical: 8,
                            ),

                            padding:
                                const EdgeInsets.all(
                              14,
                            ),

                            decoration:
                                BoxDecoration(

                              color: Colors.white,

                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),

                              boxShadow: [

                                BoxShadow(
                                  color:
                                      Colors.black12,

                                  blurRadius: 6,

                                  offset:
                                      const Offset(
                                    0,
                                    3,
                                  ),
                                ),
                              ],
                            ),

                            child: Column(

                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Row(
                                  children: [

                                    ClipRRect(

                                      borderRadius:
                                          BorderRadius.circular(
                                        10,
                                      ),

                                      child:
                                          Image.network(

                                        job.logo,

                                        width: 55,
                                        height: 55,

                                        fit: BoxFit.cover,

                                        errorBuilder:
                                            (_, __, ___) {

                                          return const Icon(
                                            Icons.business,
                                            size: 50,
                                          );
                                        },
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 12,
                                    ),

                                    Expanded(

                                      child: Column(

                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [

                                          Text(

                                            job.role,

                                            style:
                                                const TextStyle(
                                              fontSize: 17,

                                              fontWeight:
                                                  FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 4,
                                          ),

                                          Text(

                                            "${job.name} • ${job.city}",

                                            style:
                                                TextStyle(
                                              color: Colors
                                                  .grey
                                                  .shade600,

                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Icon(
                                      Icons
                                          .keyboard_arrow_down,
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 10,
                                ),

                                Divider(
                                  color: Colors
                                      .grey
                                      .shade200,
                                ),

                                const SizedBox(
                                  height: 8,
                                ),

                                Row(

                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,

                                  children: [

                                    Text(

                                      "💰 ${job.stipend}",

                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight.bold,

                                        color:
                                            Colors.green,
                                      ),
                                    ),

                                    Row(
                                      children: [

                                        GestureDetector(

                                          onTap: () {

                                            Navigator.push(

                                              context,

                                              MaterialPageRoute(

                                                builder:
                                                    (context) {

                                                  return EditScreen(

                                                    job:
                                                        job,

                                                    onSave:
                                                        (updatedJob) {

                                                      onEdit(
                                                        index,
                                                        updatedJob,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },

                                          child:
                                              const Icon(
                                            Icons.edit,
                                            size: 18,
                                          ),
                                        ),

                                        const SizedBox(
                                          width: 10,
                                        ),

                                        const Icon(
                                          Icons.delete,
                                          size: 18,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ), );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}