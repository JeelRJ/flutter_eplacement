import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_eplacement/models/Jobsdata.dart';
import 'package:http/http.dart' as http;

class Listingscreen extends StatefulWidget {
  const Listingscreen({super.key});

  State<Listingscreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<Listingscreen> {
  @override
  String selected = "All";
  List<String> cities = ["All","Jamnager", "Rajkot", "Surat", "Ahamdabad", "Kutch"];

  List<JobData> jobs=[];
  bool isLoading=true;
  
   
   //initially api will call when page is open
    @override
  void initState() {
    super.initState();
    getDatafromApi();
  }
 
  Future<void> getDatafromApi() async{
    var url = Uri.https('6a0b65bc5aa893e1015a3659.mockapi.io','/jobs');
  var response = await http.get(url);

   List<Map<String,dynamic>> rawlist = List<Map<String,dynamic>>.from(jsonDecode(response.body));
    List<JobData> list = rawlist.map((jsonobject) => JobData(
      name: jsonobject['name'], 
      city: jsonobject['city'], 
      role: jsonobject['role'], 
      logo: jsonobject['logo'], 
      eligibility:jsonobject['eligibility'],
       stipend:jsonobject['stipend'], 
       applylink: jsonobject['ApplyLink']
       )).toList();

       setState(() {
          jobs=list;
          isLoading = false;
       });
  } 
  
 

  Widget build(BuildContext context) {
    List<String> Sortedcities = [...cities];
    Sortedcities.sort((a, b) {
    if (a == "All") return -1; // If 'a' is "All", move it up (first)
    if (b == "All") return 1;  // If 'b' is "All", move it up (first)
    return a.toLowerCase().compareTo(b.toLowerCase()); // Otherwise, sort normally (A to Z)
  });
  
    //filltered data to show in list
     List<JobData> filteredJobs = jobs.where((job) {
      if (selected == "All") return true; // Show everything if "All" is picked
      return job.city.toLowerCase() == selected.toLowerCase(); // Otherwise, match city strings
    }).toList();
    
    filteredJobs.sort((a, b) => a.city.compareTo(b.city));

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),

          //dropdown menu of citites
          DropdownMenu(
            expandedInsets: EdgeInsets.zero,
            dropdownMenuEntries: Sortedcities.map<DropdownMenuEntry<String>>((
              entry,
            ) {
              return DropdownMenuEntry<String>(value: entry, label: entry);
            }).toList(),
            initialSelection: selected,
            label: Text("Job Place"),
            onSelected: (value) => {
               setState(() {
                  selected=value.toString();
               })
              },
          ),

          const SizedBox(height: 20),

          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator()) // Shows a loading wheel
                : filteredJobs.isEmpty
                    ? const Center(child: Text("No jobs listed for this location."))
                    : ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) {
                          final job = filteredJobs[index];
                          
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Company Logo Image Placeholder
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          job.logo,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) =>
                                              const Icon(Icons.business, size: 50, color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      // Role & Company Info
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              job.role,
                                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${job.name} • ${job.city}",
                                              style: TextStyle(color: Colors.grey[600], fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        spacing:5,
                                        children: [
                                          Icon(Icons.edit),
                                          Icon(Icons.delete),
                                        ],
                                      )
                                      ,
                                      Icon(Icons.keyboard_arrow_down),
                                    ],
                                  ),
                                 
                                  
                                  const SizedBox(height: 12),
                                  // Stipend info and Apply actions row block
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Stipend: ${job.stipend}",
                                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
                                      ),

                                    ],
                                  )
                                ],
                              ),
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