import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Department',
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => PopupMenuButton(
              icon:
                  Icon(Icons.menu), //don't specify icon if you want 3 dot menu
              color: Colors.blue,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    "Vision and mission",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    "Faculty Members (IT)",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 0) {
                  visionmission(context);
                }
                if (value == 1) {
                  faculty(context);
                }
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            "Welcome To IT Department",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              children: [
                Image.network(
                  'https://img.collegedekhocdn.com/media/img/institute/crawled_images/IMG_6792HR1-750x410.jpg?tr=w-250,h-150',
                  height: 350,
                ),
                Row(children: [
                  Text(
                    "\n\nRecent advancements in the areas of computers, software, networks, internet, communication technology, Big Data, and cloud computing, etc. have made a huge amount of information available to us. \n In this high-tech era, information is something without which industry, individuals cannot survive, and their success depends on the ability to acquire accurate and timely information. Keeping this in mind FAMT started\n the Bachelor of Engineering program in Information Technology (IT) from academic session 2001-2002. \n The emphasis of B.E. in Information Technology curriculum is on Computer Science, Software Development, Networking, Communication, Web Engineering, Security, Multimedia processing, IoT, Cloud Computing, \n Data Analytics, and Soft Computing. Currently, the department’s infrastructure contains three classrooms, six laboratories, a staff room, and a seminar hall.  \n\n",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      child: Text(
                        'Intel Centre of Excellence Lab',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () => intelLab(context),
                    ),
                    RaisedButton(
                      child: Text('Amazon AWS Academy Lab'),
                      color: Colors.blue,
                      onPressed: () => awsLab(context),
                    ),
                    RaisedButton(
                      child: Text(
                        'NVIDIA Developer Program Lab',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () => nvdLab(context),
                    ),
                    RaisedButton(
                      child: Text('IBM Lab'),
                      onPressed: () => ibmLab(context),
                      color: Colors.blue,
                    ),
                    RaisedButton(
                      child: Text(
                        'Palo Alto Network Cybersecurity Academy Lab',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () => cybersecLab(context),
                    ),
                  ],
                ),
                Text("\n"),
                RaisedButton(
                  child: Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () => contactUs(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void contactUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: Text('Mail us at hodit@famt.ac.in'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  void visionmission(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Vision and Mission',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30),
          ),
          content: Column(
            children: [
              Text(
                "\nVision",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
              ),
              Row(children: [
                Text(
                  "The academy aspires to nurture students as leaders who are in tune with global trends, equipped with engineering knowledge\n and practical skills, to excel in creativity and innovation in order to play their part in technological advancement of the nation.",
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              Text(
                "\nMission",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20),
              ),
              Row(children: [
                Text(
                  "1. To become foremost seat of advanced technical learning as a center of excellence in the region.\n2. To offer state of the art facilities and quality education at affordable cost.\n3. To inculcate in students the culture of Play Hard and Play Fair.\n4. To advance sustainable development in the region through opportunities for entrepreneurship and industry-institute \n     interaction.\n5. To create a generation of young professionals who appreciate in all its aspects the necessity of balance between\n     technologicaladvances and traditional values.",
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ])
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  void faculty(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Faculty of Information Technology Engineering ',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30),
          ),
          content: Column(
            children: [
              DataTable(
                columns: [
                  DataColumn(
                      label: Text('Name',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Designation',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Qualification',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Areas of Interest',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Dr. Vinayak A. Bharadi')),
                    DataCell(Text('Hod and Professor')),
                    DataCell(Text('Ph D')),
                    DataCell(Text(
                        'Deep Learning,Block Chain ,Cloud Computing,Big Data Analytic,Digital signal processing')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Mr. Santosh V. jadhav')),
                    DataCell(Text('Associate Professor')),
                    DataCell(Text('M Tech')),
                    DataCell(Text(
                        'Programming Disciplines,Signal Processing,Image Processing,Data science')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Mr Mandar S. Joshi ')),
                    DataCell(Text('Asst Professor')),
                    DataCell(Text('ME')),
                    DataCell(
                        Text('Operating systems,Data Mining,Machine Learning')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Mrs S. Sankereshwari ')),
                    DataCell(Text('Asst Professor')),
                    DataCell(Text('ME')),
                    DataCell(Text('Computer Graphics,Data Structures')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Mr.  Amar R. Palwankar ')),
                    DataCell(Text('Asst Professor')),
                    DataCell(Text('M Tech')),
                    DataCell(Text(
                        'Data Science ,IoT Machine Learning,Deep Learning ')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Mr. Ashish B. Vartak ')),
                    DataCell(Text('Asst Professor')),
                    DataCell(Text('M Tech')),
                    DataCell(
                        Text('Computer Networks,Digital Image Processing')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Ms Priyanka S. Bandagale ')),
                    DataCell(Text('Asst Professor')),
                    DataCell(Text('ME')),
                    DataCell(Text(
                        'Computer Networks, Security,Cryptography,Software Testing,Project Management')),
                  ]),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  void intelLab(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lab 2/1 - Intel Centre of Excellence'),
          content: Text(
              ' Name of Industrial/Research partner: Intel Inc \n\n Nature of MOU/Support given by the industry: Laboratory Setup, Faculty Training \n\n Outcome of MOU/Program: IoE Mini Projects, TE IT Mini Projects, Intel Galileo Board Based Development Project'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void awsLab(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lab 1/1 - Amazon AWS Academy Lab'),
          content: Text(
              ' Name of Industrial/Research partner: Amazon AWS \n\n Nature of MOU/Support given by the industry: Amazon AWS Training and Certification to Faculty \n\n Outcome of MOU/Program: AWS Certification by Students and Faculty'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void nvdLab(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lab 2/3 - NVIDIA Developer Program Lab'),
          content: Text(
              ' Name of Industrial/Research partner: NVIDIA Developer Program \n\n Nature of MOU/Support given by the industry: NVIDIA Titan X Pascal GPU, NVIDIA Developer Program Resources \n\n Outcome of MOU/Program: Deep Learning Research'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void ibmLab(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lab 1/2 - IBM Academic Alliance Lab'),
          content: Text(
              ' Name of Industrial/Research partner: IBM Academic Alliance \n\n Nature of MOU/Support given by the industry: IBM Academic Courses for Staff and Students \n\n Outcome of MOU/Program: Staff and Students Skill Upgradation'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void cybersecLab(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lab 1/2 - Palo Alto Network Cybersecurity Academy Lab'),
          content: Text(
              ' Name of Industrial/Research partner: Palo Alto Network Cybersecurity Academy \n\n Nature of MOU/Support given by the industry: Palo Alto Network Cybersecurity Academy Certification Training to Staff and Students \n\n Outcome of MOU/Program: Total 2 faculty members have been trained and completed Certification. PANW has recognised Dr. V A Bharadi and Prof. A R Kazi as authorized Cybersecurity instructor'),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
