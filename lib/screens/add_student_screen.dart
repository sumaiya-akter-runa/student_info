import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  void saveStudent() async {
    if (_formKey.currentState!.validate()) {
      final student = {
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'location': locationController.text,
      };

      await DBHelper().insertStudent(student); // Save to SQLite database
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student added successfully!')),
      );
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.purple[700]),
      prefixIcon: Icon(icon, color: Colors.purple),
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.purple, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.purple, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Student Info',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF70E1F5), // Chocolate color for AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [

              Color(0xFFF3C282), // Soft Peach
              Color(0xFF70E1F5),
              Color(0xFFFB77A1) // Light Blue


            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: _buildInputDecoration('Student Name', Icons.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the student\'s name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: phoneController,
                  decoration: _buildInputDecoration('Phone', Icons.phone),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the student\'s phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: _buildInputDecoration('Email', Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the student\'s email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: locationController,
                  decoration: _buildInputDecoration('Location', Icons.location_on),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the student\'s location';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: saveStudent,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFB77A1),
                          Color(0xFFF3C282),// Pinkish gradient start color
                          Color(0xFF87CEEB), // Light blue gradient end color
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        width: 2, // Border width
                        style: BorderStyle.solid, // Solid border
                        color: Colors.black, // Border color
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // Apply padding
                      alignment: Alignment.center,
                      child: Text(
                        'Save/Update',
                        style: TextStyle(
                          fontSize: 20, // Slightly smaller text size
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // White text color
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
