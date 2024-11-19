import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

@override
State<ProfileScreen> createState() => _ProfileScreenState();
    
  }

  class _ProfileScreenState extends State<ProfileScreen> {  
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
      return  Scaffold(
            appBar: AppBar(
    leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
            Navigator.pushNamed(context, '/home');
        },
    ),
    title: const Text('Profile ',
    style: TextStyle(color: Colors.white),
    ),
    backgroundColor: const Color.fromARGB(255, 3, 80, 143),
),
  body: SingleChildScrollView(
    child: Column(
      children: [
        Container(

        )
      ],
    ),
  ),

   bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromARGB(255, 3, 80, 143),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/home');
                break;
              case 1:
                Navigator.pushNamed(context, '/explore');
                break;
              case 2:
                Navigator.pushNamed(context, '/bookings');
                break;
              case 3:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          });
        },
        
      ),
      );

  }
}