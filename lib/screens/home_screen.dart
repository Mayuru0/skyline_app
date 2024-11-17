            import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


Widget _buildQuickActionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color.fromARGB(255, 3, 80, 143),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildDestinationCard(String name, String imagePath) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Padding(
          padding:  EdgeInsets.only(right: 20),
          child:  Text(
            'Skyline',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)
          ),
        ),
          leading: Padding(
    padding: const EdgeInsets.all(5.0), 
    child: Image.asset(
      "assets/new logo.png",
      fit: BoxFit.contain,
       ),
        ),          

       
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement notifications
            },
            icon: const Icon(Icons.notifications),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person),
            color: Colors.white,
          ),
              IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 3, 80, 143),
      ),
      


      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                "assets/header.jpg",
                fit: BoxFit.cover,
              ),
            ),




            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Book Your Flight',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                 const TextField(
                    decoration: InputDecoration(
                      hintText: 'From',
                      prefixIcon:  Icon(Icons.flight_takeoff),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
              const    TextField(
                    decoration: InputDecoration(
                      hintText: 'To',
                      prefixIcon: const Icon(Icons.flight_land),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Departure',
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Return',
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement search functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 80, 143),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Search Flights',
                      style:TextStyle(color:Colors.white), ),
                      ),
                    ),
                  
                  const SizedBox(height: 24),
                  const Text(
                    'Quick Actions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickActionButton(Icons.airplane_ticket, 'My Bookings'),
                      _buildQuickActionButton(Icons.credit_card, 'Payment'),
                      _buildQuickActionButton(Icons.support_agent, 'Support'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Featured Destinations',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildDestinationCard('New York', 'assets/newyork.jpg'),
                        _buildDestinationCard('Paris', 'assets/Paris1.jpg'),
                        _buildDestinationCard('Tokyo', 'assets/tokyo.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromARGB(255, 3, 80, 143),
        onTap: (index) {
          // TODO: Implement navigation
        },
      ),
    );
  }

  
}
