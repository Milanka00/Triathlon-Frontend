import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore the",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Beautiful "),
                        TextSpan(
                          text: "Space!",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity, 
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search places",
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        // search functionality
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
                 Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Destinations",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  // "View All" button functionality
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text("View All"),
                ),
              ],
            ),
          ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageCard(
                    imageLink: 'assets/springmars.png',
                    caption: "Mars Springs",
                    rating: "4.7",
                    location: "jkat, Mars",
                    onPressed: () {
                      // Navigate to another page
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => DetailPage()),
                      // );
                    },
                  ),
                  // Add more ImageCard 
                ],
              ),
            ),
            // Other content 
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageLink;
  final String caption;
  final String rating;
  final String location;
  final VoidCallback onPressed;

  ImageCard({
    required this.imageLink,
    required this.caption,
    required this.rating,
    required this.location,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageLink),
                fit: BoxFit.cover,
                
              ),
               borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text(rating),
                    Spacer(),
                    ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                      ),
                      child: Text("View"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey,
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
