import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class ViewStudentsScreen extends StatefulWidget {
  @override
  _ViewStudentsScreenState createState() => _ViewStudentsScreenState();
}

class _ViewStudentsScreenState extends State<ViewStudentsScreen> {
  late Future<List<Map<String, dynamic>>> _students;

  @override
  void initState() {
    super.initState();
    _students = DBHelper().getStudents(); // Fetch students from SQLite
  }

  void deleteStudent(int id) async {
    await DBHelper().deleteStudent(id);
    setState(() {
      _students = DBHelper().getStudents(); // Refresh the list
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Student deleted successfully!')),
    );
  }

  void editStudent(Map<String, dynamic> student) {
    Navigator.pushNamed(
      context,
      '/add_student',
      arguments: student,
    ).then((_) {
      setState(() {
        _students = DBHelper().getStudents(); // Refresh the list
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Students Info',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor:  Color(0xFF70E1F5),
      ),
      body: Container(
        color: Color(0xFFF3C282), // Matches background color in the image
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _students,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final students = snapshot.data!;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 21, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor:Color(0xFFFB77A1),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(
                      student['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${student['phone']}'),
                        Text('Email: ${student['email']}'),
                        Text('Location: ${student['location']}'),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Edit') {
                          editStudent(student);
                        } else if (value == 'Delete') {
                          deleteStudent(student['id']);
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'Edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem(
                          value: 'Delete',
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_student').then((_) {
            setState(() {
              _students = DBHelper().getStudents(); // Refresh the list
            });
          });
        },
        backgroundColor: Color(0xFFFB77A1),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}