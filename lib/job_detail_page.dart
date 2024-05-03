import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  final dynamic job;

  const JobDetailPage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (job['company']['companyBannerUrl'] != null)
              Stack(
                children: [
                  Container(
                    height: 200, // Set your default height here
                    width: double.infinity,
                    child: Image.network(
                      'https://dev-api.talentvibes.io/api/file/getfile?fullPath=${job['company']['companyBannerUrl']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 120, // Adjust this value to control vertical position of profile picture
                    left: 16,
                    child: ClipOval(
                      child: Container(
                        width: 80,
                        height: 80,
                        color: Colors.white, // White background
                        child: Image.network(
                          'https://dev-api.talentvibes.io/api/file/getfile?fullPath=${job['company']['companyLogoUrl']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            SizedBox(height: 20), // Add space below profile picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job['title'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'VND ${job['minimumPay']} - VND ${job['maximumPay']}',
                    style: TextStyle(color: Color(0xFF00A3E0)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${job['city']['name']} - ${job['role']['name']} - ${job['workLocation']['name']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${job['company']['name']}',
                    style: TextStyle(color: Color(0xFF677483))
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 2, // Number of tabs
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color of tabs
                        borderRadius: BorderRadius.circular(20.0), // Rounded corners
                      ),
                      child: TabBar(
                        unselectedLabelColor: Color(0xFF677483), // Text color of inactive tabs
                        indicator: BoxDecoration(
                          color: Color(0xFF00A3E0), // Background color of active tab
                          borderRadius: BorderRadius.circular(20.0), // Rounded corners
                        ),
                        tabs: [
                          Tab(text: 'Thông tin'),
                          Tab(text: 'Công ty'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200, // Adjust height as needed
                      child: TabBarView(
                        children: [
                          // Content for Tab 1
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                'Yêu cầu công việc', 
                                textAlign: TextAlign.left, 
                                style: TextStyle(color: Color(0xFF1A2F45), 
                                fontWeight: FontWeight.bold, 
                                fontSize: 16,)),
                            ),
                          ),
                          // Content for Tab 2
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                'Về chúng tôi', 
                                textAlign: TextAlign.left, 
                                style: TextStyle(color: Color(0xFF1A2F45), 
                                fontWeight: FontWeight.bold, 
                                fontSize: 16,)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
