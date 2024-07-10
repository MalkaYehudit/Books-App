import 'package:books_app/models/book_model.dart';
import 'package:books_app/screen/home_page.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {//לשנות לסטייטפול
  final VoidCallback toggleTheme;
  final bool isDarkMode;


  IntroScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
        //     onPressed: toggleTheme,
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Welcome to the biggest book app in the world",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return GridTile(
                    child: Image.asset(
                      book.imgeURL,
                      fit: BoxFit.cover,
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black,
                      title: Text(
                        book.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      toggleTheme: toggleTheme,
                      isDarkMode: isDarkMode,
                    ),
                  ),
                );
              },
              child: Text("Enter to HomePage"),
            ),
          ],
        ),
      ),
    );
  }
}
