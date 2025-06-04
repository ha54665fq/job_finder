import 'package:flutter/material.dart';
import 'package:job_finder/models/all_job.dart';
import 'package:job_finder/pages/job_details_page.dart';
import 'package:job_finder/pages/settings_page.dart';
import 'package:job_finder/pages/bookmark_page.dart';
import 'package:job_finder/pages/profile_page.dart';
import 'package:job_finder/api/job_api.dart';
import 'package:job_finder/models/job.dart';

// Top-level function for building info chips
Widget _buildInfoChip(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.teal.shade200!),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.teal),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isLoadingJobs = true;
  List<Datum> _jobs = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  Future<void> _fetchJobs() async {
    setState(() {
      _isLoadingJobs = true;
      _error = null;
    });
    try {
      AllJob fetchedJobs = await JobApi.getAllJobs();


      setState(() {

        _jobs = fetchedJobs.data;
        _isLoadingJobs = false;
        print('Successfully fetched ${fetchedJobs.data.length} jobs.');
      });
    } catch (e, stacktrace) {
      setState(() {
        _error = 'Failed to load jobs: $e';
        _isLoadingJobs = false;
        print('Error fetching jobs: $e');
        print('Stacktrace: $stacktrace');
      });
    }
  }

  Widget _buildJobsPage() {
    if (_isLoadingJobs) {
      return const Center(child: CircularProgressIndicator());
    } else if (_error != null) {
      return Center(child: Text('Error: $_error'));
    } else if (_jobs.isEmpty) {
      return const Center(child: Text('No jobs found.'));
    } else {
      return ListView.builder(
        itemCount: _jobs.length,
        itemBuilder: (context, index) {
          final job = _jobs[index];
          print('Rendering job: ${job.title}');
          // print('Company: ${job.companyName}, Logo: ${job.companyLogoUrl}');
          // print('Details: JobType=${job.jobType}, Salary=${job.salaryRange}, Experience=${job.experience}, DaysRemaining=${job.daysRemaining}');
          print('Skills: ${job.skills.join(', ')}');
          // print('Expiry: ${job.expiryDate}');
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JobDetailsPage()),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.language, size: 18),
                            SizedBox(width: 4),
                            Text('30 min'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.bookmark, color: Colors.deepPurple, size: 24),
                            Icon(Icons.star, color: Colors.amber, size: 24),
                            Icon(Icons.bookmark, color: Colors.teal, size: 24),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: (job.businessMan.imageUrl.isNotEmpty)
                              ? CircleAvatar(backgroundImage: NetworkImage(job.businessMan.imageUrl))
                              : const Icon(Icons.business, color: Colors.redAccent),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${job.workField.name}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '(' + job.workField.id.toString() + ')  •  ' + job.salaryShow.toString() + ' K',
                                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {
                            // TODO: Implement share functionality
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.bookmark_border),
                          onPressed: () {
                            // TODO: Implement save functionality
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        // _buildInfoChip(Icons.sell, job.jobType),
                        // _buildInfoChip(Icons.money, job.salaryRange),
                        // _buildInfoChip(Icons.verified, job.experience),
                        // _buildInfoChip(Icons.access_time, job.daysRemaining),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      job.fileDescription ?? "No description available",
                      style: const TextStyle(fontSize: 14),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: job.skills.map((skill) => Chip(label: Text("${skill.name ?? ""}"))).toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Expire In : ' + job.experienceYear.toString(),
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البحث عن وظيفة'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          _buildJobsPage(),
          const BookmarkPage(),
          const SettingsPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
