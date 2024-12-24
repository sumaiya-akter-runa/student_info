import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'add_student_screen.dart';
import 'view_students_screen.dart';
import '';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Info App',
          style: TextStyle(
            fontSize: 22, // Slightly smaller font size for AppBar
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF70E1F5), // Light Blue for AppBar
      ),
      body: Container(
        // Set the background gradient (Soft Blue to Peach)
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF3C282), // Soft Peach
              Color(0xFF70E1F5), // Light Blue
              Color(0xFFF3C282), // Soft Peach
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientButton(
                text: 'Add Student',
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Navigating to Add Student",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Color(0xFF87CEEB),
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddStudent()),
                  );
                },
              ),
              SizedBox(height: 30), // Increased space between buttons for balance
              GradientButton(
                text: 'View All Students',
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Navigating to View All Students",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor:Color(0xFF87CEEB),
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewStudentsScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GradientButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF77A9), // Pinkish shade
              Color(0xFF70E1F5), // Light Blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30), // Rounded corners
          border: Border.all(
            width: 2, // Border width
            style: BorderStyle.solid, // Solid border
            color: Colors.black.withOpacity(0.7), // Border color with opacity
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
