import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'job_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Listings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobListPage(),
    );
  }
}

class JobListPage extends StatefulWidget {
  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  List<dynamic> jobList = [];

  @override
  void initState() {
    super.initState();
    fetchJobList();
  }

  Future<void> fetchJobList() async {
    final response = await http.get(Uri.parse('https://dev-api.talentvibes.io/api/job/public'));
    if (response.statusCode == 200) {
      setState(() {
        jobList = jsonDecode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load job list');
    }
  }

  void _navigateToJobDetail(BuildContext context, dynamic job) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JobDetailPage(job: job)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: ListView.builder(
        itemCount: jobList.length,
        itemBuilder: (context, index) {
          final job = jobList[index];
          return ListTile(
            title: InkWell(
              onTap: () => _navigateToJobDetail(context, job),
              child: Text(job['title']),
            ),
            subtitle: Text(job['company']['name']),
          );
        },
      ),
    );
  }
}
